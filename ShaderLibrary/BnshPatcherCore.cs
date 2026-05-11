using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Linq;

namespace ShaderLibrary
{
    public static class BnshPatcherCore
    {
        private struct PatchTask 
        { 
            public long Address; 
            public ushort PointerValue; 
            public string Desc; 
        }
        
        private static List<PatchTask> pendingPatches = new List<PatchTask>();

        // Умная маска для Memory Pool Header (начинается с 0x61). 
        // null означает "любой байт" (тот самый ??)
        private static readonly byte?[] MemoryPoolMarker = new byte?[]
        {
            0x61, 0x00, 0x00, 0x00, 0x00, null, 0x00, 0x00,
            0x00, null, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
        };

        // СТРОГИЙ ФИЛЬТР: Никаких ASCII сигнатур + жесткие рамки байтов
        public static bool IsValidPointer(byte[] data, long pos)
        {
            if (data == null || pos + 1 >= data.Length || pos < 0) return false;
            byte b0 = data[pos];
            byte b1 = data[pos + 1];

            // Исключаем куски ASCII строк, чтобы они не считались адресами
            if (b0 == 0x5F && b1 == 0x44) return false; // _D
            if (b0 == 0x5F && b1 == 0x53) return false; // _S
            if (b0 == 0x5F && b1 == 0x52) return false; // _R
            
            // Строго: второй байт адреса должен быть >= 0x0F и не равен 0xFF
            if (b1 < 0x0F || b1 == 0xFF) return false;

            return true;
        }

        public static long GetBlock2Start(byte[] orig, string fileTag = "")
        {
            Console.WriteLine($"[ПОИСК БЛОКА 2] Ищем последний _DIC в {fileTag}...");
            long lastDic = FindPattern(orig, Encoding.ASCII.GetBytes("_DIC"), 0, true);
            if (lastDic == -1) throw new Exception($"Не найден _DIC в {fileTag}");
            
            Console.WriteLine($"[ПОИСК БЛОКА 2] Последний _DIC найден по адресу: 0x{lastDic:X}");
            
            long pos = lastDic + 16;
            int pointersSkipped = 0;
            
            while (pos < orig.Length - 16 && IsValidPointer(orig, pos)) 
            {
                pointersSkipped++;
                pos += 16;
            }
            
            long finalPos = (pos % 16 == 0) ? pos : pos + (16 - (pos % 16));
            Console.WriteLine($"[ПОИСК БЛОКА 2] Пропущено адресов: {pointersSkipped}. Начало бинарных данных: 0x{finalPos:X}");
            return finalPos;
        }

        public static int GetBlock2Size(byte[] orig, long startPos = -1)
        {
            if (startPos == -1) startPos = GetBlock2Start(orig);
            
            // Теперь ищем строго по длинной маске с wildcards
            long endPos = FindPatternWildcard(orig, MemoryPoolMarker, startPos);
            
            if (endPos == -1) throw new Exception("Сложный маркер конца Блока 2 (0x61...) не найден! Проверьте маску.");
            
            Console.WriteLine($"[ПОИСК РАЗМЕРА БЛОКА 2] Маркер конца блока (MemoryPool) найден на 0x{endPos:X}. Размер блока: 0x{endPos - startPos:X}");
            return (int)(endPos - startPos); 
        }

