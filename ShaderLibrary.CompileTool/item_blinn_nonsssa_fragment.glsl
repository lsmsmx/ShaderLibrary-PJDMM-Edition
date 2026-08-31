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

layout(binding = 0, std140) uniform _support_buffer {
    uint alpha_test;
    uint is_bgra[8];
    precise vec4 viewport_inverse;
    precise vec4 viewport_size;
    int frag_scale_count;
    precise float render_scale[73];
    ivec4 tfe_offset;
    int tfe_vertex_count;
} support_buffer;

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
layout(location = 1) out vec4 SV_Target1;

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
    precise float temp_19;
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
    precise float temp_37;
    precise float temp_38;
    precise float temp_39;
    precise float temp_40;
    precise float temp_41;
    bool temp_42;
    precise float temp_43;
    bool temp_44;
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
    precise float temp_67;
    precise float temp_68;
    precise float temp_69;
    precise float temp_70;
    precise float temp_71;
    precise float temp_72;
    precise float temp_73;
    precise float temp_74;
    precise float temp_75;
    precise float temp_76;
    precise vec3 temp_77;
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
    precise float temp_94;
    precise float temp_95;
    bool temp_96;
    precise float temp_97;
    precise float temp_98;
    precise float temp_99;
    precise float temp_100;
    precise float temp_101;
    precise float temp_102;
    precise float temp_103;
    precise float temp_104;
    precise float temp_105;
    precise float temp_106;
    precise float temp_107;
    precise float temp_108;
    precise float temp_109;
    precise float temp_110;
    precise float temp_111;
    precise float temp_112;
    int temp_113;
    bool temp_114;
    precise float temp_115;
    precise float temp_116;
    precise float temp_117;
    precise float temp_118;
    precise float temp_119;
    precise vec3 temp_120;
    precise float temp_121;
    precise float temp_122;
    precise float temp_123;
    precise vec3 temp_124;
    precise float temp_125;
    precise float temp_126;
    precise float temp_127;
    precise float temp_128;
    precise float temp_129;
    bool temp_130;
    bool temp_131;
    precise float temp_132;
    precise float temp_133;
    precise float temp_134;
    precise float temp_135;
    precise float temp_136;
    bool temp_137;
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
    bool temp_151;
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
    precise float temp_166;
    precise float temp_167;
    precise float temp_168;
    precise float temp_169;
    precise float temp_170;
    precise float temp_171;
    precise float temp_172;
    precise float temp_173;
    precise float temp_174;
    bool temp_175;
    precise float temp_176;
    precise float temp_177;
    precise float temp_178;
    precise float temp_179;
    precise vec3 temp_180;
    precise vec3 temp_181;
    precise float temp_182;
    precise float temp_183;
    precise float temp_184;
    precise float temp_185;
    precise vec4 temp_186;
    precise float temp_187;
    precise float temp_188;
    precise float temp_189;
    precise float temp_190;
    precise float temp_191;
    precise float temp_192;
    bool temp_193;
    precise float temp_194;
    precise float temp_195;
    bool temp_196;
    uint temp_197;
    precise float temp_198;
    precise float temp_199;
    precise float temp_200;
    precise float temp_201;
    bool temp_202;
    precise float temp_203;
    bool temp_204;
    precise float temp_205;
    precise float temp_206;
    precise float temp_207;
    int temp_208;
    int temp_209;
    precise float temp_210;
    precise float temp_211;
    precise float temp_212;
    int temp_213;
    int temp_214;
    precise float temp_215;
    precise float temp_216;
    precise float temp_217;
    bool temp_218;
    precise float temp_219;
    bool temp_220;
    int temp_221;
    precise float temp_222;
    precise float temp_223;
    precise float temp_224;
    int temp_225;
    int temp_226;
    precise float temp_227;
    precise float temp_228;
    precise float temp_229;
    int temp_230;
    int temp_231;
    int temp_232;
    int temp_233;
    int temp_234;
    int temp_235;
    int temp_236;
    int temp_237;
    int temp_238;
    int temp_239;
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
        //discard // Yuzu crash;
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
        temp_19 = max(temp_3, fp_c5.data[39].w);
        if(!(fp_c5.data[39].z < 0.5)) {
            temp_19 = 1.0;
        }
        if(temp_14) {
            temp_20 = fma(temp_16, 2.0, -1.0);
            temp_21 = temp_20 * 2.0 * temp_20 * temp_20;
            temp_22 = fma(temp_20, 1.5, temp_21);
            temp_23 = in_attr0.x;
            temp_24 = fma(fma(temp_17, 2.0, -1.0), 1.5, temp_21);
            temp_25 = in_attr0.y;
            temp_26 = in_attr0.z;
            temp_27 = fma(temp_24, in_attr1.x, temp_22 * in_attr2.x) + temp_23;
            temp_28 = fma(temp_24, in_attr1.y, temp_22 * in_attr2.y) + temp_25;
            temp_29 = fma(temp_24, in_attr1.z, temp_22 * in_attr2.z) + temp_26;
            temp_30 = inversesqrt(fma(temp_29, temp_29, fma(temp_28, temp_28, temp_27 * temp_27)));
            temp_31 = temp_27 * temp_30;
            temp_32 = temp_28 * temp_30;
            temp_33 = temp_29 * temp_30;
            temp_34 = temp_28;
            temp_35 = temp_23;
            temp_36 = temp_25;
            temp_37 = temp_26;
        } else {
            temp_38 = in_attr0.x;
            temp_39 = in_attr0.y;
            temp_40 = in_attr0.z;
            temp_41 = inversesqrt(fma(temp_40, temp_40, fma(temp_39, temp_39, temp_38 * temp_38)));
            temp_31 = temp_38 * temp_41;
            temp_32 = temp_39 * temp_41;
            temp_33 = temp_40 * temp_41;
            temp_34 = intBitsToFloat(undef);
            temp_35 = temp_38;
            temp_36 = temp_39;
            temp_37 = temp_40;
        }
        temp_42 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
        temp_43 = in_attr4.x;
        temp_44 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1)) != 0;
        temp_45 = in_attr4.y;
        temp_46 = in_attr4.z;
        temp_47 = intBitsToFloat(undef);
        temp_48 = temp_34;
        if(temp_42) {
            temp_47 = in_attr5.y;
        }
        temp_49 = inversesqrt(fma(temp_46, temp_46, fma(temp_45, temp_45, temp_43 * temp_43)));
        temp_50 = temp_43 * temp_49;
        temp_51 = temp_45 * temp_49;
        temp_52 = temp_46 * temp_49;
        temp_53 = fma(temp_52, temp_33, fma(temp_51, temp_32, temp_50 * temp_31));
        temp_54 = fma(temp_53 * -temp_31, 2.0, temp_50);
        temp_55 = fma(temp_53 * -temp_32, 2.0, temp_51);
        temp_56 = fma(temp_53 * -temp_33, 2.0, temp_52);
        temp_57 = temp_54 * -fp_c4.data[42].x;
        temp_58 = fma(temp_55, 0.0 - fp_c4.data[42].y, temp_57);
        temp_59 = temp_57;
        temp_60 = temp_58;
        temp_61 = temp_55;
        temp_62 = temp_56;
        temp_63 = temp_47;
        if(temp_42) {
            temp_59 = in_attr5.x;
        }
        temp_64 = fma(temp_55, 0.0 - fp_c4.data[43].y, temp_54 * -fp_c4.data[43].x);
        temp_65 = fma(temp_55, 0.0 - fp_c4.data[44].y, temp_54 * -fp_c4.data[44].x);
        temp_66 = fma(temp_56, 0.0 - fp_c4.data[42].z, temp_58);
        temp_67 = fma(temp_56, 0.0 - fp_c4.data[43].z, temp_64);
        temp_68 = fma(temp_56, 0.0 - fp_c4.data[44].z, temp_65);
        temp_69 = temp_64;
        temp_70 = temp_59;
        temp_71 = temp_65;
        if(temp_44) {
            temp_69 = max(abs(temp_67), abs(temp_66));
        }
        if(temp_44) {
            temp_60 = max(abs(temp_68), temp_69);
        }
        temp_72 = temp_60;
        if(temp_44) {
            temp_72 = 1.0 / temp_60;
        }
        if(temp_42) {
            temp_70 = texture(g_shadow_depth_textures_0_, vec2(temp_59, temp_47)).x;
        }
        temp_73 = temp_70;
        if(temp_44) {
            temp_61 = temp_68 * temp_72;
        }
        temp_74 = temp_61;
        if(temp_44) {
            temp_71 = temp_66 * temp_72;
        }
        temp_75 = temp_71;
        if(temp_44) {
            temp_62 = temp_67 * temp_72;
        }
        temp_76 = temp_62;
        if(temp_44) {
            temp_77 = texture(g_envmap_texture, vec3(temp_71, temp_62, temp_61)).xyz;
            temp_75 = temp_77.x;
            temp_74 = temp_77.z;
            temp_76 = temp_77.y;
        }
        temp_78 = temp_74;
        temp_79 = temp_75;
        temp_80 = temp_76;
        if(temp_42) {
            temp_48 = in_attr5.z;
        }
        temp_81 = temp_48;
        if(!temp_42) {
            temp_81 = 1.0;
        }
        temp_82 = temp_81;
        if(!temp_44) {
            temp_78 = 0.0;
        }
        temp_83 = fma(temp_33, fp_c4.data[42].z, fma(temp_32, fp_c4.data[42].y, temp_31 * fp_c4.data[42].x));
        temp_84 = fma(temp_52, fp_c4.data[42].z, fma(temp_51, fp_c4.data[42].y, temp_50 * fp_c4.data[42].x));
        temp_85 = fma(temp_33, fp_c4.data[43].z, fma(temp_32, fp_c4.data[43].y, temp_31 * fp_c4.data[43].x));
        temp_86 = temp_84;
        if(!temp_44) {
            temp_79 = 0.0;
        }
        temp_87 = fma(temp_32, fp_c4.data[44].y, temp_31 * fp_c4.data[44].x);
        temp_88 = temp_87;
        if(!temp_44) {
            temp_80 = 0.0;
        }
        temp_89 = fma(temp_33, fp_c4.data[44].z, temp_87);
        if(temp_42) {
            temp_88 = temp_31 * fp_c4.data[26].x;
        }
        temp_90 = temp_88;
        if(temp_42) {
            temp_90 = fma(temp_32, fp_c4.data[26].y, temp_88);
        }
        temp_91 = 0.0 - clamp(fma(temp_89, fma(temp_52, fp_c4.data[44].z, fma(temp_51, fp_c4.data[44].y, temp_50 * fp_c4.data[44].x)), fma(temp_85, fma(temp_52, fp_c4.data[43].z, fma(temp_51, fp_c4.data[43].y, temp_50 * fp_c4.data[43].x)), temp_83 * temp_84)), 0.0, 1.0) + 1.0;
        temp_92 = temp_90;
        if(temp_42) {
            temp_92 = fma(temp_33, fp_c4.data[26].z, temp_90);
        }
        temp_93 = temp_92;
        if(temp_42) {
            temp_93 = temp_92 + 1.0;
        }
        temp_94 = temp_93;
        if(temp_42) {
            temp_94 = min(temp_93, 1.0);
        }
        temp_95 = temp_94;
        if(temp_42) {
            temp_95 = temp_94 * temp_94;
        }
        temp_96 = (1 & floatBitsToInt(fp_c3.data[0].z)) == 1;
        if(temp_42) {
            temp_73 = 0.0 - temp_81 + temp_70;
        }
        temp_97 = temp_73;
        if(temp_42) {
            temp_82 = temp_95 * temp_95;
        }
        temp_98 = temp_82;
        if(temp_42) {
            temp_97 = temp_73 * fp_c4.data[45].x;
        }
        temp_99 = temp_97;
        if(temp_42) {
            temp_99 = temp_97 * fp_c5.data[30].w * 3.0; // Shadow improvement #1
        }
        temp_100 = temp_99;
        if(temp_42) {
            temp_86 = temp_99;
        }
        if(temp_42) {
            temp_100 = exp2(temp_86);
        }
        temp_101 = temp_100;
        if(temp_42) {
            temp_101 = min(temp_100, 1.0);
        }
        if(temp_42) {
            temp_98 = min(temp_101, temp_82);
        }
        temp_102 = temp_91 * temp_91 * temp_91 * temp_91 * temp_91 * fma(temp_98, 0.95, 0.05); // Shadow improvement #2
        temp_103 = fma(temp_102, fp_c5.data[33].x, fp_c5.data[33].y);
        temp_104 = temp_103 * fp_c5.data[32].x;
        temp_105 = temp_103 * fp_c5.data[32].y;
        temp_106 = temp_103 * fp_c5.data[32].z;
        temp_107 = fma(temp_102 * fp_c5.data[33].x, 10.0, 1.0) * fp_c5.data[32].w;
        temp_108 = temp_104;
        temp_109 = temp_105;
        temp_110 = temp_106;
        temp_111 = temp_107;
        temp_112 = temp_107;
        temp_113 = floatBitsToInt(temp_106);
        if(temp_96) {
            temp_114 = int(bitfieldExtract(floatBitsToUint(fp_c5.data[50].x), 15, 1)) != 0;
            if(temp_114) {
                temp_63 = fp_c7.data[5].z;
            }
            temp_115 = temp_63;
            if(!temp_114) {
                temp_115 = fp_c7.data[5].w;
            }
            if(temp_115 > 0.0) {
                temp_116 = 1.0 / max(abs(temp_89), max(abs(temp_85), abs(temp_83)));
                temp_117 = temp_89 * temp_116;
                temp_118 = temp_83 * temp_116;
                temp_119 = temp_85 * temp_116;
                temp_120 = textureLod(g_ibl_textures_0_, vec3(temp_118, temp_119, temp_117), 1.0).xyz;
                temp_121 = temp_120.x;
                temp_122 = temp_120.y;
                temp_123 = temp_120.z;
                temp_124 = textureLod(g_ibl_textures_0_, vec3(temp_118, temp_119, temp_117), 0.0).xyz;
                temp_125 = fma(temp_124.x + 0.0 - temp_121, temp_98, temp_121);
                temp_126 = fma(temp_124.y + 0.0 - temp_122, temp_98, temp_122);
                temp_127 = fma(temp_124.z + 0.0 - temp_123, temp_98, temp_123);
                temp_128 = 1.0 / fp_c7.data[7].z * sqrt(fma(temp_127, temp_127, fma(temp_126, temp_126, temp_125 * temp_125)));
                temp_129 = temp_128 + 0.0 - fp_c7.data[7].w;
                temp_130 = temp_128 > 1.0;
                temp_131 = temp_128 < fp_c7.data[7].w;
                temp_132 = temp_129 * (1.0 / (1.0 + 0.0 - fp_c7.data[7].w));
                temp_133 = temp_129;
                temp_134 = temp_132;
                if(temp_130) {
                    temp_133 = 1.0;
                }
                temp_135 = temp_133;
                if(temp_131) {
                    temp_134 = fp_c7.data[7].y;
                }
                temp_136 = temp_134;
                if(!temp_130) {
                    temp_135 = fma(1.0 + 0.0 - fp_c7.data[7].y, temp_132, fp_c7.data[7].y);
                }
                temp_137 = 0.0 < fp_c7.data[6].w;
                if(!temp_131) {
                    temp_136 = temp_135;
                }
                temp_138 = fma(fma(temp_136, fp_c7.data[7].x, 0.0 - temp_125), fp_c7.data[6].w, temp_125);
                temp_139 = fma(fma(temp_136, fp_c7.data[7].x, 0.0 - temp_126), fp_c7.data[6].w, temp_126);
                temp_140 = fma(fma(temp_136, fp_c7.data[7].x, 0.0 - temp_127), fp_c7.data[6].w, temp_127);
                if(!temp_137) {
                    temp_138 = temp_125;
                }
                if(!temp_137) {
                    temp_139 = temp_126;
                }
                if(!temp_137) {
                    temp_140 = temp_127;
                }
                temp_141 = fma(temp_138, temp_115, 0.0 - temp_115) + 1.0;
                temp_142 = fma(temp_139, temp_115, 0.0 - temp_115) + 1.0;
                temp_143 = fma(temp_140, temp_115, 0.0 - temp_115) + 1.0;
            } else {
                temp_141 = 1.0;
                temp_142 = 1.0;
                temp_143 = 1.0;
            }
        }

        // MM+ based ibl shading logic
        else {
            vec3 fb_norm = vec3(temp_118, temp_119, temp_117);
            vec3 fb_lod0 = textureLod(g_ibl_textures_0_, fb_norm, 0.0).xyz;
            vec3 fb_lod1 = textureLod(g_ibl_textures_0_, fb_norm, 1.0).xyz;
            vec3 fb_diff = mix(fb_lod1, fb_lod0, temp_98);
            temp_141 = fb_diff.x;
            temp_142 = fb_diff.y;
            temp_143 = fb_diff.z;
        }

        temp_144 = in_attr6.w;
        if((temp_19 != 1.0 || isnan(temp_19) || isnan(1.0)) && temp_19 <= fp_c5.data[39].z) {
            //discard // Yuzu crash;
            keep = false;
        } else {
            temp_145 = fma(temp_141 * fp_c4.data[14].x, fp_c7.data[1].w, temp_144);
            temp_146 = fma(temp_142 * fp_c4.data[14].y, fp_c7.data[1].w, temp_144);
            temp_147 = fma(temp_143 * fp_c4.data[14].z, fp_c7.data[1].w, temp_144);
            if(!temp_96) {
                temp_145 = fma(temp_141, fp_c4.data[14].x, temp_144);
            }
            if(!temp_96) {
                temp_146 = fma(temp_142, fp_c4.data[14].y, temp_144);
            }
            if(!temp_96) {
                temp_147 = fma(temp_143, fp_c4.data[14].z, temp_144);
            }
            temp_148 = temp_145 + fp_c4.data[15].x;
            temp_149 = temp_146 + fp_c4.data[15].y;
            temp_150 = temp_147 + fp_c4.data[15].z;
            temp_151 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
            temp_152 = temp_148 * fp_c7.data[1].y;
            temp_153 = temp_149 * fp_c7.data[1].y;
            temp_154 = temp_150 * fp_c7.data[1].y;
            if(!temp_96) {
                temp_152 = temp_148;
            }
            if(!temp_96) {
                temp_153 = temp_149;
            }
            if(!temp_96) {
                temp_154 = temp_150;
            }
            temp_155 = clamp((fma(fma(temp_33, fp_c4.data[33].z, fma(temp_32, fp_c4.data[33].y, temp_31 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
            temp_156 = temp_152 + fp_c5.data[30].x;
            temp_157 = temp_153 + fp_c5.data[30].y;
            temp_158 = temp_154 + fp_c5.data[30].z;
            temp_159 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_155, fp_c4.data[34].x), fp_c4.data[36].z, temp_156);
            temp_160 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_155, fp_c4.data[34].y), fp_c4.data[36].z, temp_157);
            temp_161 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_155, fp_c4.data[34].z), fp_c4.data[36].z, temp_158);
            if(!temp_151) {
                temp_159 = temp_156;
            }
            temp_162 = temp_159;
            if(!temp_151) {
                temp_160 = temp_157;
            }
            temp_163 = temp_160;
            if(!temp_151) {
                temp_161 = temp_158;
            }
            temp_164 = temp_159 * temp_5;
            temp_165 = temp_160 * temp_7;
            temp_164 = temp_159 * temp_5;
            temp_165 = temp_160 * temp_7;
            temp_166 = temp_164 * 0.959999979;
            temp_167 = temp_165 * 0.959999979;
            temp_168 = temp_161 * temp_9 * 0.959999979;

            temp_169 = temp_164;
            temp_170 = temp_165;
            temp_171 = temp_166;
            temp_172 = temp_168;
            temp_173 = temp_167;
            if(int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 22, 2)) != 0) {
                temp_174 = 1.0 / max(abs(temp_68), max(abs(temp_67), abs(temp_66)));
                temp_175 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
                temp_176 = temp_68 * temp_174;
                if(temp_175) {
                    temp_169 = in_attr3.x;
                }
                temp_177 = temp_66 * temp_174;
                temp_178 = temp_169;
                if(temp_175) {
                    temp_170 = in_attr3.y;
                }
                temp_179 = temp_67 * temp_174;
                temp_180 = texture(g_ibl_textures_1_, vec3(temp_177, temp_179, temp_176)).xyz;
                temp_181 = texture(g_ibl_textures_2_, vec3(temp_177, temp_179, temp_176)).xyz;
                temp_182 = temp_181.x;
                temp_183 = temp_181.y;
                temp_184 = temp_181.z;
                temp_185 = temp_170;
                if(temp_175) {
                    temp_186 = texture(g_textures_3_, vec2(temp_169, temp_170)).xyzw;
                    temp_178 = temp_186.x;
                    temp_185 = temp_186.y;
                    temp_162 = temp_186.z;
                    temp_163 = temp_186.w;
                }
                temp_187 = fma(temp_180.x + 0.0 - temp_182, fp_c5.data[31].x, temp_182);
                temp_188 = fma(temp_180.y + 0.0 - temp_183, fp_c5.data[31].x, temp_183);
                temp_189 = fma(temp_180.z + 0.0 - temp_184, fp_c5.data[31].x, temp_184);
                temp_190 = min(temp_187, 3.0);
                temp_191 = min(temp_188, 3.0);
                temp_192 = min(temp_189, 3.0);
                if(temp_175) {
                    temp_108 = temp_104 * temp_178;
                }
                if(temp_175) {
                    temp_109 = temp_105 * temp_185;
                }
                if(temp_175) {
                    temp_110 = temp_106 * temp_162;
                }
                temp_113 = floatBitsToInt(temp_110);
                if(temp_175) {
                    temp_111 = temp_107 * temp_163;
                }
                temp_112 = temp_111;
                temp_171 = fma(fma(temp_187 + 0.0 - temp_190, temp_98, temp_190) * fp_c4.data[16].x, temp_108, temp_166);
                temp_172 = fma(fma(temp_189 + 0.0 - temp_192, temp_98, temp_192) * fp_c4.data[16].z, temp_110, temp_168);
                temp_173 = fma(fma(temp_188 + 0.0 - temp_191, temp_98, temp_191) * fp_c4.data[16].y, temp_109, temp_167);
            }
            temp_193 = fp_c4.data[32].w >= 1.0;
            temp_194 = fma(temp_98, 0.5, 0.5) * fp_c4.data[16].w;
            temp_195 = inversesqrt(fma(temp_37, temp_37, fma(temp_36, temp_36, temp_35 * temp_35)));
            temp_196 = fp_c5.data[30].w < 0.15;
            temp_197 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1);
            temp_198 = fma(fp_c4.data[31].z + 0.0 - fp_c4.data[32].z, fp_c4.data[31].z + 0.0 - fp_c4.data[32].z, fma(fp_c4.data[31].y + 0.0 - fp_c4.data[32].y, fp_c4.data[31].y + 0.0 - fp_c4.data[32].y, (fp_c4.data[31].x + 0.0 - fp_c4.data[32].x) * (fp_c4.data[31].x + 0.0 - fp_c4.data[32].x)));
            temp_199 = temp_35 * temp_195;
            temp_200 = temp_36 * temp_195;
            temp_201 = temp_37 * temp_195;
            temp_202 = int(temp_197) == 1;
            temp_203 = temp_199 * fp_c4.data[59].x;
            temp_204 = temp_198 == 0.0 && temp_193;
            temp_205 = in_attr7.y;
            temp_206 = temp_171;
            temp_207 = temp_203;
            temp_208 = temp_113;
            temp_209 = floatBitsToInt(temp_205);
            if(temp_44) {
                temp_206 = fma(temp_194 * temp_78, temp_112, temp_172);
            }
            temp_210 = temp_206;
            if(temp_44) {
                temp_207 = fma(temp_194 * temp_79, temp_112, temp_171);
            }
            temp_211 = temp_207;
            if(!temp_44) {
                temp_211 = temp_206;
            }
            temp_212 = fma(temp_200, fp_c4.data[58].y, temp_199 * fp_c4.data[58].x);
            temp_213 = floatBitsToInt(fp_c3.data[0].w) & 1;
            temp_214 = 0;
            temp_215 = fma(temp_194 * temp_80, temp_112, temp_173);
            temp_216 = temp_212;
            if(temp_202) {
                temp_214 = temp_198 == 0.0 && temp_193 ? 0x3F800000 : 0;
            }
            temp_217 = in_attr5.w;
            if(!temp_44) {
                temp_215 = temp_173;
            }
            temp_218 = temp_213 != 0;
            if(!temp_44) {
                temp_210 = temp_172;
            }
            temp_219 = fma(temp_215, 0.5866, temp_211 * 0.298900008);
            temp_220 = 1.0 <= fp_c4.data[32].w && 0 - (int(temp_197) == 1 ? -1 : 0) != 0 && temp_198 == 0.0;
            temp_221 = floatBitsToInt(temp_219);
            if(temp_196) {
                temp_216 = 100.0;
            }
            temp_222 = fma(temp_210, 0.1145, temp_219);
            temp_223 = fp_c4.data[32].z + 0.0 - fp_c4.data[31].z;
            temp_224 = temp_216;
            temp_225 = floatBitsToInt(temp_223);
            if(!temp_218) {
                temp_208 = 0x3C23D70A;
            }
            temp_226 = temp_208;
            if(!temp_196) {
                temp_224 = fma(temp_201, fp_c4.data[58].z, temp_212) + 2.0;
            }
            if(temp_218) {
                temp_226 = temp_214;
            }
            if(!temp_218) {
                temp_221 = temp_226;
            }
            temp_227 = int(floatBitsToUint(fp_c3.data[0].y) >> 31) == 1 ? 1.0 : 0.0;
            temp_228 = (fma(temp_201, fp_c4.data[59].z, fma(temp_200, fp_c4.data[59].y, temp_203)) + 2.0) * temp_227;
            temp_229 = temp_227 * temp_224;
            temp_230 = temp_221;
            temp_231 = floatBitsToInt(temp_228);
            temp_232 = floatBitsToInt(temp_229);
            if(temp_218) {
                temp_230 = 0x3F800000;
            }
            temp_233 = temp_230;
            if(temp_220) {
                temp_233 = temp_214;
            }
            if(temp_204) {
                temp_225 = 0;
            }
            temp_234 = temp_225;
            if(temp_204) {
                temp_209 = 0x42C80000;
            }
            temp_235 = temp_209;
            if(!temp_204) {
                temp_234 = floatBitsToInt(temp_228);
            }
            if(!temp_204) {
                temp_235 = floatBitsToInt(temp_229);
            }
            temp_236 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_222, fp_c4.data[31].x) + 0.0 - temp_211, fp_c4.data[32].w, temp_211)));
            if(!temp_202) {
                temp_236 = floatBitsToInt(fma(in_attr7.x + 0.0 - temp_211, temp_217, temp_211));
            }
            temp_237 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_222, fp_c4.data[31].y) + 0.0 - temp_215, fp_c4.data[32].w, temp_215)));
            if(temp_202) {
                temp_231 = temp_234;
            }
            temp_238 = floatBitsToInt(max(0.0, fma(fma(temp_223, temp_222, fp_c4.data[31].z) + 0.0 - temp_210, fp_c4.data[32].w, temp_210)));
            if(temp_202) {
                temp_232 = temp_235;
            }
            temp_239 = temp_213 != 0 ? 0x3F800000 : 0;
            if(!temp_202) {
                temp_237 = floatBitsToInt(fma(temp_205 + 0.0 - temp_215, temp_217, temp_215));
            }
            if(!temp_202) {
                temp_238 = floatBitsToInt(fma(in_attr7.z + 0.0 - temp_210, temp_217, temp_210));
            }
            if(temp_220) {
                temp_239 = 0;
            }
            SV_Target0.x = intBitsToFloat(temp_236);
            SV_Target0.y = intBitsToFloat(temp_237);
            SV_Target0.z = intBitsToFloat(temp_238);
            SV_Target0.w = temp_19;
            SV_Target1.x = intBitsToFloat(temp_239);
            SV_Target1.y = intBitsToFloat(temp_232);
            SV_Target1.z = intBitsToFloat(temp_231);
            SV_Target1.w = intBitsToFloat(temp_233);
            // return; Yuzu crash;
        }
    }
    if (!keep) {
        discard;
    }
}
