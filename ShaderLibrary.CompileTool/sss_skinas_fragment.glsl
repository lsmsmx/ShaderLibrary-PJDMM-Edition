#version 450 core
#extension GL_ARB_gpu_shader_int64 : enable
#extension GL_ARB_shader_ballot : enable
#extension GL_ARB_shader_group_vote : enable
#extension GL_EXT_shader_image_load_formatted : enable
#extension GL_EXT_texture_shadow_lod : enable
#extension GL_ARB_fragment_shader_interlock : enable
#extension GL_NV_viewport_array2 : enable
#pragma optionNV(fastmath off)

const int undef = 0;

layout(binding = 0, std140) uniform _Shader {
    precise vec4 data[4096];
} fp_c3;

layout(binding = 2, std140) uniform _Batch {
    precise vec4 data[4096];
} fp_c5;

layout(binding = 1, std140) uniform _Scene {
    precise vec4 data[4096];
} fp_c4;

layout(binding = 0) uniform sampler2D g_textures_0_;
layout(binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout(binding = 3) uniform sampler2D g_textures_3_;
layout(binding = 9) uniform samplerCube g_ibl_textures_0_;
layout(location = 0) in vec4 in_attr0;
layout(location = 1) in vec4 in_attr1;
layout(location = 2) in vec4 in_attr2;
layout(location = 3) in vec4 in_attr3;
layout(location = 4) in vec4 in_attr4;

layout(location = 0) out vec4 SV_Target0;

void main() {
    bool keep = true;
    precise float temp_0;
    precise float temp_1;
    precise float temp_2;
    precise float temp_3;
    precise float temp_4;
    int temp_5;
    bool temp_6;
    int temp_7;
    int temp_8;
    int temp_9;
    precise float temp_10;
    precise float temp_11;
    precise float temp_12;
    precise float temp_13;
    bool temp_14;
    uint temp_15;
    precise float temp_16;
    precise float temp_17;
    precise float temp_18;
    precise float temp_19;
    precise float temp_20;
    precise float temp_21;
    precise float temp_22;
    int temp_23;
    int temp_24;
    bool temp_25;
    precise float temp_26;
    int temp_27;
    int temp_28;
    int temp_29;
    int temp_30;
    int temp_31;
    int temp_32;
    int temp_33;
    precise float temp_34;
    precise float temp_35;
    precise float temp_36;
    int temp_37;
    precise float temp_38;
    precise float temp_39;
    precise float temp_40;
    uint temp_41;
    bool temp_42;
    precise float temp_43;
    precise float temp_44;
    precise vec3 temp_45;
    precise float temp_46;
    precise float temp_47;
    precise float temp_48;
    precise float temp_49;
    precise float temp_50;
    precise float temp_51;
    precise float temp_52;
    precise float temp_53;
    precise float temp_54;
    precise float temp_55;
    precise float temp_56;
    precise float temp_57;
    precise float temp_58;
    precise float temp_59;
    precise float temp_60;
    precise float temp_61;
    precise float temp_62;
    precise float temp_63;
    precise float temp_64;
    precise float temp_65;
    precise float temp_66;
    precise float temp_67;
    precise float temp_68;
    precise float temp_69;
    bool temp_70;
    precise float temp_71;
    precise float temp_72;
    precise float temp_73;
    precise float temp_74;
    precise float temp_75;
    precise float temp_76;
    precise float temp_77;
    precise float temp_78;
    precise float temp_79;
    precise vec3 temp_80;
    precise float temp_81;
    precise float temp_82;
    precise float temp_83;
    precise float temp_84;
    precise float temp_85;
    bool temp_86;
    precise float temp_87;
    bool temp_88;
    precise float temp_89;
    precise float temp_90;
    precise float temp_91;
    precise float temp_92;
    bool temp_93;
    precise float temp_94;
    precise float temp_95;
    precise float temp_96;
    precise float temp_97;
    precise float temp_98;
    precise vec3 temp_99;
    precise float temp_100;
    precise float temp_101;
    precise float temp_102;
    precise float temp_103;
    precise float temp_104;
    precise float temp_105;
    precise float temp_106;
    precise float temp_107;
    precise vec3 temp_108;
    precise float temp_109;
    precise float temp_110;
    precise float temp_111;
    precise float temp_112;
    precise float temp_113;
    precise float temp_114;
    precise float temp_115;
    precise float temp_116;
    precise float temp_117;
    precise float temp_118;
    precise float temp_119;
    precise float temp_120;
    precise float temp_121;
    int temp_122;
    precise float temp_123;
    bool temp_124;
    precise float temp_125;
    int temp_126;
    precise float temp_127;
    precise float temp_128;
    precise float temp_129;
    int temp_130;
    int temp_131;
    int temp_132;
    int temp_133;
    int temp_134;
    temp_25 = false;
    temp_0 = in_attr1.x;
    temp_1 = in_attr1.y;
    temp_2 = in_attr0.x;
    temp_3 = in_attr0.y;
    temp_4 = in_attr0.z;
    temp_5 = 1 & floatBitsToInt(fp_c3.data[0].z);
    temp_6 = temp_5 == 1;
    temp_7 = 1;
    temp_8 = 0;
    temp_9 = 0;
    if(texture(g_textures_0_, vec2(temp_0, temp_1)).w < fp_c5.data[41].w) {
        //discard; // Yuzu crash
        keep = false;
    } else {
        // prevent from NaN crash on zero-length normals;
        temp_10 = inversesqrt(fma(temp_4, temp_4, fma(temp_3, temp_3, temp_2 * temp_2)) + 0.000001);

        temp_11 = temp_2 * temp_10;
        temp_12 = temp_3 * temp_10;
        temp_13 = temp_4 * temp_10;
        if(temp_6) {
            temp_14 = fp_c5.data[30].w < 0.15;
            temp_15 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1);
            temp_16 = fma(temp_13, fp_c4.data[58].z, fma(temp_12, fp_c4.data[58].y, temp_11 * fp_c4.data[58].x)) + 2.0;
            temp_17 = intBitsToFloat(undef);
            temp_18 = uintBitsToFloat(temp_15);
            temp_19 = temp_16;
            if(temp_14) {
                temp_17 = 100.0;
            }
            temp_20 = int(floatBitsToUint(fp_c3.data[0].y) >> 31) == 1 ? 1.0 : 0.0;
            temp_21 = temp_17;
            temp_22 = temp_20;
            if(!temp_14) {
                temp_21 = temp_16;
            }
            temp_23 = floatBitsToInt((fma(temp_13, fp_c4.data[59].z, fma(temp_12, fp_c4.data[59].y, temp_11 * fp_c4.data[59].x)) + 2.0) * temp_20);
            temp_24 = floatBitsToInt(temp_20 * temp_21);
            temp_25 = !(int(temp_15) == 1);
            if(!temp_25) {
                temp_26 = fp_c4.data[31].y + 0.0 - fp_c4.data[32].y;
                temp_22 = temp_26;
                temp_18 = fp_c4.data[31].z;
                temp_19 = fma(fp_c4.data[31].z + 0.0 - fp_c4.data[32].z, fp_c4.data[31].z + 0.0 - fp_c4.data[32].z, fma(temp_26, temp_26, (fp_c4.data[31].x + 0.0 - fp_c4.data[32].x) * (fp_c4.data[31].x + 0.0 - fp_c4.data[32].x)));
                temp_7 = 0;
                temp_8 = 0x42C80000;
                temp_9 = 0x3F800000;
                temp_25 = true;
            }
        } else {
            temp_23 = 0;
            temp_24 = 0;
            temp_22 = intBitsToFloat(undef);
            temp_18 = intBitsToFloat(undef);
            temp_19 = intBitsToFloat(undef);
        }
        temp_25 = false;
        temp_27 = 0;
        temp_28 = temp_8;
        temp_29 = temp_7;
        temp_30 = 0;
        temp_31 = temp_8;
        temp_32 = 0;
        temp_33 = temp_9;
        temp_34 = temp_22;
        temp_35 = temp_18;
        temp_36 = temp_19;
        if(!(temp_7 != 0)) {
            SV_Target0.x = 0.0;
            SV_Target0.y = intBitsToFloat(temp_8);
            SV_Target0.z = 0.0;
            SV_Target0.w = intBitsToFloat(temp_9);
            //return; This causes crash on yuzu;
        } else {
            if(!((floatBitsToInt(fp_c3.data[0].w) & 1) != 0)) {
                if(temp_6) {
                    temp_27 = temp_23;
                }
                temp_37 = temp_27;
                if(temp_6) {
                    temp_28 = temp_24;
                }
                temp_29 = 0;
                temp_30 = floatBitsToInt(fp_c5.data[41].x);
                temp_31 = temp_28;
                temp_33 = 0x3C23D70A;
                if(!temp_6) {
                    temp_37 = floatBitsToInt(fp_c5.data[41].z);
                }
                temp_32 = temp_37;
                if(!temp_6) {
                    temp_31 = floatBitsToInt(fp_c5.data[41].y);
                }
            }
            temp_38 = intBitsToFloat(temp_31);
            temp_39 = intBitsToFloat(temp_32);
            temp_40 = intBitsToFloat(temp_33);
            if(!(temp_29 != 0)) {
                SV_Target0.x = intBitsToFloat(temp_30);
                SV_Target0.y = intBitsToFloat(temp_31);
                SV_Target0.z = intBitsToFloat(temp_32);
                SV_Target0.w = intBitsToFloat(temp_33);
                //return; This causes crash on yuzu;
            } else {
                temp_41 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1);
                temp_42 = int(temp_41) != 0;
                temp_43 = uintBitsToFloat(temp_41);
                if(temp_42) {
                    temp_38 = in_attr2.x;
                }
                temp_44 = temp_38;
                if(temp_42) {
                    temp_39 = in_attr2.y;
                }
                if(temp_42) {
                    temp_44 = texture(g_shadow_depth_textures_0_, vec2(temp_38, temp_39)).x;
                }
                temp_45 = texture(g_textures_3_, vec2(temp_0, temp_1)).yzw;
                temp_46 = temp_45.x;
                temp_47 = temp_45.y;
                temp_48 = temp_45.z;
                temp_49 = temp_44;
                temp_50 = temp_46;
                temp_51 = temp_47;
                temp_52 = temp_46;
                temp_53 = temp_47;
                if(temp_42) {
                    temp_40 = in_attr2.z;
                }
                temp_54 = temp_40;
                if(temp_42) {
                    temp_43 = temp_11 * fp_c4.data[26].x;
                }
                temp_55 = intBitsToFloat(undef);
                temp_56 = temp_43;
                if(!temp_42) {
                    temp_55 = 1.0;
                }
                temp_57 = temp_55;
                if(temp_42) {
                    temp_56 = fma(temp_12, fp_c4.data[26].y, temp_43);
                }
                temp_58 = fma(temp_12, fp_c4.data[42].y, temp_11 * fp_c4.data[42].x);
                temp_59 = temp_56;
                temp_60 = temp_58;
                if(temp_42) {
                    temp_59 = fma(temp_13, fp_c4.data[26].z, temp_56);
                }
                temp_61 = temp_59;
                if(temp_42) {
                    temp_61 = temp_59 + 1.0;
                }
                temp_62 = temp_61;
                if(temp_42) {
                    temp_62 = min(temp_61, 1.0);
                }
                temp_63 = temp_62;
                if(temp_42) {
                    temp_63 = temp_62 * temp_62;
                }
                temp_64 = temp_63;
                if(temp_42) {
                    temp_64 = temp_63 * temp_63;
                }
                if(temp_42) {
                    temp_54 = 0.0 - temp_40 + temp_44;
                }
                temp_65 = temp_54;
                if(temp_42) {
                    temp_65 = temp_54 * fp_c4.data[45].x;
                }
                temp_66 = temp_65;
                if(temp_42) {
                    temp_66 = temp_65 * fp_c5.data[30].w * 2.5; // Shadow improvement #1
                }
                temp_67 = temp_66;
                if(temp_42) {
                    temp_34 = temp_66;
                }
                temp_68 = temp_34;
                if(temp_42) {
                    temp_49 = exp2(temp_34);
                }
                temp_69 = temp_49;
                if(temp_42) {
                    temp_69 = min(temp_49, 1.0);
                }
                if(temp_42) {
                    temp_57 = min(temp_69, temp_64);
                }
                temp_70 = temp_57 == 1.0;
                temp_71 = fma(temp_13, fp_c4.data[43].z, fma(temp_12, fp_c4.data[43].y, temp_11 * fp_c4.data[43].x));
                temp_72 = fma(temp_13, fp_c4.data[42].z, temp_58);
                if(temp_42) {
                    temp_67 = temp_57;
                }
                temp_73 = fma(temp_13, fp_c4.data[44].z, fma(temp_12, fp_c4.data[44].y, temp_11 * fp_c4.data[44].x));
                temp_74 = temp_67;
                if(temp_70) {
                    temp_60 = max(abs(temp_71), abs(temp_72));
                }
                temp_75 = temp_60;
                if(temp_70) {
                    temp_35 = max(abs(temp_73), temp_60);
                }
                temp_76 = temp_35;
                if(temp_70) {
                    temp_76 = 1.0 / temp_35;
                }
                if(temp_70) {
                    temp_75 = temp_72 * temp_76;
                }
                temp_77 = temp_75;
                if(temp_70) {
                    temp_68 = temp_71 * temp_76;
                }
                temp_78 = temp_68;
                if(temp_70) {
                    temp_36 = temp_73 * temp_76;
                }
                temp_79 = temp_36;
                if(temp_70) {
                    temp_80 = textureLod(g_ibl_textures_0_, vec3(temp_75, temp_68, temp_36), 0.0).xyz;
                    temp_78 = temp_80.y;
                    temp_79 = temp_80.z;
                    temp_77 = temp_80.x;
                }
                temp_81 = temp_78;
                temp_82 = fp_c3.data[0].y;
                temp_83 = temp_79;
                temp_84 = temp_78;
                temp_85 = temp_77;
                if(!temp_42) {
                    temp_74 = 1.0;
                }
                temp_86 = temp_5 != 1;
                temp_87 = in_attr3.w;
                temp_88 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
                temp_89 = fma(temp_48 * temp_74, 1.0, 0.0) * in_attr4.w; // Shadow improvement #2
                temp_90 = temp_89;
                temp_91 = temp_89;
                temp_92 = fp_c4.data[14].y;
                if(!temp_70) {
                    temp_93 = temp_57 == 0.0;
                    temp_94 = max(abs(temp_73), max(abs(temp_71), abs(temp_72)));
                    temp_95 = 1.0 / temp_94;
                    temp_96 = temp_72 * temp_95;
                    temp_97 = temp_71 * temp_95;
                    temp_98 = temp_73 * temp_95;
                    temp_99 = textureLod(g_ibl_textures_0_, vec3(temp_96, temp_97, temp_98), 1.0).xyz;
                    temp_100 = temp_99.x;
                    temp_101 = temp_99.y;
                    temp_102 = temp_99.z;
                    temp_103 = temp_96;
                    temp_104 = temp_97;
                    temp_105 = temp_98;
                    temp_106 = temp_94;
                    temp_107 = temp_100;
                    if(!temp_93) {
                        temp_108 = textureLod(g_ibl_textures_0_, vec3(temp_96, temp_97, temp_98), 0.0).xyz;
                        temp_103 = temp_108.x;
                        temp_104 = temp_108.y;
                        temp_105 = temp_108.z;
                    }
                    if(temp_93) {
                        temp_106 = temp_100;
                    }
                    temp_109 = temp_106;
                    if(!temp_93) {
                        temp_81 = temp_103 + 0.0 - temp_100;
                    }
                    temp_110 = temp_81;
                    if(!temp_93) {
                        temp_82 = temp_104 + 0.0 - temp_101;
                    }
                    temp_111 = intBitsToFloat(undef);
                    if(!temp_93) {
                        temp_111 = temp_105 + 0.0 - temp_102;
                    }
                    if(!temp_93) {
                        temp_90 = temp_100;
                    }
                    temp_91 = temp_90;
                    if(temp_93) {
                        temp_110 = temp_101;
                    }
                    temp_112 = temp_110;
                    if(temp_93) {
                        temp_107 = temp_102;
                    }
                    temp_113 = temp_107;
                    if(!temp_93) {
                        temp_109 = fma(temp_110, temp_57, temp_107);
                    }
                    temp_85 = temp_109;
                    if(!temp_93) {
                        temp_112 = fma(temp_82, temp_57, temp_101);
                    }
                    temp_84 = temp_112;
                    if(!temp_93) {
                        temp_50 = temp_101;
                    }
                    temp_52 = temp_50;
                    if(!temp_93) {
                        temp_51 = temp_102;
                    }
                    temp_53 = temp_51;
                    if(!temp_93) {
                        temp_113 = fma(temp_111, temp_57, temp_102);
                    }
                    temp_83 = temp_113;
                }

                // restore correctly blended cubemap; supposedly fix red eyes and less dark shadow, by not letting it get junky;
                temp_91 = temp_85;
                temp_52 = temp_84;
                temp_53 = temp_83;

                temp_114 = clamp((fma(fma(temp_13, fp_c4.data[33].z, fma(temp_12, fp_c4.data[33].y, temp_11 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
                temp_115 = fp_c4.data[14].x;
                temp_116 = fp_c4.data[34].y;
                temp_117 = temp_52;
                temp_118 = temp_53;
                temp_119 = temp_91;
                if(temp_86) {
                    temp_92 = fma(temp_83, fp_c4.data[14].z, fp_c4.data[15].z);
                }
                temp_120 = temp_92;
                if(temp_86) {
                    temp_115 = fma(temp_84, fp_c4.data[14].y, fp_c4.data[15].y);
                }
                temp_121 = temp_115;
                if(!temp_86) {
                    temp_120 = temp_83;
                }
                if(!temp_86) {
                    temp_121 = temp_84;
                }
                temp_122 = floatBitsToInt(temp_121);
                if(temp_86) {
                    temp_116 = fma(temp_85, fp_c4.data[14].x, fp_c4.data[15].x);
                }
                temp_123 = temp_116;
                if(!temp_86) {
                    temp_123 = temp_85;
                }
                temp_124 = temp_48 > 0.99;
                if(temp_88) {
                    temp_117 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_114, fp_c4.data[34].y), fp_c4.data[36].z, 0.0);
                } else {
                    temp_117 = 0.0; // green, prevent from glow
                }
                temp_125 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_114, fp_c4.data[34].x), fp_c4.data[36].z, 0.0);
                temp_126 = floatBitsToInt(temp_125);
                if(temp_88) {
                    temp_118 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_114, fp_c4.data[34].z), fp_c4.data[36].z, 0.0);
                } else {
                    temp_118 = 0.0; // blue,prevent from glow
                }
                temp_127 = fma(temp_89, fp_c4.data[28].z, temp_120) + temp_87;
                temp_128 = fma(temp_89 * fp_c4.data[28].y, 0.9, temp_121) + temp_87;
                temp_129 = fma(temp_89, fp_c4.data[28].x, temp_123) + temp_87;
                if(temp_6) {
                    temp_122 = temp_23;
                }
                temp_130 = temp_122;
                if(temp_88) {
                    temp_119 = temp_125;
                } else {
                    temp_119 = 0.0; // red, prevent from glow
                }
                if(temp_6) {
                    temp_126 = temp_24;
                }
                temp_131 = floatBitsToInt(temp_127 + temp_118);
                temp_132 = floatBitsToInt(temp_128 + temp_117);
                temp_133 = temp_126;
                if(!temp_124) {
                    temp_131 = floatBitsToInt(temp_127);
                }
                if(!temp_124) {
                    temp_132 = floatBitsToInt(temp_128);
                }
                temp_134 = floatBitsToInt(temp_129 + temp_119);
                if(!temp_124) {
                    temp_134 = floatBitsToInt(temp_129);
                }
                if(!temp_6) {
                    temp_130 = temp_131;
                }
                if(!temp_6) {
                    temp_133 = temp_132;
                }
                SV_Target0.x = intBitsToFloat(temp_134);
                SV_Target0.y = intBitsToFloat(temp_133);
                SV_Target0.z = intBitsToFloat(temp_130);
                SV_Target0.w = 1.0;
                //return; This causes crash on yuzu;
            }

        }
    }
    if(!keep) {
        discard;
    }
}