        public static void PerformFinalPatch(string origPath, string repackPath)
        {
            Console.WriteLine("\n=======================================================");
            Console.WriteLine(">>> СТАРТ: BNSH ФРАНКЕНШТЕЙН (ПОЛНОЕ ЛОГИРОВАНИЕ) <<<");
            Console.WriteLine("=======================================================\n");
            
            byte[] orig = File.ReadAllBytes(origPath);
            byte[] repack = File.ReadAllBytes(repackPath);
            pendingPatches.Clear();

            using (var stream = new FileStream(repackPath, FileMode.Open, FileAccess.ReadWrite))
            using (var writer = new BinaryWriter(stream))
            {
                // -----------------------------------------------------------
                // ШАГ 0: ЗАЛИВКА МЯСА И ВЫЧИСЛЕНИЕ ДЕЛЬТЫ
                // -----------------------------------------------------------
                Console.WriteLine("--- ШАГ 0: ВСТАВКА ОРИГИНАЛЬНЫХ КУСКОВ И РАСЧЕТ ДЕЛЬТЫ ---");

                // 1. Копируем блок 0x260 (168 байт)
                Console.WriteLine($"[КОПИРОВАНИЕ] Берем 168 байт из оригинала с 0x260 и пишем в репак на 0x260...");
                byte[] b1 = new byte[168];
                Array.Copy(orig, 0x260, b1, 0, 168);
                writer.BaseStream.Position = 0x260;
                writer.Write(b1);

                // 2. Копируем Блок 2 из оригинала
                long oB2Start = GetBlock2Start(orig, "Оригинал");
                int b2Size = GetBlock2Size(orig, oB2Start);
                byte[] b2_orig = new byte[b2Size];
                Array.Copy(orig, oB2Start, b2_orig, 0, b2Size);

                // Вычисляем старт Блока 2 в репаке, используя дистанцию оригинала
                long oLastDic = FindPattern(orig, Encoding.ASCII.GetBytes("_DIC"), 0, true);
                long rLastDic = FindPattern(repack, Encoding.ASCII.GetBytes("_DIC"), 0, true);
                long distanceB2 = oB2Start - oLastDic; 
                
                long rB2Start = rLastDic + distanceB2; 
                Console.WriteLine($"[ПОИСК БЛОКА 2] Репак: Блок 2 принудительно ставится на 0x{rB2Start:X} (отступ {distanceB2} байт от _DIC)");

                // Пишем ОРИГИНАЛЬНЫЕ адреса под _DIC в репак
                int pointersSize = (int)(distanceB2 - 16);
                if (pointersSize > 0)
                {
                    Console.WriteLine($"[КОПИРОВАНИЕ] Вставляем {pointersSize} байт оригинальных адресов под _DIC...");
                    byte[] origPointers = new byte[pointersSize];
                    Array.Copy(orig, oLastDic + 16, origPointers, 0, pointersSize);
                    writer.BaseStream.Position = rLastDic + 16;
                    writer.Write(origPointers);
                }

                writer.BaseStream.Position = rB2Start;
                writer.Write(b2_orig);

                // 3. Заливаем хвост со строками (начиная от _STR)
                long currentPos = stream.Length; // Берем хвост ровно оттуда, где закончили писать B2
                writer.BaseStream.Position = currentPos;
                long oStrStart = FindPattern(orig, Encoding.ASCII.GetBytes("_STR"));
                long rStrStart = currentPos;

                Console.WriteLine($"[КОПИРОВАНИЕ ХВОСТА] Ориг _STR: 0x{oStrStart:X}. Репак _STR будет на: 0x{rStrStart:X}.");
                Console.WriteLine($"[ЗАПИСЬ] Заливаем хвост оригинала (размер 0x{orig.Length - oStrStart:X})...");
                writer.Write(orig, (int)oStrStart, (int)(orig.Length - oStrStart));

                // === ВЫЧИСЛЯЕМ ДЕЛЬТУ ===
                long strDelta = rStrStart - oStrStart;
                long deltaToApply = 0;
                if (strDelta % 0x1000 == 0) {
                    deltaToApply = strDelta;
                }
                Console.WriteLine($"[=== ДЕЛЬТА ===] Хвост съехал на: +0x{strDelta:X} байт.");
                Console.WriteLine($"[=== ДЕЛЬТА ===] Применяемая дельта к адресам: +0x{deltaToApply:X}");

                // Обновляем буфер репака после записи
                stream.Position = 0;
                repack = new byte[stream.Length];
                stream.Read(repack, 0, (int)stream.Length);

                // -----------------------------------------------------------
                // ШАГ 1: ХЕДЕР 0x10, 0x18
                // -----------------------------------------------------------
                Console.WriteLine("\n--- ШАГ 1: ВОССТАНОВЛЕНИЕ ХЕДЕРА ---");
                PatchByMask(orig, repack, 0x10, 16, rStrStart, "File Name Ptr");
                
                long origRlt = FindPattern(orig, Encoding.ASCII.GetBytes("_RLT"));
                long repackRlt = rStrStart + (origRlt - oStrStart);
                QueuePatch(0x18, (ushort)repackRlt, "RLT Ptr в заголовке");

                // -----------------------------------------------------------
                // ШАГ 2: БЛОК 0x260 (Ссылки Блока 1)
                // -----------------------------------------------------------
                Console.WriteLine("\n--- ШАГ 2: ПАТЧИ 0x280 (ССЫЛКИ БЛОКА 1) ---");
                for (int j = 0; j < 6; j++) 
                {
                    PatchByMask(orig, repack, 0x280 + (j * 8), 32, 0, $"Block1 Link {j}");
                }

                char strPrefix = ((ushort)oStrStart).ToString("X4")[0];
                Console.WriteLine($"[ФИЛЬТР СТРОК] 'Цифра' строковой секции: '{strPrefix}'. Всё, что начинается не на нее — игнорим от дельты.");

                // -----------------------------------------------------------
                // ШАГ 3: АДРЕСА ПОД _DIC
                // -----------------------------------------------------------
                Console.WriteLine("\n--- ШАГ 3: ВОССТАНОВЛЕНИЕ АДРЕСОВ ПОД _DIC (1 К 1) ---");

                List<long> origDics = FindAllPatterns(orig, "_DIC");
                List<long> repackDics = FindAllPatterns(repack, "_DIC");

                int dicCount = Math.Min(origDics.Count, repackDics.Count);
                for (int i = 0; i < dicCount; i++)
                {
                    long oD = origDics[i];
                    long cD = repackDics[i];
                    Console.WriteLine($"\n> Обработка _DIC [{i}]: Ориг=0x{oD:X}, Репак=0x{cD:X}");

                    int childCount = 0;
                    for (int off = 16; off < 256; off += 16)
                    {
                        if (!IsValidPointer(orig, oD + off)) break;

                        ushort origPtr = BitConverter.ToUInt16(orig, (int)(oD + off));

                        // Получаем ПЕРВУЮ из четырех HEX цифр поинтера (например '0' из "0030" или '4' из "4350")
                        char ptrPrefix = origPtr.ToString("X4")[0];

                        // Если она не совпадает с цифрой секции строк — ПРОПУСКАЕМ.
                        if (ptrPrefix != strPrefix)
                        {
                            Console.WriteLine($"  [ФИЛЬТР] Игнорируем псевдо-адрес 0x{origPtr:X4} (первая цифра '{ptrPrefix}' != '{strPrefix}'). Остается без изменений!");
                            continue;
                        }

                        ushort newPtr = (ushort)(origPtr + deltaToApply);
                        Console.WriteLine($"  [УЗЕЛ _DIC] Адрес: 0x{cD + off:X}. Старый поинтер: 0x{origPtr:X4} -> Новый: 0x{newPtr:X4}");
                        QueuePatch(cD + off, newPtr, $"DIC[{i}] Child Offset +0x{off:X}");
                        childCount++;
                    }
                    Console.WriteLine($"> Итого пропатчено адресов под _DIC [{i}]: {childCount}");
                }

                // -----------------------------------------------------------
                // ШАГ 4: СТРОКИ БЛОКА 2
                // -----------------------------------------------------------
                Console.WriteLine("\n--- ШАГ 4: ПАТЧИ АДРЕСОВ ВСТАВЛЕННОГО БЛОКА 2 ---");
                long rB2DataStart = rB2Start;
                int strPatched = 0;

                for (int i = 0; i < b2Size; i += 16)
                {
                    // Первый столбец
                    if (IsValidPointer(orig, oB2Start + i)) {
                        ushort origPtr = BitConverter.ToUInt16(orig, (int)(oB2Start + i));

                        // Тот же строковый визуальный фильтр на первую цифру
                        if (origPtr.ToString("X4")[0] == strPrefix)
                        {
                            ushort newPtr = (ushort)(origPtr + deltaToApply);
                            Console.WriteLine($"  [БЛОК 2 СТРОКА] Адрес: 0x{rB2DataStart + i:X}. Старый: 0x{origPtr:X4} -> Новый: 0x{newPtr:X4}");
                            QueuePatch(rB2DataStart + i, newPtr, "B2 Col 1");
                            strPatched++;
                        }
                    }

                    // Второй столбец
                    if (IsValidPointer(orig, oB2Start + i + 8)) {
                        ushort origPtr = BitConverter.ToUInt16(orig, (int)(oB2Start + i + 8));

                        if (origPtr.ToString("X4")[0] == strPrefix)
                        {
                            ushort newPtr = (ushort)(origPtr + deltaToApply);
                            Console.WriteLine($"  [БЛОК 2 СТРОКА] Адрес: 0x{rB2DataStart + i + 8:X}. Старый: 0x{origPtr:X4} -> Новый: 0x{newPtr:X4}");
                            QueuePatch(rB2DataStart + i + 8, newPtr, "B2 Col 2");
                            strPatched++;
                        }
                    }
                }
                Console.WriteLine($"[БЛОК 2 ИТОГ] Восстановлено адресов: {strPatched}");

                // ===========================================================
                // ПРИМЕНЯЕМ ПАТЧИ В ПАМЯТЬ ПЕРЕД ИНДЕКСАЦИЕЙ
                // ===========================================================
                Console.WriteLine("\n[ПАМЯТЬ] Применяем собранные патчи в буфер репака перед сканированием RLT...");
                foreach (var p in pendingPatches)
                {
                    repack[p.Address] = (byte)(p.PointerValue & 0xFF);
                    repack[p.Address + 1] = (byte)((p.PointerValue >> 8) & 0xFF);
                }

                // -----------------------------------------------------------
                // ШАГ 5: ЛОГИКА _RLT
                // -----------------------------------------------------------
                Console.WriteLine("\n--- ШАГ 5: ЛОГИКА _RLT (ХАРДКОД + СТОЛБЦЫ ПО ИНДЕКСАМ) ---");
                
                QueuePatch(repackRlt + 4, (ushort)repackRlt, "RLT Self-Pointer (+4)");
                Console.WriteLine($"  [RLT ХАРДКОД] Прописан указатель на себя: 0x{repackRlt:X4} по адресу 0x{repackRlt + 4:X}");

                // Используем продвинутый поиск для маркера 0x61
                long orig61 = FindPatternWildcard(orig, MemoryPoolMarker, oB2Start);
                long repack61 = FindPatternWildcard(repack, MemoryPoolMarker, rB2Start);

                if (orig61 != -1 && repack61 != -1)
                {
                    ushort origA1 = BitConverter.ToUInt16(orig, (int)(origRlt + 28)); 
                    int diffFrom61 = origA1 - (int)orig61; 

                    ushort newA1 = (ushort)(repack61 + diffFrom61);
                    ushort newA2 = (ushort)(newA1 + 0x100); 

                    Console.WriteLine($"  [RLT ХАРДКОД] Базовый адрес вычислен: 0x{newA1:X4} (Второй: 0x{newA2:X4})");
                    QueuePatch(repackRlt + 28, newA1, "RLT Hardcode 1 (+28)");
                    QueuePatch(repackRlt + 48, newA1, "RLT Hardcode 2 (+48)");
                    QueuePatch(repackRlt + 72, newA2, "RLT Hardcode 3 (+72)");
                    QueuePatch(repackRlt + 96, newA2, "RLT Hardcode 4 (+96)");
                }
                else
                {
                    Console.WriteLine("  [ОШИБКА RLT ХАРДКОД] Маркер 0x61 (Memory Pool) не найден в оригинале или репаке!");
                }

                // СБОР КАРТЫ АДРЕСОВ ДЛЯ СТОЛБЦОВ
                var origMap = CollectMap(orig, "ОРИГИНАЛ");
                Console.WriteLine("---------------------------------------------------");
                
                var repackMap = CollectMap(repack, "РЕПАК");
                Console.WriteLine("---------------------------------------------------");
                
                Console.WriteLine($"\n[ИТОГ СБОРА RLT] Ориг: {origMap.Count} шт. | Репак: {repackMap.Count} шт.");

                long rltColsStart = repackRlt + 152;
                int rltPatched = 0;

                for (long p = rltColsStart; p <= repack.Length - 2; p += 8)
                {
                    long origP = origRlt + (p - repackRlt);

                    if (IsValidPointer(orig, origP)) 
                    {
                        ushort oldVal = BitConverter.ToUInt16(orig, (int)origP);
                        int idx = origMap.IndexOf(oldVal); 
                        if (idx != -1 && idx < repackMap.Count) 
                        {
                            ushort newVal = repackMap[idx];
                            QueuePatch(p, newVal, $"RLT Col 1 [Idx:{idx}]");
                            Console.WriteLine($"  [ПРИВЯЗКА RLT] Индекс: {idx,3} | ОРИГ: 0x{oldVal:X4} -> РЕПАК: 0x{newVal:X4} | Записано по адресу: 0x{p:X}");
                            rltPatched++;
                        }
                    }
                }
                Console.WriteLine($"\n[RLT СТОЛБЦЫ] Успешно привязано указателей по индексам: {rltPatched}");

                // -----------------------------------------------------------
                // ФИНАЛЬНАЯ ЗАПИСЬ В ФАЙЛ
                // -----------------------------------------------------------
                Console.WriteLine("\n--- ФИНАЛЬНАЯ ЗАПИСЬ ВСЕХ ПАТЧЕЙ В ФАЙЛ ---");
                foreach (var p in pendingPatches) 
                {
                    writer.BaseStream.Position = p.Address;
                    writer.Write(p.PointerValue);
                }

                Console.WriteLine($"[ЗАПИСЬ] Физически перезаписано в файл: {pendingPatches.Count} адресов.");

                // Обновляем размер файла
                writer.BaseStream.Position = 0x1C; 
                writer.Write((uint)stream.Length);
                Console.WriteLine($"[ФИНАЛ] Прописан новый размер файла: 0x{stream.Length:X}");
            }
            
            Console.WriteLine("\n=======================================================");
            Console.WriteLine(">>> ФРАНКЕНШТЕЙН УСПЕШНО ЗАВЕРШЕН! <<<");
            Console.WriteLine("=======================================================\n");
        }

