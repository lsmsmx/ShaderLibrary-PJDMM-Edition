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

layout(binding = 0) uniform sampler2D g_textures_0_;
layout(binding = 4) uniform sampler2D g_textures_4_;
layout(binding = 2) uniform sampler2D g_textures_2_;
layout(binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout(binding = 9) uniform samplerCube g_ibl_textures_0_;
layout(binding = 3) uniform sampler2D g_textures_3_;
layout(binding = 10) uniform samplerCube g_ibl_textures_1_;
layout(binding = 11) uniform samplerCube g_ibl_textures_2_;
layout(binding = 12) uniform samplerCube g_ibl_textures_3_;
layout(binding = 13) uniform samplerCube g_ibl_textures_4_;
layout(binding = 5) uniform samplerCube g_envmap_texture;
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
    precise float temp_0;
    precise float temp_1;
    precise vec4 temp_2;
    uint temp_3;
    bool temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    precise float temp_11;
    precise vec2 temp_12;
    precise float temp_13;
    precise float temp_14;
    precise float temp_15;
    precise float temp_16;
    precise float temp_17;
    precise float temp_18;
    precise float temp_19;
    precise float temp_20;
    precise float temp_21;
    precise float temp_22;
    precise float temp_23;
    precise float temp_24;
    precise float temp_25;
    precise float temp_26;
    bool temp_27;
    bool temp_28;
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
    precise float temp_42;
    precise vec3 temp_43;
    precise float temp_44;
    precise float temp_45;
    precise float temp_46;
    precise vec3 temp_47;
    precise float temp_48;
    precise float temp_49;
    precise float temp_50;
    precise vec4 temp_51;
    uint temp_52;
    bool temp_53;
    precise float temp_54;
    precise float temp_55;
    precise float temp_56;
    precise float temp_57;
    precise float temp_58;
    precise float temp_59;
    precise float temp_60;
    precise float temp_61;
    uint temp_62;
    bool temp_63;
    bool temp_64;
    precise float temp_65;
    bool temp_66;
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
    precise float temp_94;
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
    precise float temp_105;
    precise float temp_106;
    precise float temp_107;
    precise float temp_108;
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
    precise float temp_122;
    precise float temp_123;
    precise float temp_124;
    precise float temp_125;
    precise float temp_126;
    precise float temp_127;
    precise float temp_128;
    precise float temp_129;
    precise float temp_130;
    bool temp_131;
    precise float temp_132;
    precise float temp_133;
    precise float temp_134;
    precise float temp_135;
    precise float temp_136;
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
    precise vec3 temp_159;
    precise vec3 temp_160;
    precise float temp_161;
    precise float temp_162;
    precise float temp_163;
    precise vec3 temp_164;
    precise vec3 temp_165;
    precise float temp_166;
    precise float temp_167;
    precise float temp_168;
    precise vec3 temp_169;
    precise vec3 temp_170;
    precise float temp_171;
    precise float temp_172;
    precise float temp_173;
    bool temp_174;
    precise float temp_175;
    precise float temp_176;
    precise float temp_177;
    precise float temp_178;
    precise float temp_179;
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
    precise float temp_191;
    precise float temp_192;
    precise float temp_193;
    precise float temp_194;
    precise float temp_195;
    precise float temp_196;
    precise float temp_197;
    precise float temp_198;
    int temp_199;
    int temp_200;
    int temp_201;
    temp_0 = in_attr3.x;
    temp_1 = in_attr3.y;
    temp_2 = texture(g_textures_0_, vec2(temp_0, temp_1)).xyzw;
    temp_3 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 9, 1);
    temp_4 = int(temp_3) == 1;
    temp_5 = uintBitsToFloat(temp_3);
    temp_6 = temp_2.w;
    temp_7 = temp_1;
    temp_8 = temp_0;
    if(temp_4) {
        temp_5 = in_attr3.z;
    }
    temp_9 = intBitsToFloat(undef);
    if(temp_4) {
        temp_9 = in_attr3.w;
    }
    if(temp_4) {
        temp_6 = texture(g_textures_4_, vec2(temp_5, temp_9)).w;
    }
    temp_10 = temp_6;
    if(temp_6 < min(fp_c5.data[39].z, 0.5)) {
        //discard // Yuzu crash;
        keep = false;
    } else {
        temp_11 = max(temp_6, fp_c5.data[39].w);
        if(!(fp_c5.data[39].z < 0.5)) {
            temp_11 = 1.0;
        }
        if(temp_11 <= fp_c5.data[39].z && (temp_11 != 1.0 || isnan(temp_11) || isnan(1.0))) {
            //discard // Yuzu crash;
            keep = false;
        } else {
            temp_12 = texture(g_textures_2_, vec2(temp_0, temp_1)).xy;
            temp_13 = in_attr1.x;
            temp_14 = in_attr1.y;
            temp_15 = in_attr1.z;
            temp_16 = fma(temp_12.y, 2.0, -1.0);
            temp_17 = temp_16 * 2.0 * temp_16 * temp_16;
            temp_18 = fma(temp_16, 1.5, temp_17);
            temp_19 = fma(fma(temp_12.x, 2.0, -1.0), 1.5, temp_17);
            temp_20 = fma(temp_19, temp_13, temp_18 * in_attr2.x) + in_attr0.x;
            temp_21 = fma(temp_19, temp_14, temp_18 * in_attr2.y) + in_attr0.y;
            temp_22 = fma(temp_19, temp_15, temp_18 * in_attr2.z) + in_attr0.z;
            temp_23 = inversesqrt(fma(temp_22, temp_22, fma(temp_21, temp_21, temp_20 * temp_20)));
            temp_24 = temp_20 * temp_23;
            temp_25 = temp_21 * temp_23;
            temp_26 = temp_22 * temp_23;
            temp_27 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
            temp_28 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
            temp_29 = temp_23;
            temp_30 = temp_24;
            temp_31 = temp_25;
            if(temp_28) {
                temp_10 = in_attr5.x;
            }
            temp_32 = intBitsToFloat(undef);
            temp_33 = temp_10;
            if(temp_28) {
                temp_32 = in_attr5.y;
            }
            temp_34 = fma(temp_26, fp_c4.data[43].z, fma(temp_25, fp_c4.data[43].y, temp_24 * fp_c4.data[43].x));
            temp_35 = fma(temp_26, fp_c4.data[42].z, fma(temp_25, fp_c4.data[42].y, temp_24 * fp_c4.data[42].x));
            temp_36 = fma(temp_26, fp_c4.data[44].z, fma(temp_25, fp_c4.data[44].y, temp_24 * fp_c4.data[44].x));
            temp_37 = max(abs(temp_36), max(abs(temp_34), abs(temp_35)));
            temp_38 = 1.0 / temp_37;
            temp_39 = temp_37;
            if(temp_28) {
                temp_33 = texture(g_shadow_depth_textures_0_, vec2(temp_10, temp_32)).x;
            }
            temp_40 = temp_36 * temp_38;
            temp_41 = temp_35 * temp_38;
            temp_42 = temp_34 * temp_38;
            temp_43 = textureLod(g_ibl_textures_0_, vec3(temp_41, temp_42, temp_40), 1.0).xyz;
            temp_44 = temp_43.x;
            temp_45 = temp_43.y;
            temp_46 = temp_43.z;
            temp_47 = textureLod(g_ibl_textures_0_, vec3(temp_41, temp_42, temp_40), 0.0).xyz;
            temp_48 = temp_47.y;
            temp_49 = temp_33;
            temp_50 = temp_48;
            if(temp_27) {
                temp_51 = texture(g_textures_3_, vec2(temp_0, temp_1)).xyzw;
                temp_7 = temp_51.w;
                temp_39 = temp_51.x;
                temp_8 = temp_51.z;
                temp_29 = temp_51.y;
            }
            temp_52 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1);
            temp_53 = int(temp_52) != 0;
            temp_54 = uintBitsToFloat(temp_52);
            if(temp_28) {
                temp_54 = temp_24 * fp_c4.data[26].x;
            }
            temp_55 = inversesqrt(fma(temp_15, temp_15, fma(temp_14, temp_14, temp_13 * temp_13)));
            temp_56 = temp_13 * temp_55;
            temp_57 = temp_14 * temp_55;
            temp_58 = temp_15 * temp_55;
            temp_59 = fma(temp_58, fp_c4.data[42].z, fma(temp_57, fp_c4.data[42].y, temp_56 * fp_c4.data[42].x));
            temp_60 = fma(temp_58, fp_c4.data[43].z, fma(temp_57, fp_c4.data[43].y, temp_56 * fp_c4.data[43].x));
            temp_61 = fma(temp_58, fp_c4.data[44].z, fma(temp_57, fp_c4.data[44].y, temp_56 * fp_c4.data[44].x));
            temp_62 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 2, 2);
            temp_63 = int(temp_62) == 3;
            temp_64 = int(temp_62) == 2;
            temp_65 = fma(temp_61, temp_36, fma(temp_60, temp_34, temp_59 * temp_35));
            temp_66 = int(temp_62) == 1;
            temp_67 = fma(temp_35, 0.0 - temp_65, temp_59);
            temp_68 = fma(temp_34, 0.0 - temp_65, temp_60);
            temp_69 = fma(temp_36, 0.0 - temp_65, temp_61);
            temp_70 = inversesqrt(fma(temp_69, temp_69, fma(temp_68, temp_68, temp_67 * temp_67)));
            temp_71 = fma(temp_67, 0.0 - temp_70, temp_35);
            temp_72 = temp_67 * temp_70;
            temp_73 = fma(temp_68, 0.0 - temp_70, temp_34);
            temp_74 = temp_68 * temp_70;
            temp_75 = fma(temp_69, 0.0 - temp_70, temp_36);
            temp_76 = temp_69 * temp_70;
            temp_77 = fma(temp_71, 0.9, temp_72);
            temp_78 = uintBitsToFloat(temp_62);
            temp_79 = temp_71;
            if(!temp_63) {
                temp_77 = temp_74;
            }
            temp_80 = temp_77;
            if(temp_63) {
                temp_78 = temp_77;
            }
            temp_81 = temp_78;
            if(temp_63) {
                temp_80 = fma(temp_73, 0.9, temp_74);
            }
            temp_82 = temp_80;
            if(temp_63) {
                temp_79 = fma(temp_75, 0.9, temp_76);
            }
            temp_83 = in_attr4.x;
            temp_84 = temp_79;
            if(!temp_63) {
                temp_84 = temp_76;
            }
            temp_85 = in_attr4.y;
            temp_86 = temp_84;
            if(!temp_63) {
                temp_81 = temp_72;
            }
            temp_87 = temp_81;
            if(temp_64) {
                temp_87 = fma(temp_71, 0.5, temp_72);
            }
            temp_88 = temp_87;
            if(temp_66) {
                temp_88 = fma(temp_71, 0.1, temp_72);
            }
            if(temp_64) {
                temp_86 = fma(temp_75, 0.5, temp_76);
            }
            temp_89 = temp_86;
            if(temp_64) {
                temp_82 = fma(temp_73, 0.5, temp_74);
            }
            temp_90 = in_attr4.z;
            temp_91 = temp_82;
            if(temp_66) {
                temp_91 = fma(temp_73, 0.1, temp_74);
            }
            if(temp_66) {
                temp_89 = fma(temp_75, 0.1, temp_76);
            }
            if(temp_28) {
                temp_30 = fma(temp_25, fp_c4.data[26].y, temp_54);
            }
            if(temp_28) {
                temp_31 = fma(temp_26, fp_c4.data[26].z, temp_30);
            }
            temp_92 = inversesqrt(fma(temp_89, temp_89, fma(temp_91, temp_91, temp_88 * temp_88)));
            temp_93 = temp_92 * temp_88;
            temp_94 = temp_92 * temp_91;
            temp_95 = temp_92 * temp_89;
            temp_96 = inversesqrt(fma(temp_90, temp_90, fma(temp_85, temp_85, temp_83 * temp_83)));
            temp_97 = temp_83 * temp_96;
            temp_98 = temp_85 * temp_96;
            temp_99 = temp_90 * temp_96;
            temp_100 = fma(temp_99, fp_c4.data[42].z, fma(temp_98, fp_c4.data[42].y, temp_97 * fp_c4.data[42].x));
            temp_101 = fma(temp_99, fp_c4.data[43].z, fma(temp_98, fp_c4.data[43].y, temp_97 * fp_c4.data[43].x));
            temp_102 = temp_100 * temp_93;
            temp_103 = fma(temp_99, fp_c4.data[44].z, fma(temp_98, fp_c4.data[44].y, temp_97 * fp_c4.data[44].x));
            temp_104 = temp_102;
            temp_105 = temp_94;
            if(temp_28) {
                temp_104 = in_attr5.z;
            }
            temp_106 = fma(temp_103, temp_95, fma(temp_101, temp_94, temp_102));
            temp_107 = temp_93 * -temp_106;
            temp_108 = fma(temp_95 * -temp_106, 2.0, temp_103);
            temp_109 = fma(temp_106, -0.9, 0.100000001) * fma(temp_106, -0.9, 0.100000001) * fma(temp_106, -0.9, 0.100000001) * fma(temp_106, -0.9, 0.100000001);
            temp_110 = fma(temp_34, temp_101, temp_35 * temp_100);
            temp_111 = 1.0 / max(abs(temp_103), max(abs(temp_101), abs(temp_100)));
            temp_112 = clamp(fma(temp_36, temp_103, temp_110), 0.0, 1.0);
            temp_113 = fma(temp_109, fp_c5.data[33].x, fp_c5.data[33].y);
            temp_114 = temp_110;
            temp_115 = temp_111;
            temp_116 = temp_107;
            if(!temp_28) {
                temp_114 = 1.0;
            }
            temp_117 = fma(temp_107, 2.0, temp_100);
            temp_118 = fma(temp_94 * -temp_106, 2.0, temp_101);
            temp_119 = temp_114;
            if(!temp_28) {
                temp_115 = 1.0;
            }
            temp_120 = fma(temp_109 * fp_c5.data[33].x, 2.0, 1.0) * fp_c5.data[32].w;
            temp_121 = temp_115;
            temp_122 = temp_120;
            if(temp_28) {
                temp_49 = 0.0 - temp_104 + temp_33;
            }
            temp_123 = temp_49;
            if(temp_28) {
                temp_123 = temp_49 * fp_c4.data[45].x;
            }
            temp_124 = temp_123;
            if(temp_28) {
                temp_116 = temp_123 * fp_c5.data[30].w * 5.0; // Shadow improvement #1
            }
            if(temp_28) {
                temp_124 = temp_31 + 1.0;
            }
            temp_125 = temp_124;
            if(temp_53) {
                temp_50 = max(abs(temp_117), abs(temp_118));
            }
            temp_126 = temp_50;
            if(temp_28) {
                temp_105 = temp_116;
            }
            if(temp_28) {
                temp_121 = exp2(temp_105);
            }
            temp_127 = temp_121;
            if(temp_28) {
                temp_125 = min(temp_124, 1.0);
            }
            temp_128 = temp_125;
            if(temp_27) {
                temp_122 = temp_120 * temp_7;
            }
            if(temp_53) {
                temp_126 = max(abs(temp_108), temp_50);
            }
            temp_129 = temp_126;
            if(temp_53) {
                temp_129 = 1.0 / temp_126;
            }
            temp_130 = temp_129;
            if(temp_28) {
                temp_128 = temp_125 * temp_125;
            }
            temp_131 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
            temp_132 = temp_128;
            if(temp_28) {
                temp_127 = min(temp_121, 1.0);
            }
            temp_133 = temp_127;
            if(temp_28) {
                temp_132 = temp_128 * temp_128;
            }
            temp_134 = clamp((fma(fma(temp_26, fp_c4.data[33].z, fma(temp_25, fp_c4.data[33].y, temp_24 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
            temp_135 = temp_132;
            if(temp_28) {
                temp_119 = min(temp_132, temp_127);
            }
            temp_136 = fma(temp_106, 0.0 - temp_106, 1.00001);
            temp_137 = fma(temp_112, 0.0 - temp_112, 1) * fma(temp_112, 0.0 - temp_112, 1);
            temp_138 = temp_137;
            if(temp_28) {
                temp_135 = temp_119;
            }
            temp_139 = in_attr6.w;
            temp_140 = 1.0 / max(abs(temp_108), max(abs(temp_117), abs(temp_118)));
            temp_141 = temp_135;
            if(temp_53) {
                temp_133 = temp_108 * temp_129;
            }
            temp_142 = temp_133;
            if(temp_53) {
                temp_138 = temp_117 * temp_129;
            }
            temp_143 = temp_138;
            if(temp_53) {
                temp_130 = temp_118 * temp_129;
            }
            temp_144 = temp_136 * inversesqrt(temp_136);
            temp_145 = temp_117 * temp_140;
            temp_146 = temp_118 * temp_140;
            temp_147 = temp_108 * temp_140;
            temp_148 = temp_113 * fp_c5.data[32].x;
            temp_149 = temp_113 * fp_c5.data[32].y;
            temp_150 = temp_113 * fp_c5.data[32].z;
            temp_151 = fma(temp_144, 0.8, 0.200000003);
            temp_152 = temp_148;
            temp_153 = temp_150;
            temp_154 = temp_149;
            temp_155 = temp_130;
            temp_156 = fma(temp_144, 0.6, 0.400000006);
            if(!temp_63) {
                temp_151 = temp_144;
            }
            temp_157 = temp_151;
            if(temp_27) {
                temp_152 = temp_39 * temp_148;
            }
            if(temp_27) {
                temp_153 = temp_8 * temp_150;
            }
            temp_158 = temp_137 * temp_137 * fma(temp_127, 0.6, 0.400000006) * fp_c5.data[33].z * temp_144;
            if(temp_27) {
                temp_154 = temp_29 * temp_149;
            }
            temp_159 = texture(g_ibl_textures_1_, vec3(temp_145, temp_146, temp_147)).xyz;
            temp_160 = texture(g_ibl_textures_2_, vec3(temp_145, temp_146, temp_147)).xyz;
            temp_161 = temp_160.x;
            temp_162 = temp_160.y;
            temp_163 = temp_160.z;
            temp_164 = texture(g_ibl_textures_3_, vec3(temp_145, temp_146, temp_147)).xyz;
            temp_165 = texture(g_ibl_textures_4_, vec3(temp_145, temp_146, temp_147)).xyz;
            temp_166 = temp_165.x;
            temp_167 = temp_165.y;
            temp_168 = temp_165.z;
            temp_169 = textureLod(g_ibl_textures_0_, vec3(temp_100 * -temp_111, temp_101 * -temp_111, temp_103 * -temp_111), 0.0).xyz;
            if(temp_53) {
                temp_170 = texture(g_envmap_texture, vec3(temp_138, temp_130, temp_133)).xyz;
                temp_143 = temp_170.x;
                temp_155 = temp_170.y;
                temp_142 = temp_170.z;
            }
            temp_171 = temp_143;
            temp_172 = temp_155;
            temp_173 = temp_142;
            if(temp_64) {
                temp_157 = fma(temp_144, 0.95, 0.05); // Shadow improvement #2
            }
            if(!temp_28) {
                temp_141 = 1.0;
            }
            if(!temp_53) {
                temp_171 = 0.0;
            }
            if(!temp_66) {
                temp_156 = temp_157;
            }
            if(!temp_53) {
                temp_172 = 0.0;
            }
            if(!temp_53) {
                temp_173 = 0.0;
            }
            temp_174 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
            temp_175 = temp_169.x * temp_158;
            temp_176 = fma(temp_164.x + 0.0 - temp_166, fp_c5.data[31].x, temp_166);
            temp_177 = fma(temp_164.y + 0.0 - temp_167, fp_c5.data[31].x, temp_167);
            temp_178 = temp_169.y * temp_158;
            temp_179 = fma(temp_175, 0.5, fma(fma(temp_47.x + 0.0 - temp_44, temp_119, temp_44), fp_c4.data[14].x, temp_139) + fp_c4.data[15].x);
            temp_180 = fma(temp_164.z + 0.0 - temp_168, fp_c5.data[31].x, temp_168);
            temp_181 = fma(temp_141, 0.5, 0.5);
            temp_182 = temp_169.z * temp_158;
            temp_183 = fma(temp_178, 0.5, fma(fma(temp_48 + 0.0 - temp_45, temp_119, temp_45), fp_c4.data[14].y, temp_139) + fp_c4.data[15].y);
            temp_184 = fma(fma(temp_134, 0.0 - fp_c4.data[34].x + fp_c4.data[35].x, fp_c4.data[34].x), fp_c4.data[36].z, temp_179);
            if(!temp_131) {
                temp_184 = temp_179;
            }
            temp_185 = fma(temp_182, 0.5, fma(fma(temp_47.z + 0.0 - temp_46, temp_119, temp_46), fp_c4.data[14].z, temp_139) + fp_c4.data[15].z);
            temp_186 = fma(fma(temp_134, 0.0 - fp_c4.data[34].y + fp_c4.data[35].y, fp_c4.data[34].y), fp_c4.data[36].z, temp_183);
            if(!temp_131) {
                temp_186 = temp_183;
            }
            temp_187 = fma(fma(temp_134, 0.0 - fp_c4.data[34].z + fp_c4.data[35].z, fp_c4.data[34].z), fp_c4.data[36].z, temp_185);
            if(!temp_131) {
                temp_187 = temp_185;
            }
            temp_188 = fma(fma(fma(temp_2.x, fp_c5.data[34].x, 0.0 - fp_c5.data[29].x), temp_156, fp_c5.data[29].x) * temp_184, 0.96, fma(0.0 - temp_176 + fma(temp_159.x + 0.0 - temp_161, fp_c5.data[31].x, temp_161), temp_141, temp_176) * fp_c4.data[16].x * (temp_152 + fp_c5.data[34].w));
            temp_189 = fma(fma(fma(temp_2.y, fp_c5.data[34].x, 0.0 - fp_c5.data[29].y), temp_156, fp_c5.data[29].y) * temp_186, 0.96, fma(0.0 - temp_177 + fma(temp_159.y + 0.0 - temp_162, fp_c5.data[31].x, temp_162), temp_141, temp_177) * fp_c4.data[16].y * (temp_154 + fp_c5.data[34].w));
            temp_190 = fma(fma(fma(temp_2.z, fp_c5.data[34].x, 0.0 - fp_c5.data[29].z), temp_156, fp_c5.data[29].z) * temp_187, 0.96, fma(0.0 - temp_180 + fma(temp_159.z + 0.0 - temp_163, fp_c5.data[31].x, temp_163), temp_141, temp_180) * fp_c4.data[16].z * (temp_153 + fp_c5.data[34].w));

            temp_191 = temp_188;
            temp_192 = temp_189;
            temp_193 = temp_190;
            if(temp_53) {
                temp_191 = fma(temp_181 * temp_171, temp_122, temp_188);
            }
            temp_194 = in_attr5.w;
            if(temp_53) {
                temp_192 = fma(temp_181 * temp_172, temp_122, temp_189);
            }
            temp_195 = fma(temp_175, 0.5, temp_191);
            if(temp_53) {
                temp_193 = fma(temp_181 * temp_173, temp_122, temp_190);
            }
            temp_196 = fma(temp_178, 0.5, temp_192);
            temp_197 = fma(temp_182, 0.5, temp_193);
            temp_198 = fma(temp_197, 0.1145, fma(temp_196, 0.5866, temp_195 * 0.298900008));
            temp_199 = floatBitsToInt(fma(0.0 - temp_195 + in_attr7.x, temp_194, temp_195));
            temp_200 = floatBitsToInt(fma(0.0 - temp_196 + in_attr7.y, temp_194, temp_196));
            temp_201 = floatBitsToInt(fma(0.0 - temp_197 + in_attr7.z, temp_194, temp_197));
            if(temp_174) {
                temp_199 = floatBitsToInt(max(0.0, fma(0.0 - temp_195 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_198, fp_c4.data[31].x), fp_c4.data[32].w, temp_195)));
            }
            if(temp_174) {
                temp_200 = floatBitsToInt(max(0.0, fma(0.0 - temp_196 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_198, fp_c4.data[31].y), fp_c4.data[32].w, temp_196)));
            }
            if(temp_174) {
                temp_201 = floatBitsToInt(max(0.0, fma(0.0 - temp_197 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_198, fp_c4.data[31].z), fp_c4.data[32].w, temp_197)));
            }
            SV_Target0.x = intBitsToFloat(temp_199);
            SV_Target0.y = intBitsToFloat(temp_200);
            SV_Target0.z = intBitsToFloat(temp_201);
            SV_Target0.w = temp_11;
            // return; Yuzu crash;
        }
    }
    if (!keep) {
        discard;
    }
}
