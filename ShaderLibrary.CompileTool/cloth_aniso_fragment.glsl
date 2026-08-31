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

layout (binding = 1, std140) uniform _Scene
{
    precise vec4 data[4096];
} fp_c4;

layout (binding = 0, std140) uniform _Shader
{
    precise vec4 data[4096];
} fp_c3;

layout (binding = 2, std140) uniform _Batch
{
    precise vec4 data[4096];
} fp_c5;

layout (binding = 2) uniform sampler2D g_textures_2_;
layout (binding = 0) uniform sampler2D g_textures_0_;
layout (binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout (binding = 9) uniform samplerCube g_ibl_textures_0_;
layout (binding = 4) uniform sampler2D g_textures_4_;
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
    precise vec4 temp_3;
    precise float temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    uint temp_11;
    precise float temp_12;
    precise float temp_13;
    precise float temp_14;
    bool temp_15;
    bool temp_16;
    bool temp_17;
    precise float temp_18;
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
    precise float temp_42;
    precise float temp_43;
    precise float temp_44;
    precise float temp_45;
    precise float temp_46;
    bool temp_47;
    precise float temp_48;
    precise float temp_49;
    precise float temp_50;
    precise float temp_51;
    precise float temp_52;
    precise float temp_53;
    precise float temp_54;
    precise float temp_55;
    bool temp_56;
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
    precise vec3 temp_81;
    precise float temp_82;
    precise float temp_83;
    precise float temp_84;
    precise vec3 temp_85;
    precise float temp_86;
    precise vec3 temp_87;
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
    bool temp_116;
    precise float temp_117;
    precise float temp_118;
    precise float temp_119;
    precise float temp_120;
    precise float temp_121;
    precise float temp_122;
    precise float temp_123;
    bool temp_124;
    precise float temp_125;
    precise float temp_126;
    bool temp_127;
    precise float temp_128;
    precise float temp_129;
    precise float temp_130;
    precise float temp_131;
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
    precise vec3 temp_151;
    precise vec3 temp_152;
    precise float temp_153;
    precise float temp_154;
    precise float temp_155;
    precise vec3 temp_156;
    precise vec3 temp_157;
    precise float temp_158;
    precise float temp_159;
    precise float temp_160;
    precise vec4 temp_161;
    precise vec3 temp_162;
    precise float temp_163;
    precise float temp_164;
    precise float temp_165;
    precise float temp_166;
    bool temp_167;
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
    precise float temp_186;
    precise float temp_187;
    precise float temp_188;
    precise float temp_189;
    precise float temp_190;
    precise float temp_191;
    precise float temp_192;
    precise float temp_193;
    int temp_194;
    int temp_195;
    int temp_196;
    temp_0 = in_attr3.x;
    temp_1 = in_attr3.y;
    temp_2 = texture(g_textures_2_, vec2(temp_0, temp_1)).xy;
    temp_3 = texture(g_textures_0_, vec2(temp_0, temp_1)).xyzw;
    temp_4 = in_attr1.x;
    temp_5 = in_attr1.y;
    temp_6 = in_attr1.z;
    temp_7 = inversesqrt(fma(temp_6, temp_6, fma(temp_5, temp_5, temp_4 * temp_4)));
    temp_8 = temp_4 * temp_7;
    temp_9 = temp_5 * temp_7;
    temp_10 = temp_6 * temp_7;
    temp_11 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 2, 2);
    temp_12 = fma(temp_10, fp_c4.data[44].z, fma(temp_9, fp_c4.data[44].y, temp_8 * fp_c4.data[44].x));
    temp_13 = fma(temp_10, fp_c4.data[42].z, fma(temp_9, fp_c4.data[42].y, temp_8 * fp_c4.data[42].x));
    temp_14 = fma(temp_10, fp_c4.data[43].z, fma(temp_9, fp_c4.data[43].y, temp_8 * fp_c4.data[43].x));
    temp_15 = int(temp_11) == 3;
    temp_16 = int(temp_11) == 2;
    temp_17 = int(temp_11) == 1;
    temp_18 = in_attr4.x;
    temp_19 = fma(temp_2.y, 2.0, -1.0);
    temp_20 = temp_19 * 2.0 * temp_19 * temp_19;
    temp_21 = fma(temp_19, 1.5, temp_20);
    temp_22 = fma(fma(temp_2.x, 2.0, -1.0), 1.5, temp_20);
    temp_23 = in_attr4.z;
    temp_24 = in_attr4.y;
    temp_25 = fma(temp_22, temp_4, temp_21 * in_attr2.x) + in_attr0.x;
    temp_26 = fma(temp_22, temp_5, temp_21 * in_attr2.y) + in_attr0.y;
    temp_27 = fma(temp_22, temp_6, temp_21 * in_attr2.z) + in_attr0.z;
    temp_28 = inversesqrt(fma(temp_27, temp_27, fma(temp_26, temp_26, temp_25 * temp_25)));
    temp_29 = inversesqrt(fma(temp_23, temp_23, fma(temp_24, temp_24, temp_18 * temp_18)));
    temp_30 = temp_25 * temp_28;
    temp_31 = temp_26 * temp_28;
    temp_32 = temp_27 * temp_28;
    temp_33 = temp_18 * temp_29;
    temp_34 = temp_24 * temp_29;
    temp_35 = temp_23 * temp_29;
    temp_36 = fma(temp_32, fp_c4.data[42].z, fma(temp_31, fp_c4.data[42].y, temp_30 * fp_c4.data[42].x));
    temp_37 = fma(temp_32, fp_c4.data[43].z, fma(temp_31, fp_c4.data[43].y, temp_30 * fp_c4.data[43].x));
    temp_38 = fma(temp_32, fp_c4.data[44].z, fma(temp_31, fp_c4.data[44].y, temp_30 * fp_c4.data[44].x));
    temp_39 = fma(temp_35, fp_c4.data[44].z, fma(temp_34, fp_c4.data[44].y, temp_33 * fp_c4.data[44].x));
    temp_40 = fma(temp_35, fp_c4.data[42].z, fma(temp_34, fp_c4.data[42].y, temp_33 * fp_c4.data[42].x));
    temp_41 = fma(temp_35, fp_c4.data[43].z, fma(temp_34, fp_c4.data[43].y, temp_33 * fp_c4.data[43].x));
    temp_42 = fma(temp_12, temp_38, fma(temp_14, temp_37, temp_13 * temp_36));
    temp_43 = fma(temp_36, 0.0 - temp_42, temp_13);
    temp_44 = fma(temp_37, 0.0 - temp_42, temp_14);
    temp_45 = fma(temp_38, 0.0 - temp_42, temp_12);
    temp_46 = 1.0 / max(abs(temp_39), max(abs(temp_40), abs(temp_41)));
    temp_47 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_48 = intBitsToFloat(undef);
    temp_49 = temp_3.w;
    temp_50 = fp_c3.data[0].w;
    temp_51 = temp_1;
    if (temp_47)
    {
        temp_48 = in_attr5.x;
    }
    temp_52 = intBitsToFloat(undef);
    temp_53 = temp_48;
    if (temp_47)
    {
        temp_52 = in_attr5.y;
    }
    temp_54 = intBitsToFloat(undef);
    temp_55 = temp_52;
    if (temp_47)
    {
        temp_54 = temp_30 * fp_c4.data[26].x;
    }
    temp_56 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 9, 1)) == 1;
    temp_57 = inversesqrt(fma(temp_45, temp_45, fma(temp_44, temp_44, temp_43 * temp_43)));
    temp_58 = temp_54;
    if (temp_47)
    {
        temp_58 = fma(temp_31, fp_c4.data[26].y, temp_54);
    }
    temp_59 = intBitsToFloat(undef);
    temp_60 = temp_58;
    if (temp_56)
    {
        temp_59 = in_attr3.z;
    }
    temp_61 = temp_43 * temp_57;
    temp_62 = intBitsToFloat(undef);
    if (temp_56)
    {
        temp_62 = in_attr3.w;
    }
    temp_63 = fma(temp_43, 0.0 - temp_57, temp_36);
    if (temp_47)
    {
        temp_53 = texture(g_shadow_depth_textures_0_, vec2(temp_48, temp_52)).x;
    }
    temp_64 = temp_44 * temp_57;
    temp_65 = fma(temp_44, 0.0 - temp_57, temp_37);
    temp_66 = temp_45 * temp_57;
    temp_67 = fma(temp_45, 0.0 - temp_57, temp_38);
    temp_68 = fma(temp_63, 0.9, temp_61);
    temp_69 = fma(temp_63, 0.1, temp_61);
    if (!temp_15)
    {
        temp_68 = temp_61;
    }
    temp_70 = 1.0 / max(abs(temp_38), max(abs(temp_36), abs(temp_37)));
    temp_71 = fma(temp_65, 0.9, temp_64);
    temp_72 = temp_68;
    if (!temp_15)
    {
        temp_71 = temp_64;
    }
    temp_73 = temp_71;
    temp_74 = fma(temp_65, 0.1, temp_64);
    if (temp_16)
    {
        temp_72 = fma(temp_63, 0.5, temp_61);
    }
    if (temp_16)
    {
        temp_73 = fma(temp_65, 0.5, temp_64);
    }
    temp_75 = fma(temp_67, 0.9, temp_66);
    if (!temp_15)
    {
        temp_75 = temp_66;
    }
    temp_76 = temp_38 * temp_70;
    temp_77 = temp_36 * temp_70;
    temp_78 = temp_37 * temp_70;
    temp_79 = temp_75;
    temp_80 = fma(temp_67, 0.1, temp_66);
    if (temp_16)
    {
        temp_79 = fma(temp_67, 0.5, temp_66);
    }
    temp_81 = textureLod(g_ibl_textures_0_, vec3(temp_77, temp_78, temp_76), 1.0).xyz;
    temp_82 = temp_81.x;
    temp_83 = temp_81.y;
    temp_84 = temp_81.z;
    if (!temp_17)
    {
        temp_69 = temp_72;
    }
    if (!temp_17)
    {
        temp_74 = temp_73;
    }
    temp_85 = textureLod(g_ibl_textures_0_, vec3(temp_77, temp_78, temp_76), 0.0).xyz;
    temp_86 = temp_85.y;
    temp_87 = textureLod(g_ibl_textures_0_, vec3(temp_40 * -temp_46, temp_41 * -temp_46, temp_39 * -temp_46), 0.0).xyz;
    temp_88 = temp_87.x;
    temp_89 = temp_87.z;
    temp_90 = temp_86;
    temp_91 = temp_88;
    temp_92 = temp_89;
    if (temp_56)
    {
        temp_49 = texture(g_textures_4_, vec2(temp_59, temp_62)).w;
    }
    if (!temp_17)
    {
        temp_80 = temp_79;
    }
    if (temp_47)
    {
        temp_60 = fma(temp_32, fp_c4.data[26].z, temp_58);
    }
    temp_93 = temp_60;
    if (temp_47)
    {
        temp_93 = temp_60 + 1.0;
    }
    temp_94 = temp_93;
    if (temp_47)
    {
        temp_94 = min(temp_93, 1.0);
    }
    temp_95 = inversesqrt(fma(temp_80, temp_80, fma(temp_74, temp_74, temp_69 * temp_69)));
    temp_96 = clamp(fma(temp_38, temp_39, fma(temp_37, temp_41, temp_36 * temp_40)), 0.0, 1.0);
    temp_97 = temp_95 * temp_69;
    temp_98 = temp_95 * temp_74;
    temp_99 = temp_95 * temp_80;
    temp_100 = fma(temp_39, temp_99, fma(temp_41, temp_98, temp_40 * temp_97));
    temp_101 = fma(temp_100, 0.0 - temp_100, 1.00001);
    temp_102 = temp_99 * -temp_100;
    temp_103 = fma(temp_102, 2.0, temp_39);
    temp_104 = fma(temp_97 * -temp_100, 2.0, temp_40);
    temp_105 = in_attr6.w;
    temp_106 = temp_102;
    temp_107 = 0.200000003;
    if (!temp_47)
    {
        temp_106 = 1.0;
    }
    temp_108 = temp_101 * inversesqrt(temp_101);
    temp_109 = fma(temp_108, 0.8, 0.200000003);
    temp_110 = temp_106;
    if (temp_47)
    {
        temp_107 = in_attr5.z;
    }
    temp_111 = temp_107;
    if (!temp_15)
    {
        temp_109 = temp_108;
    }
    temp_112 = temp_109;
    temp_113 = fma(temp_108, 0.6, 0.400000006);
    if (temp_16)
    {
        temp_112 = fma(temp_108, 0.95, 0.05); // Shadow improvement #1
    }
    temp_114 = temp_112;
    if (!temp_17)
    {
        temp_113 = temp_112;
    }
    temp_115 = fma(temp_98 * -temp_100, 2.0, temp_41);
    if (!temp_47)
    {
        temp_114 = 1.0;
    }
    temp_116 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
    temp_117 = temp_114;
    if (temp_47)
    {
        temp_111 = 0.0 - temp_107 + temp_53;
    }
    if (temp_47)
    {
        temp_117 = temp_111 * fp_c4.data[45].x;
    }
    temp_118 = temp_117;
    if (temp_47)
    {
        temp_118 = temp_117 * fp_c5.data[30].w * 5.0; // Shadow improvement #2
    }
    temp_119 = temp_118;
    if (temp_47)
    {
        temp_110 = temp_118;
    }
    temp_120 = temp_110;
    if (temp_47)
    {
        temp_120 = exp2(temp_110);
    }
    temp_121 = temp_120;
    if (temp_47)
    {
        temp_119 = temp_94 * temp_94;
    }
    temp_122 = clamp((fma(fma(temp_32, fp_c4.data[33].z, fma(temp_31, fp_c4.data[33].y, temp_30 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
    temp_123 = temp_119;
    if (temp_47)
    {
        temp_123 = temp_119 * temp_119;
    }
    temp_124 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1)) != 0;
    temp_125 = temp_123;
    if (temp_47)
    {
        temp_121 = min(temp_120, 1.0);
    }
    temp_126 = fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_122, fp_c4.data[34].y);
    temp_127 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
    temp_128 = temp_126;
    if (temp_47)
    {
        temp_125 = min(temp_123, temp_121);
    }
    if (temp_124)
    {
        temp_90 = max(abs(temp_104), abs(temp_115));
    }
    temp_129 = temp_90;
    if (temp_124)
    {
        temp_129 = max(abs(temp_103), temp_90);
    }
    temp_130 = temp_129;
    if (temp_124)
    {
        temp_130 = 1.0 / temp_129;
    }
    temp_131 = temp_130;
    if (temp_47)
    {
        temp_50 = temp_125;
    }
    temp_132 = 1.0 / max(abs(temp_103), max(abs(temp_104), abs(temp_115)));
    temp_133 = temp_108 * fma(temp_121, 0.6, 0.400000006) * fma(temp_96, 0.0 - temp_96, 1) * fma(temp_96, 0.0 - temp_96, 1) * fma(temp_96, 0.0 - temp_96, 1) * fma(temp_96, 0.0 - temp_96, 1) * fp_c5.data[33].z;
    temp_134 = fma(fma(temp_85.x + 0.0 - temp_82, temp_125, temp_82), fp_c4.data[14].x, temp_105) + fp_c4.data[15].x;
    temp_135 = temp_133 * temp_88;
    temp_136 = temp_133 * temp_87.y;
    temp_137 = temp_134;
    temp_138 = temp_50;
    if (temp_124)
    {
        temp_55 = temp_103 * temp_130;
    }
    temp_139 = fma(temp_135, 0.5, temp_134);
    temp_140 = fma(temp_136, 0.5, fma(fma(temp_86 + 0.0 - temp_83, temp_125, temp_83), fp_c4.data[14].y, temp_105) + fp_c4.data[15].y);
    temp_141 = temp_140;
    temp_142 = temp_55;
    if (temp_124)
    {
        temp_137 = temp_104 * temp_130;
    }
    temp_143 = temp_137;
    if (temp_124)
    {
        temp_131 = temp_115 * temp_130;
    }
    temp_144 = temp_115 * temp_132;
    temp_145 = temp_104 * temp_132;
    temp_146 = temp_103 * temp_132;
    temp_147 = fma(temp_126, fp_c4.data[36].z, temp_140);
    temp_148 = temp_131;
    if (!temp_116)
    {
        temp_128 = temp_139;
    }
    temp_149 = temp_128;
    if (!temp_116)
    {
        temp_147 = temp_140;
    }
    if (temp_116)
    {
        temp_149 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_122, fp_c4.data[34].x), fp_c4.data[36].z, temp_139);
    }
    temp_150 = temp_133 * temp_89;
    temp_151 = texture(g_ibl_textures_1_, vec3(temp_145, temp_144, temp_146)).xyz;
    temp_152 = texture(g_ibl_textures_2_, vec3(temp_145, temp_144, temp_146)).xyz;
    temp_153 = temp_152.x;
    temp_154 = temp_152.y;
    temp_155 = temp_152.z;
    temp_156 = texture(g_ibl_textures_3_, vec3(temp_145, temp_144, temp_146)).xyz;
    temp_157 = texture(g_ibl_textures_4_, vec3(temp_145, temp_144, temp_146)).xyz;
    temp_158 = temp_157.x;
    temp_159 = temp_157.y;
    temp_160 = temp_157.z;
    if (temp_127)
    {
        temp_161 = texture(g_textures_3_, vec2(temp_0, temp_1)).xyzw;
        temp_91 = temp_161.x;
        temp_141 = temp_161.y;
        temp_92 = temp_161.z;
        temp_51 = temp_161.w;
    }
    if (temp_124)
    {
        temp_162 = texture(g_envmap_texture, vec3(temp_137, temp_131, temp_55)).xyz;
        temp_148 = temp_162.y;
        temp_142 = temp_162.z;
        temp_143 = temp_162.x;
    }
    temp_163 = temp_143;
    temp_164 = temp_148;
    temp_165 = temp_142;
    if (!temp_47)
    {
        temp_138 = 1.0;
    }
    if (!temp_124)
    {
        temp_163 = 0.0;
    }
    if (!temp_124)
    {
        temp_164 = 0.0;
    }
    if (!temp_124)
    {
        temp_165 = 0.0;
    }
    temp_166 = fma(temp_150, 0.5, fma(fma(temp_85.z + 0.0 - temp_84, temp_125, temp_84), fp_c4.data[14].z, temp_105) + fp_c4.data[15].z);
    temp_167 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
    temp_168 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_122, fp_c4.data[34].z), fp_c4.data[36].z, temp_166);
    if (!temp_116)
    {
        temp_168 = temp_166;
    }
    temp_169 = fma(temp_100, -0.9, 0.100000001) * fma(temp_100, -0.9, 0.100000001) * fma(temp_100, -0.9, 0.100000001) * fma(temp_100, -0.9, 0.100000001);
    temp_170 = fma(temp_138, 0.5, 0.5);
    temp_171 = fma(temp_169, fp_c5.data[33].x, fp_c5.data[33].y);
    temp_172 = fma(temp_169 * fp_c5.data[33].x, 2.0, 1.0) * fp_c5.data[32].w;
    temp_173 = temp_171 * fp_c5.data[32].x;
    temp_174 = temp_171 * fp_c5.data[32].y;
    temp_175 = fma(temp_156.x + 0.0 - temp_158, fp_c5.data[31].x, temp_158);
    temp_176 = temp_171 * fp_c5.data[32].z;
    temp_177 = temp_173;
    temp_178 = temp_174;
    temp_179 = temp_176;
    temp_180 = temp_172;
    if (temp_127)
    {
        temp_177 = temp_91 * temp_173;
    }
    temp_181 = fma(temp_156.y + 0.0 - temp_159, fp_c5.data[31].x, temp_159);
    if (temp_127)
    {
        temp_178 = temp_141 * temp_174;
    }
    temp_182 = fma(temp_156.z + 0.0 - temp_160, fp_c5.data[31].x, temp_160);
    if (temp_127)
    {
        temp_179 = temp_92 * temp_176;
    }
    if (temp_127)
    {
        temp_180 = temp_172 * temp_51;
    }
    temp_183 = in_attr5.w;
    temp_184 = fma(fma(fma(temp_3.x, fp_c5.data[34].x, 0.0 - fp_c5.data[29].x), temp_113, fp_c5.data[29].x) * temp_149, 0.96, fma(0.0 - temp_175 + fma(temp_151.x + 0.0 - temp_153, fp_c5.data[31].x, temp_153), temp_138, temp_175) * fp_c4.data[16].x * (temp_177 + fp_c5.data[34].w));
    temp_185 = fma(fma(fma(temp_3.y, fp_c5.data[34].x, 0.0 - fp_c5.data[29].y), temp_113, fp_c5.data[29].y) * temp_147, 0.96, fma(0.0 - temp_181 + fma(temp_151.y + 0.0 - temp_154, fp_c5.data[31].x, temp_154), temp_138, temp_181) * fp_c4.data[16].y * (temp_178 + fp_c5.data[34].w));
    temp_186 = fma(temp_170 * temp_163, temp_180, temp_184);
    if (!temp_124)
    {
        temp_186 = temp_184;
    }
    temp_187 = fma(fma(fma(temp_3.z, fp_c5.data[34].x, 0.0 - fp_c5.data[29].z), temp_113, fp_c5.data[29].z) * temp_168, 0.96, fma(0.0 - temp_182 + fma(temp_151.z + 0.0 - temp_155, fp_c5.data[31].x, temp_155), temp_138, temp_182) * fp_c4.data[16].z * (temp_179 + fp_c5.data[34].w));

    temp_188 = fma(temp_170 * temp_164, temp_180, temp_185);
    if (!temp_124)
    {
        temp_188 = temp_185;
    }
    temp_189 = fma(temp_135, 0.5, temp_186);
    temp_190 = fma(temp_170 * temp_165, temp_180, temp_187);
    if (!temp_124)
    {
        temp_190 = temp_187;
    }
    temp_191 = fma(temp_136, 0.5, temp_188);
    temp_192 = fma(temp_150, 0.5, temp_190);
    temp_193 = fma(temp_192, 0.1145, fma(temp_191, 0.5866, temp_189 * 0.298900008));
    temp_194 = floatBitsToInt(max(0.0, fma(0.0 - temp_191 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_193, fp_c4.data[31].y), fp_c4.data[32].w, temp_191)));
    if (!temp_167)
    {
        temp_194 = floatBitsToInt(fma(0.0 - temp_191 + in_attr7.y, temp_183, temp_191));
    }
    temp_195 = floatBitsToInt(max(0.0, fma(0.0 - temp_189 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_193, fp_c4.data[31].x), fp_c4.data[32].w, temp_189)));
    if (!temp_167)
    {
        temp_195 = floatBitsToInt(fma(0.0 - temp_189 + in_attr7.x, temp_183, temp_189));
    }
    temp_196 = floatBitsToInt(max(0.0, fma(0.0 - temp_192 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_193, fp_c4.data[31].z), fp_c4.data[32].w, temp_192)));
    if (!temp_167)
    {
        temp_196 = floatBitsToInt(fma(0.0 - temp_192 + in_attr7.z, temp_183, temp_192));
    }
    SV_Target0.x = intBitsToFloat(temp_195);
    SV_Target0.y = intBitsToFloat(temp_194);
    SV_Target0.z = intBitsToFloat(temp_196);
    SV_Target0.w = max(temp_49, fp_c5.data[39].w);
    // return; Yuzu crash;
}
