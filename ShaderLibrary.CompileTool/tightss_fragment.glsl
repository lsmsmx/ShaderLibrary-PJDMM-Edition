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

layout (binding = 0, std140) uniform _support_buffer
{
    uint alpha_test;
    uint is_bgra[8];
    precise vec4 viewport_inverse;
    precise vec4 viewport_size;
    int frag_scale_count;
    precise float render_scale[73];
    ivec4 tfe_offset;
    int tfe_vertex_count;
} support_buffer;

layout (binding = 0, std140) uniform _Shader
{
    precise vec4 data[4096];
} fp_c3;

layout (binding = 1, std140) uniform _Scene
{
    precise vec4 data[4096];
} fp_c4;

layout (binding = 2, std140) uniform _Batch
{
    precise vec4 data[4096];
} fp_c5;

layout (binding = 2) uniform sampler2D g_textures_2_;
layout (binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout (binding = 9) uniform samplerCube g_ibl_textures_0_;
layout (binding = 4) uniform sampler2D g_textures_4_;
layout (binding = 0) uniform sampler2D g_textures_0_;
layout (binding = 16) uniform sampler2D g_sss_texture;
layout (binding = 10) uniform samplerCube g_ibl_textures_1_;
layout (binding = 11) uniform samplerCube g_ibl_textures_2_;
layout (binding = 12) uniform samplerCube g_ibl_textures_3_;
layout (binding = 13) uniform samplerCube g_ibl_textures_4_;
layout (binding = 3) uniform sampler2D g_textures_3_;
layout (binding = 5) uniform samplerCube g_envmap_texture;
layout (location = 0) in vec4 in_attr0;
layout (location = 1) in vec4 in_attr1;
layout (location = 2) in vec4 in_attr2;
layout (location = 3) in vec4 in_attr3;
layout (location = 4) in vec4 in_attr4;
layout (location = 5) in vec4 in_attr5;
layout (location = 6) in vec4 in_attr6;
layout (location = 7) in vec4 in_attr7;

layout (location = 0) out vec4 SV_Target0;

void main()
{
    precise float temp_0;
    precise float temp_1;
    precise vec2 temp_2;
    precise float temp_3;
    precise float temp_4;
    int temp_5;
    bool temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    precise float temp_11;
    precise float temp_12;
    precise float temp_13;
    bool temp_14;
    precise float temp_15;
    precise float temp_16;
    precise float temp_17;
    precise float temp_18;
    precise float temp_19;
    precise float temp_20;
    precise float temp_21;
    bool temp_22;
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
    precise vec3 temp_37;
    precise vec3 temp_38;
    precise float temp_39;
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
    bool temp_54;
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
    bool temp_93;
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
    precise vec4 temp_112;
    precise float temp_113;
    precise float temp_114;
    precise vec3 temp_115;
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
    precise vec3 temp_127;
    precise vec3 temp_128;
    precise float temp_129;
    precise float temp_130;
    precise float temp_131;
    precise float temp_132;
    precise float temp_133;
    precise float temp_134;
    precise vec3 temp_135;
    precise vec3 temp_136;
    precise float temp_137;
    precise float temp_138;
    precise float temp_139;
    precise float temp_140;
    precise float temp_141;
    precise float temp_142;
    precise float temp_143;
    precise float temp_144;
    precise vec4 temp_145;
    precise vec3 temp_146;
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
    precise float temp_166;
    precise float temp_167;
    precise float temp_168;
    precise float temp_169;
    precise float temp_170;
    precise float temp_171;
    precise float temp_172;
    precise float temp_173;
    precise float temp_174;
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
    bool temp_186;
    precise float temp_187;
    int temp_188;
    int temp_189;
    int temp_190;
    temp_0 = in_attr3.x;
    temp_1 = in_attr3.y;
    temp_2 = texture(g_textures_2_, vec2(temp_0, temp_1)).xy;
    temp_3 = in_attr0.y;
    temp_4 = in_attr0.z;
    temp_5 = 1 & floatBitsToInt(fp_c3.data[0].z);
    temp_6 = temp_5 == 1;
    temp_7 = fma(temp_2.y, 2.0, -1.0);
    temp_8 = temp_7 * 2.0 * temp_7 * temp_7;
    temp_9 = fma(temp_7, 1.5, temp_8);
    temp_10 = fma(fma(temp_2.x, 2.0, -1.0), 1.5, temp_8);
    temp_11 = fma(temp_10, in_attr1.x, temp_9 * in_attr2.x) + in_attr0.x;
    temp_12 = fma(temp_10, in_attr1.y, temp_9 * in_attr2.y) + temp_3;
    temp_13 = fma(temp_10, in_attr1.z, temp_9 * in_attr2.z) + temp_4;
    temp_14 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_15 = temp_3;
    temp_16 = temp_4;
    temp_17 = temp_13;
    temp_18 = temp_1;
    if (!temp_6)
    {
        temp_15 = 1.0;
    }
    temp_19 = temp_15;
    if (temp_14)
    {
        temp_16 = in_attr5.x;
    }
    temp_20 = intBitsToFloat(undef);
    temp_21 = temp_16;
    if (temp_14)
    {
        temp_20 = in_attr5.y;
    }
    temp_22 = temp_5 == 0;
    temp_23 = inversesqrt(fma(temp_13, temp_13, fma(temp_12, temp_12, temp_11 * temp_11)));
    temp_24 = temp_11 * temp_23;
    temp_25 = temp_12 * temp_23;
    temp_26 = temp_13 * temp_23;
    temp_27 = fma(temp_25, fp_c4.data[43].y, temp_24 * fp_c4.data[43].x);
    temp_28 = temp_27;
    temp_29 = temp_26;
    if (temp_14)
    {
        temp_21 = texture(g_shadow_depth_textures_0_, vec2(temp_16, temp_20)).x;
    }
    temp_30 = fma(temp_26, fp_c4.data[42].z, fma(temp_25, fp_c4.data[42].y, temp_24 * fp_c4.data[42].x));
    temp_31 = fma(temp_26, fp_c4.data[43].z, temp_27);
    temp_32 = fma(temp_26, fp_c4.data[44].z, fma(temp_25, fp_c4.data[44].y, temp_24 * fp_c4.data[44].x));
    temp_33 = 1.0 / max(abs(temp_32), max(abs(temp_30), abs(temp_31)));
    temp_34 = temp_32 * temp_33;
    temp_35 = temp_30 * temp_33;
    temp_36 = temp_31 * temp_33;
    if (!temp_6)
    {
        temp_37 = textureLod(g_ibl_textures_0_, vec3(temp_35, temp_36, temp_34), temp_15).xyz;
        temp_28 = temp_37.x;
        temp_19 = temp_37.z;
        temp_17 = temp_37.y;
    }
    temp_38 = textureLod(g_ibl_textures_0_, vec3(temp_35, temp_36, temp_34), 0.0).xyz;
    temp_39 = temp_38.x;
    temp_40 = temp_38.y;
    temp_41 = temp_38.z;
    temp_42 = in_attr4.x;
    temp_43 = in_attr4.y;
    temp_44 = in_attr4.z;
    temp_45 = in_attr6.w;
    temp_46 = intBitsToFloat(undef);
    temp_47 = temp_41;
    temp_48 = temp_40;
    if (temp_14)
    {
        temp_46 = temp_24 * fp_c4.data[26].x;
    }
    temp_49 = inversesqrt(fma(temp_44, temp_44, fma(temp_43, temp_43, temp_42 * temp_42)));
    temp_50 = temp_42 * temp_49;
    temp_51 = temp_43 * temp_49;
    temp_52 = temp_44 * temp_49;
    temp_53 = temp_50 * fp_c4.data[42].x;
    temp_54 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
    temp_55 = temp_53;
    temp_56 = temp_50;
    temp_57 = temp_46;
    if (temp_14)
    {
        temp_55 = in_attr5.z;
    }
    temp_58 = fma(temp_26, temp_52, fma(temp_25, temp_51, temp_24 * temp_50));
    temp_59 = clamp((fma(fma(temp_26, fp_c4.data[33].z, fma(temp_25, fp_c4.data[33].y, temp_24 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
    temp_60 = fma(temp_52, fp_c4.data[42].z, fma(temp_51, fp_c4.data[42].y, temp_53)) * temp_30;
    temp_61 = fma(temp_52, fp_c4.data[44].z, fma(temp_51, fp_c4.data[44].y, temp_50 * fp_c4.data[44].x));
    temp_62 = fma(temp_24 * -temp_58, 2.0, temp_50);
    temp_63 = fma(temp_25 * -temp_58, 2.0, temp_51);
    temp_64 = fma(temp_26 * -temp_58, 2.0, temp_52);
    temp_65 = temp_60;
    temp_66 = temp_55;
    temp_67 = temp_61;
    if (temp_14)
    {
        temp_56 = fma(temp_25, fp_c4.data[26].y, temp_46);
    }
    temp_68 = temp_56;
    if (!temp_14)
    {
        temp_65 = 1.0;
    }
    temp_69 = clamp(fma(temp_61, temp_32, fma(fma(temp_52, fp_c4.data[43].z, fma(temp_51, fp_c4.data[43].y, temp_50 * fp_c4.data[43].x)), temp_31, temp_60)), 0.0, 1.0);
    temp_70 = temp_65;
    if (temp_14)
    {
        temp_68 = fma(temp_26, fp_c4.data[26].z, temp_56);
    }
    temp_71 = 0.0 - temp_69 + 1.0;
    temp_72 = fma(temp_63, 0.0 - fp_c4.data[42].y, temp_62 * -fp_c4.data[42].x);
    temp_73 = fma(temp_63, 0.0 - fp_c4.data[43].y, temp_62 * -fp_c4.data[43].x);
    temp_74 = temp_68;
    temp_75 = temp_73;
    temp_76 = temp_72;
    if (temp_14)
    {
        temp_74 = temp_68 + 1.0;
    }
    temp_77 = fma(temp_64, 0.0 - fp_c4.data[44].z, fma(temp_63, 0.0 - fp_c4.data[44].y, temp_62 * -fp_c4.data[44].x));
    temp_78 = inversesqrt(fma(temp_69, 0.0 - temp_69, 1.00001));
    temp_79 = fma(temp_64, 0.0 - fp_c4.data[42].z, temp_72);
    temp_80 = fma(temp_64, 0.0 - fp_c4.data[43].z, temp_73);
    temp_81 = temp_74;
    temp_82 = fp_c3.data[0].w;
    temp_83 = temp_78;
    temp_84 = temp_77;
    if (temp_14)
    {
        temp_81 = min(temp_74, 1.0);
    }
    temp_85 = temp_81;
    if (temp_6)
    {
        temp_75 = 0.349999994;
    }
    temp_86 = temp_75;
    temp_87 = fp_c5.data[29].w;
    if (temp_14)
    {
        temp_85 = temp_81 * temp_81;
    }
    temp_88 = temp_85;
    if (temp_14)
    {
        temp_88 = temp_85 * temp_85;
    }
    temp_89 = temp_88;
    if (temp_14)
    {
        temp_66 = 0.0 - temp_55 + temp_21;
    }
    temp_90 = temp_66;
    if (temp_14)
    {
        temp_90 = temp_66 * fp_c4.data[45].x;
    }
    if (temp_14)
    {
        temp_76 = temp_90 * fp_c5.data[30].w * 5.0; // Shadow improvement #1
    }
    temp_91 = 0.00999999978;
    if (temp_14)
    {
        temp_29 = temp_76;
    }
    temp_92 = temp_29;
    if (temp_14)
    {
        temp_67 = exp2(temp_29);
    }
    temp_93 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1)) != 0;
    temp_94 = in_attr6.x;
    temp_95 = temp_67;
    if (temp_22)
    {
        temp_82 = gl_FragCoord.x / 1.0;
    }
    temp_96 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
    temp_97 = temp_82;
    if (temp_22)
    {
        temp_92 = gl_FragCoord.y / 1.0;
    }
    temp_98 = temp_71 * temp_71;
    temp_99 = temp_98;
    temp_100 = temp_92;
    if (temp_14)
    {
        temp_95 = min(temp_67, 1.0);
    }
    if (!temp_6)
    {
        temp_57 = temp_39 + 0.0 - temp_28;
    }
    if (!temp_6)
    {
        temp_47 = temp_41 + 0.0 - temp_19;
    }
    if (temp_14)
    {
        temp_70 = min(temp_88, temp_95);
    }
    temp_101 = temp_98 * temp_98;
    temp_102 = temp_101;
    if (!temp_6)
    {
        temp_89 = temp_40 + 0.0 - temp_17;
    }
    if (temp_93)
    {
        temp_99 = max(abs(temp_79), abs(temp_80));
    }
    temp_103 = temp_99;
    if (temp_6)
    {
        temp_86 = fma(temp_70, 0.65, temp_75);
    }
    temp_104 = temp_86;
    if (!temp_6)
    {
        temp_102 = fma(temp_57, temp_70, temp_28);
    }
    temp_105 = 1.0 / max(abs(temp_77), max(abs(temp_79), abs(temp_80)));
    temp_106 = temp_102;
    if (!temp_6)
    {
        temp_48 = fma(temp_89, temp_70, temp_17);
    }
    temp_107 = temp_48;
    if (!temp_6)
    {
        temp_104 = fma(temp_47, temp_70, temp_19);
    }
    temp_108 = temp_104;
    if (temp_93)
    {
        temp_103 = max(abs(temp_77), temp_99);
    }
    temp_109 = temp_103;
    if (temp_6)
    {
        temp_106 = temp_39 * temp_104;
    }
    if (temp_93)
    {
        temp_109 = 1.0 / temp_103;
    }
    if (temp_6)
    {
        temp_107 = temp_48 * temp_104;
    }
    if (temp_6)
    {
        temp_108 = temp_47 * temp_104;
    }
    if (temp_22)
    {
        temp_97 = temp_82 * fp_c4.data[54].x;
    }
    temp_110 = temp_97;
    if (temp_22)
    {
        temp_100 = temp_92 * fp_c4.data[54].y;
    }
    temp_111 = 0.0 - fma(texture(g_textures_4_, vec2(in_attr3.z, in_attr3.w)).w, 0.0 - temp_94, temp_94) + 1.0;
    temp_112 = texture(g_textures_0_, vec2(temp_0, temp_1)).xyzw;
    temp_113 = temp_112.w;
    temp_114 = temp_100;
    if (temp_22)
    {
        temp_115 = texture(g_sss_texture, vec2(temp_97, temp_100)).xyz;
        temp_110 = temp_115.x;
        temp_114 = temp_115.y;
        temp_91 = temp_115.z;
    }
    temp_116 = temp_91;
    temp_117 = temp_114;
    if (temp_93)
    {
        temp_83 = temp_79 * temp_109;
    }
    temp_118 = temp_83;
    if (temp_93)
    {
        temp_87 = temp_80 * temp_109;
    }
    temp_119 = temp_79 * temp_105;
    temp_120 = temp_80 * temp_105;
    temp_121 = temp_77 * temp_105;
    temp_122 = fma(temp_106, fp_c4.data[14].x, temp_45) + fp_c4.data[15].x;
    temp_123 = intBitsToFloat(undef);
    temp_124 = temp_122;
    temp_125 = temp_87;
    temp_126 = temp_120;
    if (temp_93)
    {
        temp_123 = temp_77 * temp_109;
    }
    temp_127 = texture(g_ibl_textures_1_, vec3(temp_119, temp_120, temp_121)).xyz;
    temp_128 = texture(g_ibl_textures_2_, vec3(temp_119, temp_120, temp_121)).xyz;
    temp_129 = temp_128.x;
    temp_130 = temp_128.y;
    temp_131 = temp_128.z;
    temp_132 = fma(temp_107, fp_c4.data[14].y, temp_45) + fp_c4.data[15].y;
    temp_133 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_59, fp_c4.data[34].x), fp_c4.data[36].z, temp_122);
    temp_134 = clamp(temp_111 * fma(fp_c5.data[29].w, 2.0, 0.00999999978) * (1.0 / fma(temp_69, temp_78, 1E-06)), 0.0, 1.0);
    temp_135 = texture(g_ibl_textures_3_, vec3(temp_119, temp_120, temp_121)).xyz;
    temp_136 = texture(g_ibl_textures_4_, vec3(temp_119, temp_120, temp_121)).xyz;
    temp_137 = temp_136.x;
    temp_138 = temp_136.y;
    temp_139 = temp_136.z;
    temp_140 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_59, fp_c4.data[34].y), fp_c4.data[36].z, temp_132);
    temp_141 = temp_132;
    temp_142 = temp_133;
    temp_143 = temp_140;
    temp_144 = temp_123;
    if (temp_54)
    {
        temp_124 = temp_133;
    }
    if (temp_54)
    {
        temp_141 = temp_140;
    }
    if (temp_96)
    {
        temp_145 = texture(g_textures_3_, vec2(temp_0, temp_1)).xyzw;
        temp_142 = temp_145.w;
        temp_18 = temp_145.x;
        temp_84 = temp_145.y;
        temp_143 = temp_145.z;
    }
    if (temp_93)
    {
        temp_146 = texture(g_envmap_texture, vec3(temp_83, temp_87, temp_123)).xyz;
        temp_118 = temp_146.x;
        temp_125 = temp_146.y;
        temp_144 = temp_146.z;
    }
    temp_147 = fma(temp_108, fp_c4.data[14].z, temp_45) + fp_c4.data[15].z;
    temp_148 = temp_118;
    temp_149 = temp_125;
    temp_150 = temp_144;
    temp_151 = temp_147;
    if (!temp_93)
    {
        temp_148 = 0.0;
    }
    if (!temp_93)
    {
        temp_149 = 0.0;
    }
    if (!temp_22)
    {
        temp_126 = temp_124;
    }
    temp_152 = temp_126;
    if (!temp_93)
    {
        temp_150 = 0.0;
    }
    if (temp_54)
    {
        temp_151 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_59, fp_c4.data[34].z), fp_c4.data[36].z, temp_147);
    }
    if (!temp_22)
    {
        temp_116 = temp_151;
    }
    temp_153 = fma(temp_70, 0.95, 0.05); // Shadow improvement #2
    temp_154 = temp_153;
    temp_155 = temp_116;
    if (!temp_22)
    {
        temp_154 = temp_141;
    }
    temp_156 = temp_154;
    if (temp_22)
    {
        temp_152 = 0.0 - temp_110 + temp_124;
    }
    temp_157 = temp_152;
    if (temp_22)
    {
        temp_156 = 0.0 - temp_114 + temp_141;
    }
    temp_158 = temp_156;
    if (temp_22)
    {
        temp_157 = fma(temp_152, 0.3, temp_110);
    }
    if (temp_22)
    {
        temp_158 = fma(temp_156, 0.3, temp_114);
    }
    if (temp_22)
    {
        temp_117 = 0.0 - temp_116 + temp_151;
    }
    temp_159 = temp_134 + fma(fma(temp_111, 0.5, 0.5) * temp_113, 0.0 - temp_134, fma(temp_111, 0.5, 0.5) * temp_113);
    temp_160 = temp_158 * 0.839999974;
    if (temp_22)
    {
        temp_155 = fma(temp_117, 0.3, temp_116);
    }
    temp_161 = temp_157 * 0.970000029;
    temp_162 = fma(temp_70, 0.5, 0.5) * fp_c4.data[16].w;
    temp_163 = fma(temp_135.x + 0.0 - temp_137, fp_c5.data[31].x, temp_137);
    temp_164 = fma(temp_135.z + 0.0 - temp_139, fp_c5.data[31].x, temp_139);
    temp_165 = in_attr5.w;
    temp_166 = fma(temp_135.y + 0.0 - temp_138, fp_c5.data[31].x, temp_138);
    temp_167 = temp_155 * 0.779999971;
    temp_168 = fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * fma(temp_69, 0.0 - temp_69, 1) * in_attr7.w;
    temp_169 = fma(temp_71 * temp_101 * temp_153, fp_c5.data[33].x, fp_c5.data[33].y);
    temp_170 = fp_c5.data[32].w;
    if (temp_96)
    {
        temp_170 = temp_142 * fp_c5.data[32].w;
    }
    temp_171 = temp_169 * fp_c5.data[32].x;
    temp_172 = temp_169 * fp_c5.data[32].y;
    temp_173 = temp_169 * fp_c5.data[32].z;
    temp_174 = temp_171;
    temp_175 = temp_172;
    temp_176 = temp_173;
    if (temp_96)
    {
        temp_174 = temp_18 * temp_171;
    }
    if (temp_96)
    {
        temp_175 = temp_172 * temp_84;
    }
    if (temp_96)
    {
        temp_176 = temp_173 * temp_143;
    }
    temp_177 = fma(fma(temp_159, fma(temp_112.x * fp_c5.data[34].x, temp_124, 0.0 - temp_161), temp_161), 0.96, temp_159 * fma(0.0 - temp_163 + fma(temp_127.x + 0.0 - temp_129, fp_c5.data[31].x, temp_129), temp_70, temp_163) * fp_c4.data[16].x * (temp_174 + fp_c5.data[34].w));
    temp_178 = fma(fma(temp_159, fma(temp_112.y * fp_c5.data[34].x, temp_141, 0.0 - temp_160), temp_160), 0.96, temp_159 * fma(0.0 - temp_166 + fma(temp_127.y + 0.0 - temp_130, fp_c5.data[31].x, temp_130), temp_70, temp_166) * fp_c4.data[16].y * (temp_175 + fp_c5.data[34].w));
    temp_179 = fma(fma(temp_159, fma(temp_112.z * fp_c5.data[34].x, temp_151, 0.0 - temp_167), temp_167), 0.96, temp_159 * fma(0.0 - temp_164 + fma(temp_127.z + 0.0 - temp_131, fp_c5.data[31].x, temp_131), temp_70, temp_164) * fp_c4.data[16].z * (temp_176 + fp_c5.data[34].w));

    temp_180 = fma(temp_162 * temp_148, temp_170, temp_177);
    if (!temp_93)
    {
        temp_180 = temp_177;
    }
    temp_181 = fma(temp_162 * temp_150, temp_170, temp_179);
    if (!temp_93)
    {
        temp_181 = temp_179;
    }
    temp_182 = fma(temp_162 * temp_149, temp_170, temp_178);
    if (!temp_93)
    {
        temp_182 = temp_178;
    }
    temp_183 = fma(temp_168 * fp_c4.data[28].x * temp_70, 0.5, temp_180);
    temp_184 = fma(temp_168 * fp_c4.data[28].z * temp_70, 0.5, temp_181);
    temp_185 = fma(temp_168 * fp_c4.data[28].y * temp_70, 0.5, temp_182);
    temp_186 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
    temp_187 = fma(temp_184, 0.1145, fma(temp_185, 0.5866, temp_183 * 0.298900008));
    temp_188 = floatBitsToInt(max(0.0, fma(0.0 - temp_183 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_187, fp_c4.data[31].x), fp_c4.data[32].w, temp_183)));
    temp_189 = floatBitsToInt(max(0.0, fma(0.0 - temp_185 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_187, fp_c4.data[31].y), fp_c4.data[32].w, temp_185)));
    if (!temp_186)
    {
        temp_188 = floatBitsToInt(fma(0.0 - temp_183 + in_attr7.x, temp_165, temp_183));
    }
    temp_190 = floatBitsToInt(max(0.0, fma(0.0 - temp_184 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_187, fp_c4.data[31].z), fp_c4.data[32].w, temp_184)));
    if (!temp_186)
    {
        temp_189 = floatBitsToInt(fma(0.0 - temp_185 + in_attr7.y, temp_165, temp_185));
    }
    if (!temp_186)
    {
        temp_190 = floatBitsToInt(fma(0.0 - temp_184 + in_attr7.z, temp_165, temp_184));
    }
    SV_Target0.x = intBitsToFloat(temp_188);
    SV_Target0.y = intBitsToFloat(temp_189);
    SV_Target0.z = intBitsToFloat(temp_190);
    SV_Target0.w = max(temp_113, fp_c5.data[39].w);
   // return; Yuzu crash;
}