        // ===================================================================================
        // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
        // ===================================================================================

        // Базовый поиск паттерна без Wildcards (для _STR, _DIC и т.д.)
        private static long FindPattern(byte[] data, byte[] pattern, long startOffset = 0, bool searchBackwards = false) 
        {
            if (pattern == null || pattern.Length == 0 || data == null || data.Length == 0) return -1;
            if (searchBackwards) {
                for (long i = data.Length - pattern.Length; i >= startOffset; i--) {
                    bool match = true;
                    for (int j = 0; j < pattern.Length; j++) if (data[i + j] != pattern[j]) { match = false; break; }
                    if (match) return i;
                }
            } else {
                for (long i = startOffset; i <= data.Length - pattern.Length; i++) {
                    bool match = true;
                    for (int j = 0; j < pattern.Length; j++) if (data[i + j] != pattern[j]) { match = false; break; }
                    if (match) return i;
                }
            } return -1;
        }

        // Продвинутый поиск паттерна с Wildcards (null)
        private static long FindPatternWildcard(byte[] data, byte?[] pattern, long startOffset = 0, bool searchBackwards = false)
        {
            if (pattern == null || pattern.Length == 0 || data == null || data.Length == 0) return -1;
            if (searchBackwards) {
                for (long i = data.Length - pattern.Length; i >= startOffset; i--) {
                    bool match = true;
                    for (int j = 0; j < pattern.Length; j++) {
                        if (pattern[j].HasValue && data[i + j] != pattern[j].Value) { match = false; break; }
                    }
                    if (match) return i;
                }
            } else {
                for (long i = startOffset; i <= data.Length - pattern.Length; i++) {
                    bool match = true;
                    for (int j = 0; j < pattern.Length; j++) {
                        if (pattern[j].HasValue && data[i + j] != pattern[j].Value) { match = false; break; }
                    }
                    if (match) return i;
                }
            } return -1;
        }

