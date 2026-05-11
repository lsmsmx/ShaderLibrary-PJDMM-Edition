using System;
using System.IO;
using ShaderLibrary;

namespace ShaderPatcher
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("TEST");

            try {
                string baseDir = AppContext.BaseDirectory;
                string inputFile = Path.Combine(baseDir, "sss_copy.bnsh");
                string outputFile = Path.Combine(baseDir, "repacked_original.bnsh");
                byte []  originalRaw = File.ReadAllBytes(inputFile);

                Console.WriteLine("Loading: " + inputFile);
                var bnsh = new BnshFile(new MemoryStream(originalRaw));
                bnsh.OriginalBytes = originalRaw;

                using (var fs = File.Create(outputFile)) {
                    bnsh.Save(fs);
                }
                BnshPatcherCore.PerformFinalPatch(inputFile, outputFile);

                Console.WriteLine("Done!");
            } catch (Exception ex) {
                Console.WriteLine("ERROR: " + ex.Message);
                Console.WriteLine("STACK ERROR:");
                Console.WriteLine(ex.ToString());
            }
        }
    }
}

