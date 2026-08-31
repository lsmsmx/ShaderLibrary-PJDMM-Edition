using System;
using System.IO;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;
using System.Collections.Generic;
using System.Linq;
using ShaderLibrary;

namespace ShaderPatcher
{
    class Program
    {
        // Magic method to always work in the directory containing Program.cs
        static string GetSourceDirectory([CallerFilePath] string filePath = "") => Path.GetDirectoryName(filePath);

        static void Main(string[] args)
        {
            Console.WriteLine(">>> AUTO SHADER COMPILER & BATCH PATCHER (ARM64 READY) <<<");

            try
            {
                string baseDir = GetSourceDirectory();

                // Determine UAM binary (uam.exe for Windows, uam for ARM64/Unix)
                string uamBinary = RuntimeInformation.IsOSPlatform(OSPlatform.Windows) ? "uam.exe" : "uam";
                string uamPath = Path.Combine(baseDir, uamBinary);

                if (!File.Exists(uamPath))
                    throw new FileNotFoundException($"UAM binary not found at: {uamPath}");

                // --- SHADER NAME / PATTERN CONFIGURATION ---
                string inputPattern = "";

                if (args.Length > 0)
                {
                    inputPattern = args[0];
                }
                else
                {
                    Console.WriteLine("\n[Enter pattern like 'sss_skin', 'cloth', 'item' OR press SPACE / ENTER to rebuild ALL]");
                    Console.Write("Type shader name/pattern: ");
                    inputPattern = Console.ReadLine();
                }

                // Check if user pressed space, enter, or typed wildcard for ALL
                bool isAll = string.IsNullOrWhiteSpace(inputPattern) ||
                             inputPattern == " " ||
                             inputPattern.Trim() == "*" ||
                             inputPattern.Trim().Equals("all", StringComparison.OrdinalIgnoreCase);

                string cleanPattern = isAll ? "" : inputPattern.Trim()
                    .Replace("*", "")
                    .Replace("_fragment", "")
                    .Replace("_vertex", "")
                    .Replace(".bnsh", "")
                    .Replace(".glsl", "");

                // Find all valid .bnsh files (excluding repacked ones)
                var allBnshFiles = Directory.GetFiles(baseDir, "*.bnsh")
                    .Select(Path.GetFileNameWithoutExtension)
                    .Where(name => !name.EndsWith("_repacked", StringComparison.OrdinalIgnoreCase) &&
                                   !name.EndsWith("_tmp", StringComparison.OrdinalIgnoreCase))
                    .Distinct(StringComparer.OrdinalIgnoreCase)
                    .ToList();

                List<string> targetShaders;

                if (isAll)
                {
                    targetShaders = allBnshFiles;
                    Console.WriteLine($"\n>> [BATCH MODE] Rebuilding ALL ({targetShaders.Count}) shaders in directory...");
                }
                else
                {
                    targetShaders = allBnshFiles
                        .Where(name => name.IndexOf(cleanPattern, StringComparison.OrdinalIgnoreCase) >= 0)
                        .ToList();

                    Console.WriteLine($"\n>> Found {targetShaders.Count} shader(s) matching '{inputPattern}':");
                    foreach (var s in targetShaders) Console.WriteLine($"   - {s}");
                }

                if (targetShaders.Count == 0)
                {
                    Console.WriteLine("\n❌ No matching shaders found to compile!");
                    return;
                }

                int successCount = 0;
                int failCount = 0;

                // Process each shader in batch
                for (int i = 0; i < targetShaders.Count; i++)
                {
                    string shader = targetShaders[i];
                    Console.WriteLine($"\n=======================================================");
                    Console.WriteLine($"[{i + 1}/{targetShaders.Count}] COMPILING & PATCHING: {shader}");
                    Console.WriteLine($"=======================================================");

                    bool ok = ProcessSingleShader(shader, baseDir, uamPath);
                    if (ok) successCount++;
                    else failCount++;
                }

                Console.WriteLine($"\n=======================================================");
                Console.WriteLine($"🏁 BATCH FINISHED: {successCount} succeeded, {failCount} failed.");
                Console.WriteLine("=======================================================");
            }
            catch (Exception ex)
            {
                Console.WriteLine("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.WriteLine("CRITICAL ERROR: " + ex.Message);
                Console.WriteLine("\nSTACK TRACE:");
                Console.WriteLine(ex.ToString());
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            }
        }

        // Handles compiling and repacking for a single shader
        static bool ProcessSingleShader(string shaderBaseName, string baseDir, string uamPath)
        {
            try
            {
                string inputFile = Path.Combine(baseDir, $"{shaderBaseName}.bnsh");
                string inputGlslFrag = Path.Combine(baseDir, $"{shaderBaseName}_fragment.glsl");
                string outputFile = Path.Combine(baseDir, $"{shaderBaseName}_repacked.bnsh");

                if (!File.Exists(inputFile))
                {
                    Console.WriteLine($"⚠️ Original BNSH not found: {inputFile}. Skipping.");
                    return false;
                }
                if (!File.Exists(inputGlslFrag))
                {
                    Console.WriteLine($"⚠️ Fragment GLSL not found: {inputGlslFrag}. Skipping.");
                    return false;
                }

                // =================================================================
                // STEP 1: COMPILE GLSL TO BIN VIA UAM
                // =================================================================
                Console.WriteLine($"[1/4] Compiling fragment GLSL for {shaderBaseName}...");
                CompileShader(uamPath, inputGlslFrag, "frag", "f_tmp", baseDir);

                string fCode = Path.Combine(baseDir, "f_tmp_program.bin");
                string fCtrl = Path.Combine(baseDir, "f_tmp_control.bin");

                // =================================================================
                // STEP 2: ASSEMBLY VIA SHADERLIBRARY (BNSH Injection)
                // =================================================================
                Console.WriteLine("[2/4] Loading compiled BIN into BNSH structure...");
                byte[] originalRaw = File.ReadAllBytes(inputFile);
                var bnsh = new BnshFile(new MemoryStream(originalRaw));

                bnsh.OriginalBytes = originalRaw;

                var variation = bnsh.Variations[0].BinaryProgram;

                if (variation.FragmentShader == null) variation.FragmentShader = new BnshFile.ShaderCode();
                variation.FragmentShader.ByteCode = File.ReadAllBytes(fCode);
                variation.FragmentShader.ControlCode = File.ReadAllBytes(fCtrl);

                using (var fs = File.Create(outputFile)) {
                    bnsh.Save(fs);
                }

                // =================================================================
                // STEP 3: FINAL PATCH (BnshPatcherCore Frankenstein Logic)
                // =================================================================
                Console.WriteLine("[3/4] Surgical Frankenstein patch and offset fixing...");
                BnshPatcherCore.PerformFinalPatch(inputFile, outputFile);

                // =================================================================
                // STEP 4: CLEANUP TEMPORARY FILES
                // =================================================================
                Console.WriteLine("[4/4] Deleting temporary compilation files...");
                if (File.Exists(fCode)) File.Delete(fCode);
                if (File.Exists(fCtrl)) File.Delete(fCtrl);

                Console.WriteLine($"✅ SUCCESS: {shaderBaseName}_repacked.bnsh is ready!");
                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"❌ ERROR compiling {shaderBaseName}: {ex.Message}");
                return false;
            }
        }

        // Method to call UAM directly (supports both ARM64 and Windows)
        static void CompileShader(string uamPath, string glslFile, string stage, string prefix, string workDir)
        {
            string ctrlFile = $"{prefix}_control.bin";
            string progFile = $"{prefix}_program.bin";

            string args = $"--glslcbinds --nvnctrl=\"{ctrlFile}\" --nvngpu=\"{progFile}\" -s {stage} \"{glslFile}\"";

            var startInfo = new ProcessStartInfo
            {
                FileName = uamPath,
                Arguments = args,
                RedirectStandardError = true,
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true,
                WorkingDirectory = workDir
            };

            using (var process = Process.Start(startInfo))
            {
                process.WaitForExit();

                if (process.ExitCode != 0)
                {
                    string errorLog = process.StandardError.ReadToEnd();
                    throw new Exception($"UAM Compilation Error [{stage}]:\n{errorLog}");
                }
            }
        }
    }
}