        private static List<long> FindAllPatterns(byte[] data, string patternStr)
        {
            var results = new List<long>();
            byte[] pattern = Encoding.ASCII.GetBytes(patternStr);
            long pos = -1;
            while ((pos = FindPattern(data, pattern, pos + 1)) != -1)
            {
                results.Add(pos);
            }
            return results;
        }

        private static List<ushort> CollectMap(byte[] data, string tag)
        {
            var map = new List<ushort>();
            long firstDic = FindPattern(data, Encoding.ASCII.GetBytes("_DIC"));
            if (firstDic == -1) return map;

            long startPos = firstDic - 192; // Строго - 0xC0 от первого _DIC
            if (startPos < 0) startPos = 0;
            Console.WriteLine($"\n[СБОР RLT {tag}] _DIC найден на 0x{firstDic:X}. Якорь старта: 0x{startPos:X}");

            int zeroBytesCount = 0;
            for (long p = startPos; p < data.Length - 16; p += 16)
            {
                bool isZeroRow = true;
                for (int i = 0; i < 16; i++) {
                    if (data[p + i] != 0) { isZeroRow = false; break; }
                }

                if (isZeroRow) {
                    zeroBytesCount += 16;
                    if (zeroBytesCount >= 512) {
                        Console.WriteLine($"  [{tag}] Остановка: 96 нулей подряд на 0x{p:X}."); 
                        break; 
                    }
                } else {
                    zeroBytesCount = 0;
                }

                if (IsValidPointer(data, p)) {
                    ushort val = BitConverter.ToUInt16(data, (int)p);
                    map.Add((ushort)p);
                }

                if (IsValidPointer(data, p + 8)) {
                    ushort val = BitConverter.ToUInt16(data, (int)(p + 8));
                    map.Add((ushort)(p + 8));
                }
            }
            File.WriteAllLines($"map_{tag}.txt", map.Select(x => x.ToString("X4")));
            return map;
        }

