using System;
using System.IO;
using System.Diagnostics;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;
using ShaderLibrary; 

namespace ShaderPatcher
{
    class Program
    {
        // Magic method to always work in the directory containing Program.cs
        static string GetSourceDirectory([CallerFilePath] string filePath = "") => Path.GetDirectoryName(filePath);

        static void Main(string[] args)
        {
            Console.WriteLine(">>> AUTO SHADER COMPILER & PATCHER (ARM64 READY) <<<");

            try 
            {
                // Search for all files strictly where the source code resides
                string baseDir = GetSourceDirectory();
                
                // --- SHADER NAME CONFIGURATION ---
                string shaderBaseName = "";

                if (args.Length > 0)
                {
                    shaderBaseName = Path.GetFileNameWithoutExtension(args[0]);
                    shaderBaseName = shaderBaseName.Replace("_vertex", "").Replace("_fragment", "");
                    Console.WriteLine($"Shader name was defined from args: {shaderBaseName}");
                }
                else
                {
                    Console.Write("Type shader name: ");
                    shaderBaseName = Console.ReadLine()?.Trim();
                }

                if (string.IsNullOrEmpty(shaderBaseName))
                {
                    Console.WriteLine("Shader name wasn't provided or provided incorrectly!");
                    return;
                }

                // Paths to source files based on the (_vertex / _fragment) naming scheme
                string inputFile = Path.Combine(baseDir, $"{shaderBaseName}.bnsh");
                string inputGlslVert = Path.Combine(baseDir, $"{shaderBaseName}_vertex.glsl");
                string inputGlslFrag = Path.Combine(baseDir, $"{shaderBaseName}_fragment.glsl");
                
                // Output repack file
                string outputFile = Path.Combine(baseDir, $"{shaderBaseName}_repacked.bnsh");

                // Determine UAM binary (uam.exe for Windows, uam for ARM64/Unix)
                string uamBinary = RuntimeInformation.IsOSPlatform(OSPlatform.Windows) ? "uam.exe" : "uam";
                string uamPath = Path.Combine(baseDir, uamBinary);

                // Check for file existence before starting the pipeline
                if (!File.Exists(uamPath)) throw new FileNotFoundException($"UAM binary not found at: {uamPath}");
                if (!File.Exists(inputFile)) throw new FileNotFoundException($"Original BNSH file not found: {inputFile}");
                if (!File.Exists(inputGlslVert)) throw new FileNotFoundException($"Vertex GLSL not found: {inputGlslVert}");
                if (!File.Exists(inputGlslFrag)) throw new FileNotFoundException($"Fragment GLSL not found: {inputGlslFrag}");

                // =================================================================
                // STEP 1: COMPILE GLSL TO BIN VIA UAM
                // =================================================================
                Console.WriteLine($"\n[1/4] Compiling stages for {shaderBaseName}...");
                
                // Compile Vertex -> v_tmp_program.bin / v_tmp_control.bin
                //CompileShader(uamPath, inputGlslVert, "vert", "v_tmp", baseDir);

                // Compile Fragment -> f_tmp_program.bin / f_tmp_control.bin
                CompileShader(uamPath, inputGlslFrag, "frag", "f_tmp", baseDir);

                string vCode = Path.Combine(baseDir, "v_tmp_program.bin");
                string vCtrl = Path.Combine(baseDir, "v_tmp_control.bin");
                string fCode = Path.Combine(baseDir, "f_tmp_program.bin");
                string fCtrl = Path.Combine(baseDir, "f_tmp_control.bin");

                // =================================================================
                // STEP 2: ASSEMBLY VIA SHADERLIBRARY (BNSH Injection)
                // =================================================================
                Console.WriteLine("\n[2/4] Loading compiled BIN into BNSH structure...");
                byte[] originalRaw = File.ReadAllBytes(inputFile);
                var bnsh = new BnshFile(new MemoryStream(originalRaw));

                bnsh.OriginalBytes = originalRaw;

                // Get access to the first shader variation inside the BNSH
                var variation = bnsh.Variations[0].BinaryProgram;

                // Inject Vertex compiled data
                //if (variation.VertexShader == null) variation.VertexShader = new BnshFile.ShaderCode();
                //variation.VertexShader.ByteCode = File.ReadAllBytes(vCode);
                //variation.VertexShader.ControlCode = File.ReadAllBytes(vCtrl);

                // Inject Fragment compiled data
                if (variation.FragmentShader == null) variation.FragmentShader = new BnshFile.ShaderCode();
                variation.FragmentShader.ByteCode = File.ReadAllBytes(fCode);
                variation.FragmentShader.ControlCode = File.ReadAllBytes(fCtrl);

                // Save intermediate repacked BNSH (it is broken at this stage)
                using (var fs = File.Create(outputFile)) {
                    bnsh.Save(fs);
                }

                // =================================================================
                // STEP 3: FINAL PATCH (BnshPatcherCore Frankenstein Logic)
                // =================================================================
                Console.WriteLine("\n[3/4] Surgical Frankenstein patch and offset fixing...");
                // This step extracts original non-shader blocks and merges them back, fixing offset shifts
                BnshPatcherCore.PerformFinalPatch(inputFile, outputFile);

                // =================================================================
                // STEP 4: CLEANUP TEMPORARY FILES
                // =================================================================
                Console.WriteLine("\n[4/4] Deleting temporary compilation files...");
                if (File.Exists(vCode)) File.Delete(vCode);
                if (File.Exists(vCtrl)) File.Delete(vCtrl);
                if (File.Exists(fCode)) File.Delete(fCode);
                if (File.Exists(fCtrl)) File.Delete(fCtrl);

                Console.WriteLine("\n>>> SUCCESS! Shader is ready for use. <<<");
            } 
            catch (Exception ex) 
            {
                Console.WriteLine("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                Console.WriteLine("CRITICAL ERROR:");
                Console.WriteLine("Message: " + ex.Message);
                Console.WriteLine("\nSTACK TRACE:");
                Console.WriteLine(ex.ToString());
                Console.WriteLine("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            }
        }

        // Method to call UAM directly (supports both ARM64 and Windows)
        static void CompileShader(string uamPath, string glslFile, string stage, string prefix, string workDir)
        {
            // Generate output filenames for this specific stage
            string ctrlFile = $"{prefix}_control.bin";
            string progFile = $"{prefix}_program.bin";
            
            // UAM Arguments: force C-binds, specify control/code outputs, specify stage and input file
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