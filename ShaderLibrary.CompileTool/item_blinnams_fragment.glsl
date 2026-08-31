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

layout(binding = 4, std140) uniform _NPRParam {
    precise vec4 data[4096];
} fp_c7;

layout(binding = 0) uniform sampler2D g_textures_0_;
layout(binding = 2) uniform sampler2D g_textures_2_;
layout(binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout(binding = 5) uniform samplerCube g_envmap_texture;
layout(binding = 9) uniform samplerCube g_ibl_textures_0_;
layout(binding = 10) uniform samplerCube g_ibl_textures_1_;
layout(binding = 11) uniform samplerCube g_ibl_textures_2_;
layout(binding = 3) uniform sampler2D g_textures_3_;
layout(location = 0) in vec4 in_attr0;
layout(location = 1) in vec4 in_attr1;
layout(location = 2) in vec4 in_attr2;
layout(location = 3) in vec4 in_attr3;
layout(location = 4) in vec4 in_attr4;
layout(location = 5) in vec4 in_attr5;
layout(location = 6) in vec4 in_attr6;
layout(location = 7) in vec4 in_attr7;

layout(location = 0) out vec4 SV_Target0;

void main() {
    bool keep = true;
    bool temp_0;
    precise float temp_1;
    precise float temp_2;
    precise float temp_3;
    precise float temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    precise vec4 temp_11;
    uint temp_12;
    precise float temp_13;
    bool temp_14;
    precise float temp_15;
    precise float temp_16;
    precise float temp_17;
    precise vec2 temp_18;
    uint temp_19;
    precise float temp_20;
    precise float temp_21;
    precise float temp_22;
    precise float temp_23;
    precise float temp_24;
    precise float temp_25;
    precise float temp_26;
    precise float temp_27;
    precise float temp_28;
    precise float temp_29;
    precise float temp_30;
    precise float temp_31;
    precise float temp_32;
    precise float temp_33;
    precise float temp_34;
    precise float temp_35;
    precise float temp_36;
    bool temp_37;
    precise float temp_38;
    bool temp_39;
    precise float temp_40;
    precise float temp_41;
    precise float temp_42;
    precise float temp_43;
    precise float temp_44;
    precise float temp_45;
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
    precise vec3 temp_67;
    precise float temp_68;
    precise float temp_69;
    precise float temp_70;
    precise float temp_71;
    precise float temp_72;
    precise float temp_73;
    precise float temp_74;
    precise float temp_75;
    precise float temp_76;
    precise float temp_77;
    precise float temp_78;
    precise float temp_79;
    precise float temp_80;
    precise float temp_81;
    precise float temp_82;
    precise float temp_83;
    precise float temp_84;
    precise float temp_85;
    precise float temp_86;
    precise float temp_87;
    precise float temp_88;
    precise float temp_89;
    precise float temp_90;
    precise float temp_91;
    precise float temp_92;
    precise float temp_93;
    bool temp_94;
    precise float temp_95;
    precise float temp_96;
    precise float temp_97;
    precise float temp_98;
    precise float temp_99;
    precise float temp_100;
    precise float temp_101;
    precise float temp_102;
    precise float temp_103;
    precise float temp_104;
    bool temp_105;
    precise float temp_106;
    precise float temp_107;
    precise float temp_108;
    precise float temp_109;
    precise float temp_110;
    precise vec3 temp_111;
    precise float temp_112;
    precise float temp_113;
    precise float temp_114;
    precise vec3 temp_115;
    precise float temp_116;
    precise float temp_117;
    precise float temp_118;
    precise float temp_119;
    precise float temp_120;
    bool temp_121;
    bool temp_122;
    precise float temp_123;
    precise float temp_124;
    precise float temp_125;
    precise float temp_126;
    precise float temp_127;
    bool temp_128;
    precise float temp_129;
    precise float temp_130;
    precise float temp_131;
    precise float temp_132;
    precise float temp_133;
    precise float temp_134;
    precise float temp_135;
    bool temp_136;
    precise float temp_137;
    precise float temp_138;
    precise float temp_139;
    precise float temp_140;
    precise float temp_141;
    precise float temp_142;
    precise float temp_143;
    precise float temp_144;
    precise float temp_145;
    precise float temp_146;
    precise float temp_147;
    precise float temp_148;
    precise float temp_149;
    precise float temp_150;
    precise float temp_151;
    precise float temp_152;
    precise float temp_153;
    precise float temp_154;
    precise float temp_155;
    precise float temp_156;
    precise float temp_157;
    precise float temp_158;
    precise float temp_159;
    precise float temp_160;
    precise float temp_161;
    precise float temp_162;
    precise float temp_163;
    precise float temp_164;
    precise float temp_165;
    bool temp_166;
    precise float temp_167;
    precise float temp_168;
    precise float temp_169;
    precise float temp_170;
    precise float temp_171;
    precise float temp_172;
    precise vec3 temp_173;
    precise vec3 temp_174;
    precise float temp_175;
    precise float temp_176;
    precise float temp_177;
    precise float temp_178;
    precise vec4 temp_179;
    precise float temp_180;
    precise float temp_181;
    precise float temp_182;
    precise float temp_183;
    precise float temp_184;
    precise float temp_185;
    precise float temp_186;
    precise float temp_187;
    precise float temp_188;
    precise float temp_189;
    precise float temp_190;
    bool temp_191;
    int temp_192;
    int temp_193;
    int temp_194;
    temp_0 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 2, 2)) == 0;
    temp_1 = intBitsToFloat(undef);
    if(temp_0) {
        temp_1 = fp_c5.data[28].w;
    }
    temp_2 = intBitsToFloat(undef);
    temp_3 = temp_1;
    if(temp_0) {
        temp_2 = fp_c5.data[28].x;
    }
    temp_4 = intBitsToFloat(undef);
    temp_5 = temp_2;
    if(temp_0) {
        temp_4 = fp_c5.data[28].y;
    }
    temp_6 = intBitsToFloat(undef);
    temp_7 = temp_4;
    if(temp_0) {
        temp_6 = fp_c5.data[28].z;
    }
    temp_8 = intBitsToFloat(undef);
    temp_9 = temp_6;
    if(!temp_0) {
        temp_8 = in_attr3.x;
    }
    temp_10 = intBitsToFloat(undef);
    if(!temp_0) {
        temp_10 = in_attr3.y;
    }
    if(!temp_0) {
        temp_11 = texture(g_textures_0_, vec2(temp_8, temp_10)).xyzw;
        temp_3 = temp_11.w;
        temp_5 = temp_11.x;
        temp_7 = temp_11.y;
        temp_9 = temp_11.z;
    }
    temp_12 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 8, 1);
    temp_13 = uintBitsToFloat(temp_12);
    if(temp_3 < min(fp_c5.data[39].z, 0.5)) {
        // discard; // Yuzu crash
        keep = false;
    } else {
        temp_14 = int(temp_12) == 1;
        temp_15 = intBitsToFloat(undef);
        if(temp_14) {
            temp_15 = in_attr3.y;
        }
        temp_16 = temp_15;
        if(temp_14) {
            temp_13 = in_attr3.x;
        }
        temp_17 = temp_13;
        if(temp_14) {
            temp_18 = texture(g_textures_2_, vec2(temp_13, temp_15)).xy;
            temp_16 = temp_18.y;
            temp_17 = temp_18.x;
        }
        temp_19 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1);
        temp_20 = max(temp_3, fp_c5.data[39].w);
        temp_21 = uintBitsToFloat(temp_19);
        if(!(fp_c5.data[39].z < 0.5)) {
            temp_20 = 1.0;
        }
        if(temp_14) {
            temp_22 = fma(temp_16, 2.0, -1.0);
            temp_23 = temp_22 * 2.0 * temp_22 * temp_22;
            temp_24 = fma(temp_22, 1.5, temp_23);
            temp_25 = fma(fma(temp_17, 2.0, -1.0), 1.5, temp_23);
            temp_26 = fma(temp_25, in_attr1.x, temp_24 * in_attr2.x) + in_attr0.x;
            temp_27 = fma(temp_25, in_attr1.y, temp_24 * in_attr2.y) + in_attr0.y;
            temp_28 = fma(temp_25, in_attr1.z, temp_24 * in_attr2.z) + in_attr0.z;
            temp_29 = inversesqrt(fma(temp_28, temp_28, fma(temp_27, temp_27, temp_26 * temp_26)));
            temp_30 = temp_26 * temp_29;
            temp_31 = temp_27 * temp_29;
            temp_32 = temp_28 * temp_29;
        } else {
            temp_33 = in_attr0.x;
            temp_34 = in_attr0.y;
            temp_35 = in_attr0.z;
            temp_36 = inversesqrt(fma(temp_35, temp_35, fma(temp_34, temp_34, temp_33 * temp_33)));
            temp_30 = temp_33 * temp_36;
            temp_31 = temp_34 * temp_36;
            temp_32 = temp_35 * temp_36;
        }
        temp_37 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
        temp_38 = in_attr4.x;
        temp_39 = int(temp_19) != 0;
        temp_40 = in_attr4.y;
        temp_41 = in_attr4.z;
        temp_42 = intBitsToFloat(undef);
        if(temp_37) {
            temp_42 = in_attr5.x;
        }
        temp_43 = intBitsToFloat(undef);
        if(temp_37) {
            temp_43 = in_attr5.y;
        }
        temp_44 = inversesqrt(fma(temp_41, temp_41, fma(temp_40, temp_40, temp_38 * temp_38)));
        temp_45 = temp_38 * temp_44;
        temp_46 = temp_40 * temp_44;
        temp_47 = temp_41 * temp_44;
        temp_48 = fma(temp_47, temp_32, fma(temp_46, temp_31, temp_45 * temp_30));
        temp_49 = fma(temp_48 * -temp_30, 2.0, temp_45);
        temp_50 = fma(temp_48 * -temp_31, 2.0, temp_46);
        temp_51 = fma(temp_48 * -temp_32, 2.0, temp_47);
        temp_52 = fma(temp_50, 0.0 - fp_c4.data[44].y, temp_49 * -fp_c4.data[44].x);
        temp_53 = fma(temp_51, 0.0 - fp_c4.data[43].z, fma(temp_50, 0.0 - fp_c4.data[43].y, temp_49 * -fp_c4.data[43].x));
        temp_54 = fma(temp_51, 0.0 - fp_c4.data[42].z, fma(temp_50, 0.0 - fp_c4.data[42].y, temp_49 * -fp_c4.data[42].x));
        temp_55 = fma(temp_51, 0.0 - fp_c4.data[44].z, temp_52);
        temp_56 = temp_52;
        temp_57 = temp_44;
        temp_58 = temp_49;
        temp_59 = temp_51;
        if(temp_39) {
            temp_56 = max(abs(temp_53), abs(temp_54));
        }
        temp_60 = intBitsToFloat(undef);
        temp_61 = temp_56;
        if(temp_39) {
            temp_60 = max(abs(temp_55), temp_56);
        }
        if(temp_37) {
            temp_61 = texture(g_shadow_depth_textures_0_, vec2(temp_42, temp_43)).x;
        }
        temp_62 = temp_61;
        if(temp_39) {
            temp_57 = 1.0 / temp_60;
        }
        temp_63 = temp_57;
        if(temp_39) {
            temp_58 = temp_55 * temp_57;
        }
        temp_64 = temp_58;
        if(temp_39) {
            temp_21 = temp_54 * temp_57;
        }
        temp_65 = temp_21;
        if(temp_39) {
            temp_59 = temp_53 * temp_57;
        }
        temp_66 = temp_59;
        if(temp_39) {
            temp_67 = texture(g_envmap_texture, vec3(temp_21, temp_59, temp_58)).xyz;
            temp_65 = temp_67.x;
            temp_66 = temp_67.y;
            temp_64 = temp_67.z;
        }
        temp_68 = temp_64;
        temp_69 = temp_65;
        temp_70 = temp_66;
        if(temp_37) {
            temp_63 = in_attr5.z;
        }
        temp_71 = temp_63;
        if(!temp_39) {
            temp_68 = 0.0;
        }
        temp_72 = fma(temp_31, fp_c4.data[43].y, temp_30 * fp_c4.data[43].x);
        temp_73 = fma(temp_32, fp_c4.data[42].z, fma(temp_31, fp_c4.data[42].y, temp_30 * fp_c4.data[42].x));
        temp_74 = fma(temp_32, fp_c4.data[43].z, temp_72);
        temp_75 = fma(temp_31, fp_c4.data[44].y, temp_30 * fp_c4.data[44].x);
        temp_76 = temp_75;
        temp_77 = temp_72;
        if(!temp_39) {
            temp_69 = 0.0;
        }
        if(!temp_39) {
            temp_70 = 0.0;
        }
        temp_78 = fma(temp_32, fp_c4.data[44].z, temp_75);
        if(temp_37) {
            temp_76 = temp_30 * fp_c4.data[26].x;
        }
        temp_79 = temp_73 * fma(temp_47, fp_c4.data[42].z, fma(temp_46, fp_c4.data[42].y, temp_45 * fp_c4.data[42].x));
        temp_80 = temp_76;
        temp_81 = temp_79;
        if(!temp_37) {
            temp_80 = 1.0;
        }
        temp_82 = temp_80;
        if(temp_37) {
            temp_82 = fma(temp_31, fp_c4.data[26].y, temp_80);
        }
        temp_83 = temp_82;
        if(temp_37) {
            temp_83 = fma(temp_32, fp_c4.data[26].z, temp_82);
        }
        temp_84 = temp_83;
        if(temp_37) {
            temp_84 = temp_83 + 1.0;
        }
        temp_85 = 0.0 - clamp(fma(temp_78, fma(temp_47, fp_c4.data[44].z, fma(temp_46, fp_c4.data[44].y, temp_45 * fp_c4.data[44].x)), fma(temp_74, fma(temp_47, fp_c4.data[43].z, fma(temp_46, fp_c4.data[43].y, temp_45 * fp_c4.data[43].x)), temp_79)), 0.0, 1.0) + 1.0;
        temp_86 = temp_84;
        if(temp_37) {
            temp_86 = min(temp_84, 1.0);
        }
        temp_87 = temp_86;
        if(temp_37) {
            temp_87 = temp_86 * temp_86;
        }
        temp_88 = temp_87;
        if(temp_37) {
            temp_62 = 0.0 - temp_63 + temp_61;
        }
        temp_89 = temp_62;
        if(temp_37) {
            temp_71 = temp_87 * temp_87;
        }
        if(temp_37) {
            temp_89 = temp_62 * fp_c4.data[45].x;
        }
        temp_90 = temp_89;
        if(temp_37) {
            temp_90 = temp_89 * fp_c5.data[30].w * 3.0; // Shadow improvement #1
        }
        temp_91 = temp_90;
        if(temp_37) {
            temp_77 = temp_90;
        }
        if(temp_37) {
            temp_91 = exp2(temp_77);
        }
        temp_92 = temp_91;
        if(temp_37) {
            temp_92 = min(temp_91, 1.0);
        }
        if(temp_37) {
            temp_88 = min(temp_92, temp_71);
        }
        temp_93 = temp_85 * temp_85 * temp_85 * temp_85 * temp_85 * fma(temp_88, 0.95, 0.05); // Shadow improvement #2
        temp_94 = (1 & floatBitsToInt(fp_c3.data[0].z)) == 1;
        temp_95 = fma(temp_93, fp_c5.data[33].x, fp_c5.data[33].y);
        temp_96 = temp_95 * fp_c5.data[32].x;
        temp_97 = temp_95 * fp_c5.data[32].y;
        temp_98 = temp_95 * fp_c5.data[32].z;
        temp_99 = fma(temp_93 * fp_c5.data[33].x, 10.0, 1.0) * fp_c5.data[32].w;
        temp_100 = temp_96;
        temp_101 = temp_97;
        temp_102 = temp_98;
        temp_103 = temp_99;
        temp_104 = temp_99;
        if(temp_94) {
            temp_105 = int(bitfieldExtract(floatBitsToUint(fp_c5.data[50].x), 15, 1)) != 0;
            if(temp_105) {
                temp_81 = fp_c7.data[5].z;
            }
            temp_106 = temp_81;
            if(!temp_105) {
                temp_106 = fp_c7.data[5].w;
            }
            if(temp_106 > 0.0) {
                temp_107 = 1.0 / max(abs(temp_78), max(abs(temp_74), abs(temp_73)));
                temp_108 = temp_78 * temp_107;
                temp_109 = temp_73 * temp_107;
                temp_110 = temp_74 * temp_107;
                temp_111 = textureLod(g_ibl_textures_0_, vec3(temp_109, temp_110, temp_108), 1.0).xyz;
                temp_112 = temp_111.x;
                temp_113 = temp_111.y;
                temp_114 = temp_111.z;
                temp_115 = textureLod(g_ibl_textures_0_, vec3(temp_109, temp_110, temp_108), 0.0).xyz;
                temp_116 = fma(temp_115.x + 0.0 - temp_112, temp_88, temp_112);
                temp_117 = fma(temp_115.y + 0.0 - temp_113, temp_88, temp_113);
                temp_118 = fma(temp_115.z + 0.0 - temp_114, temp_88, temp_114);
                temp_119 = sqrt(fma(temp_118, temp_118, fma(temp_117, temp_117, temp_116 * temp_116)));
                temp_120 = 1.0 / fp_c7.data[7].z * temp_119;
                temp_121 = temp_120 > 1.0;
                temp_122 = temp_120 < fp_c7.data[7].w;
                temp_123 = (temp_120 + 0.0 - fp_c7.data[7].w) * (1.0 / (1.0 + 0.0 - fp_c7.data[7].w));
                temp_124 = temp_123;
                temp_125 = temp_119;
                if(temp_121) {
                    temp_124 = 1.0;
                }
                temp_126 = temp_124;
                if(temp_122) {
                    temp_125 = fp_c7.data[7].y;
                }
                temp_127 = temp_125;
                if(!temp_121) {
                    temp_126 = fma(1.0 + 0.0 - fp_c7.data[7].y, temp_123, fp_c7.data[7].y);
                }
                temp_128 = 0.0 < fp_c7.data[6].w;
                if(!temp_122) {
                    temp_127 = temp_126;
                }
                temp_129 = fma(fma(temp_127, fp_c7.data[7].x, 0.0 - temp_117), fp_c7.data[6].w, temp_117);
                temp_130 = fma(fma(temp_127, fp_c7.data[7].x, 0.0 - temp_116), fp_c7.data[6].w, temp_116);
                temp_131 = fma(fma(temp_127, fp_c7.data[7].x, 0.0 - temp_118), fp_c7.data[6].w, temp_118);
                if(!temp_128) {
                    temp_129 = temp_117;
                }
                if(!temp_128) {
                    temp_130 = temp_116;
                }
                if(!temp_128) {
                    temp_131 = temp_118;
                }
                temp_132 = fma(temp_130, temp_106, 0.0 - temp_106) + 1.0;
                temp_133 = fma(temp_129, temp_106, 0.0 - temp_106) + 1.0;
                temp_134 = fma(temp_131, temp_106, 0.0 - temp_106) + 1.0;
            } else {
                temp_132 = 1.0;
                temp_133 = 1.0;
                temp_134 = 1.0;
            }
        }

        // MM+ based ibl shading logic
        else {
            vec3 fb_norm = vec3(temp_73, temp_74, temp_78);
            vec3 fb_lod0 = textureLod(g_ibl_textures_0_, fb_norm, 0.0).xyz;
            vec3 fb_lod1 = textureLod(g_ibl_textures_0_, fb_norm, 1.0).xyz;
            vec3 fb_diff = mix(fb_lod1, fb_lod0, temp_88);
            temp_132 = fb_diff.x;
            temp_133 = fb_diff.y;
            temp_134 = fb_diff.z;
        }

        temp_135 = in_attr6.w;
        if((temp_20 != 1.0 || isnan(temp_20) || isnan(1.0)) && temp_20 <= fp_c5.data[39].z) {
            // discard; // Yuzu crash
            keep = false;
        } else {
            temp_136 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
            temp_137 = fma(temp_132 * fp_c4.data[14].x, fp_c7.data[1].w, temp_135);
            if(!temp_94) {
                temp_137 = fma(temp_132, fp_c4.data[14].x, temp_135);
            }
            temp_138 = temp_137 + fp_c4.data[15].x;
            temp_139 = fma(temp_134, fp_c4.data[14].z, temp_135);
            temp_140 = fma(temp_133 * fp_c4.data[14].y, fp_c7.data[1].w, temp_135);
            temp_141 = fma(temp_134 * fp_c4.data[14].z, fp_c7.data[1].w, temp_135);
            temp_142 = temp_139;
            if(!temp_94) {
                temp_140 = fma(temp_133, fp_c4.data[14].y, temp_135);
            }
            if(!temp_94) {
                temp_141 = temp_139;
            }
            if(!temp_94) {
                temp_142 = temp_138;
            }
            temp_143 = temp_140 + fp_c4.data[15].y;
            temp_144 = temp_142;
            if(temp_94) {
                temp_144 = temp_138 * fp_c7.data[1].y;
            }
            temp_145 = temp_141 + fp_c4.data[15].z;
            temp_146 = temp_143 * fp_c7.data[1].y;
            temp_147 = temp_145 * fp_c7.data[1].y;
            if(!temp_94) {
                temp_146 = temp_143;
            }
            temp_148 = clamp((fma(fma(temp_32, fp_c4.data[33].z, fma(temp_31, fp_c4.data[33].y, temp_30 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
            if(!temp_94) {
                temp_147 = temp_145;
            }
            temp_149 = temp_144 + fp_c5.data[30].x;
            temp_150 = temp_146 + fp_c5.data[30].y;
            temp_151 = temp_147 + fp_c5.data[30].z;
            temp_152 = fma(temp_88, 0.5, 0.5) * fp_c4.data[16].w;
            temp_153 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_148, fp_c4.data[34].x), fp_c4.data[36].z, temp_149);
            if(!temp_136) {
                temp_153 = temp_149;
            }
            temp_154 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_148, fp_c4.data[34].y), fp_c4.data[36].z, temp_150);
            temp_155 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_148, fp_c4.data[34].z), fp_c4.data[36].z, temp_151);
            temp_156 = temp_153;
            if(!temp_136) {
                temp_154 = temp_150;
            }
            temp_157 = temp_154;
            if(!temp_136) {
                temp_155 = temp_151;
            }
            temp_158 = temp_153 * temp_5 * 0.959999979;
            temp_159 = temp_154 * temp_7 * 0.959999979;
            temp_160 = temp_155 * temp_9 * 0.959999979;

            temp_161 = temp_158;
            temp_162 = temp_159;
            temp_163 = temp_160;
            if(int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 22, 2)) != 0) {
                temp_164 = max(abs(temp_53), abs(temp_54));
                temp_165 = 1.0 / max(abs(temp_55), temp_164);
                temp_166 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
                temp_167 = temp_55 * temp_165;
                temp_168 = temp_164;
                temp_169 = temp_165;
                if(temp_166) {
                    temp_157 = in_attr3.x;
                }
                temp_170 = temp_54 * temp_165;
                temp_171 = temp_157;
                if(temp_166) {
                    temp_168 = in_attr3.y;
                }
                temp_172 = temp_53 * temp_165;
                temp_173 = texture(g_ibl_textures_1_, vec3(temp_170, temp_172, temp_167)).xyz;
                temp_174 = texture(g_ibl_textures_2_, vec3(temp_170, temp_172, temp_167)).xyz;
                temp_175 = temp_174.x;
                temp_176 = temp_174.y;
                temp_177 = temp_174.z;
                temp_178 = temp_168;
                if(temp_166) {
                    temp_179 = texture(g_textures_3_, vec2(temp_157, temp_168)).xyzw;
                    temp_156 = temp_179.x;
                    temp_169 = temp_179.y;
                    temp_171 = temp_179.z;
                    temp_178 = temp_179.w;
                }
                temp_180 = fma(temp_173.x + 0.0 - temp_175, fp_c5.data[31].x, temp_175);
                temp_181 = fma(temp_173.y + 0.0 - temp_176, fp_c5.data[31].x, temp_176);
                temp_182 = fma(temp_173.z + 0.0 - temp_177, fp_c5.data[31].x, temp_177);
                temp_183 = min(temp_180, 3.0);
                temp_184 = min(temp_181, 3.0);
                temp_185 = min(temp_182, 3.0);
                if(temp_166) {
                    temp_100 = temp_96 * temp_156;
                }
                if(temp_166) {
                    temp_101 = temp_97 * temp_169;
                }
                if(temp_166) {
                    temp_102 = temp_98 * temp_171;
                }
                if(temp_166) {
                    temp_103 = temp_99 * temp_178;
                }
                temp_104 = temp_103;
                temp_161 = fma(fma(temp_180 + 0.0 - temp_183, temp_88, temp_183) * fp_c4.data[16].x, temp_100, temp_158);
                temp_162 = fma(fma(temp_181 + 0.0 - temp_184, temp_88, temp_184) * fp_c4.data[16].y, temp_101, temp_159);
                temp_163 = fma(fma(temp_182 + 0.0 - temp_185, temp_88, temp_185) * fp_c4.data[16].z, temp_102, temp_160);
            }
            temp_186 = fma(temp_152 * temp_69, temp_104, temp_161);
            if(!temp_39) {
                temp_186 = temp_161;
            }
            temp_187 = fma(temp_152 * temp_70, temp_104, temp_162);
            if(!temp_39) {
                temp_187 = temp_162;
            }
            temp_188 = in_attr5.w;
            temp_189 = fma(temp_152 * temp_68, temp_104, temp_163);
            if(!temp_39) {
                temp_189 = temp_163;
            }
            temp_190 = fma(temp_189, 0.1145, fma(temp_187, 0.5866, temp_186 * 0.298900008));
            temp_191 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
            temp_192 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_190, fp_c4.data[31].x) + 0.0 - temp_186, fp_c4.data[32].w, temp_186)));
            temp_193 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_190, fp_c4.data[31].y) + 0.0 - temp_187, fp_c4.data[32].w, temp_187)));
            temp_194 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_190, fp_c4.data[31].z) + 0.0 - temp_189, fp_c4.data[32].w, temp_189)));
            if(!temp_191) {
                temp_192 = floatBitsToInt(fma(in_attr7.x + 0.0 - temp_186, temp_188, temp_186));
            }
            if(!temp_191) {
                temp_193 = floatBitsToInt(fma(in_attr7.y + 0.0 - temp_187, temp_188, temp_187));
            }
            if(!temp_191) {
                temp_194 = floatBitsToInt(fma(in_attr7.z + 0.0 - temp_189, temp_188, temp_189));
            }
            SV_Target0.x = intBitsToFloat(temp_192);
            SV_Target0.y = intBitsToFloat(temp_193);
            SV_Target0.z = intBitsToFloat(temp_194);
            SV_Target0.w = temp_20;
            //return; /// Yuzu crash
        }
    }
    if(!keep) {
        discard;
    }
}