        private static void PatchByMask(byte[] orig, byte[] repack, long patchAddr, int maskSize, long searchStart, string desc, int forcedVal = -1) 
        {
            ushort targetPtr = (forcedVal != -1) ? (ushort)forcedVal : BitConverter.ToUInt16(orig, (int)patchAddr);
            if (targetPtr <= 0 || targetPtr + maskSize > orig.Length) return;

            byte[] mask = new byte[maskSize]; 
            Array.Copy(orig, targetPtr, mask, 0, maskSize);
            
            long newTargetPtr = FindPattern(repack, mask, searchStart);
            if (newTargetPtr != -1) {
                QueuePatch(patchAddr, (ushort)newTargetPtr, desc);
                Console.WriteLine($"  [МАСКА OK] {desc}: 0x{targetPtr:X4} -> 0x{newTargetPtr:X4} (Запись по 0x{patchAddr:X})");
            }
            else {
                Console.WriteLine($"  [МАСКА ФЕЙЛ] {desc} (0x{patchAddr:X}): Маска не найдена для 0x{targetPtr:X}!");
            }
        }

        private static void QueuePatch(long address, ushort value, string desc) 
        {
            pendingPatches.Add(new PatchTask { Address = address, PointerValue = value, Desc = desc });
        }
    }
}
