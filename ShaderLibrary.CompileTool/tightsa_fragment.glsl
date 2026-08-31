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
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    precise float temp_11;
    bool temp_12;
    int temp_13;
    precise float temp_14;
    precise float temp_15;
    precise float temp_16;
    precise float temp_17;
    precise float temp_18;
    precise float temp_19;
    precise float temp_20;
    precise float temp_21;
    precise float temp_22;
    bool temp_23;
    bool temp_24;
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
    precise vec3 temp_46;
    precise vec3 temp_47;
    precise float temp_48;
    precise float temp_49;
    precise float temp_50;
    precise vec4 temp_51;
    precise float temp_52;
    precise float temp_53;
    precise float temp_54;
    precise float temp_55;
    precise float temp_56;
    precise float temp_57;
    precise vec3 temp_58;
    precise float temp_59;
    precise float temp_60;
    precise float temp_61;
    bool temp_62;
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
    precise float temp_93;
    precise float temp_94;
    precise float temp_95;
    precise float temp_96;
    precise float temp_97;
    precise float temp_98;
    precise float temp_99;
    precise float temp_100;
    bool temp_101;
    uint temp_102;
    precise float temp_103;
    precise float temp_104;
    bool temp_105;
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
    precise vec3 temp_121;
    precise vec3 temp_122;
    precise float temp_123;
    precise float temp_124;
    precise float temp_125;
    precise vec3 temp_126;
    precise vec3 temp_127;
    precise float temp_128;
    precise float temp_129;
    precise float temp_130;
    precise float temp_131;
    precise vec4 temp_132;
    precise vec3 temp_133;
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
    bool temp_184;
    precise float temp_185;
    precise float temp_186;
    int temp_187;
    int temp_188;
    int temp_189;
    temp_0 = in_attr3.x;
    temp_1 = in_attr3.y;
    temp_2 = texture(g_textures_2_, vec2(temp_0, temp_1)).xy;
    temp_3 = in_attr2.y;
    temp_4 = in_attr1.y;
    temp_5 = fma(temp_2.y, 2.0, -1.0);
    temp_6 = temp_5 * 2.0 * temp_5 * temp_5;
    temp_7 = fma(temp_5, 1.5, temp_6);
    temp_8 = fma(fma(temp_2.x, 2.0, -1.0), 1.5, temp_6);
    temp_9 = fma(temp_8, in_attr1.x, temp_7 * in_attr2.x) + in_attr0.x;
    temp_10 = fma(temp_8, temp_4, temp_7 * temp_3) + in_attr0.y;
    temp_11 = fma(temp_8, in_attr1.z, temp_7 * in_attr2.z) + in_attr0.z;
    temp_12 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_13 = 1 & floatBitsToInt(fp_c3.data[0].z);
    temp_14 = temp_3;
    temp_15 = intBitsToFloat(temp_13);
    temp_16 = 1.0;
    temp_17 = temp_11;
    temp_18 = temp_4;
    temp_19 = temp_1;
    temp_20 = temp_0;
    if (temp_12)
    {
        temp_14 = in_attr5.x;
    }
    temp_21 = intBitsToFloat(undef);
    temp_22 = temp_14;
    if (temp_12)
    {
        temp_21 = in_attr5.y;
    }
    temp_23 = temp_13 == 0;
    temp_24 = temp_13 == 1;
    temp_25 = inversesqrt(fma(temp_11, temp_11, fma(temp_10, temp_10, temp_9 * temp_9)));
    temp_26 = temp_9 * temp_25;
    if (temp_23)
    {
        temp_15 = gl_FragCoord.x / 1.0;
    }
    temp_27 = temp_10 * temp_25;
    if (temp_12)
    {
        temp_22 = texture(g_shadow_depth_textures_0_, vec2(temp_14, temp_21)).x;
    }
    temp_28 = temp_11 * temp_25;
    temp_29 = intBitsToFloat(undef);
    if (!temp_24)
    {
        temp_29 = 1.0;
    }
    temp_30 = fma(temp_27, fp_c4.data[42].y, temp_26 * fp_c4.data[42].x);
    temp_31 = fma(temp_28, fp_c4.data[42].z, temp_30);
    temp_32 = temp_30;
    temp_33 = temp_31;
    if (temp_23)
    {
        temp_32 = gl_FragCoord.y / 1.0;
    }
    temp_34 = fma(temp_28, fp_c4.data[43].z, fma(temp_27, fp_c4.data[43].y, temp_26 * fp_c4.data[43].x));
    temp_35 = fma(temp_28, fp_c4.data[44].z, fma(temp_27, fp_c4.data[44].y, temp_26 * fp_c4.data[44].x));
    temp_36 = temp_34;
    temp_37 = temp_35;
    if (temp_23)
    {
        temp_16 = temp_15 * fp_c4.data[54].x;
    }
    temp_38 = 1.0 / max(abs(temp_35), max(abs(temp_31), abs(temp_34)));
    temp_39 = temp_35 * temp_38;
    temp_40 = temp_31 * temp_38;
    temp_41 = temp_34 * temp_38;
    temp_42 = intBitsToFloat(undef);
    temp_43 = temp_38;
    temp_44 = temp_16;
    if (temp_23)
    {
        temp_42 = temp_32 * fp_c4.data[54].y;
    }
    temp_45 = temp_42;
    if (!temp_24)
    {
        temp_46 = textureLod(g_ibl_textures_0_, vec3(temp_40, temp_41, temp_39), temp_29).xyz;
        temp_17 = temp_46.x;
        temp_18 = temp_46.y;
        temp_43 = temp_46.z;
    }
    temp_47 = textureLod(g_ibl_textures_0_, vec3(temp_40, temp_41, temp_39), 0.0).xyz;
    temp_48 = temp_47.x;
    temp_49 = temp_47.y;
    temp_50 = temp_47.z;
    temp_51 = texture(g_textures_0_, vec2(temp_0, temp_1)).xyzw;
    temp_52 = intBitsToFloat(undef);
    temp_53 = temp_50;
    temp_54 = temp_49;
    temp_55 = temp_48;
    temp_56 = temp_17;
    temp_57 = temp_18;
    if (temp_23)
    {
        temp_58 = texture(g_sss_texture, vec2(temp_16, temp_42)).xyz;
        temp_44 = temp_58.x;
        temp_52 = temp_58.z;
        temp_45 = temp_58.y;
    }
    temp_59 = in_attr4.x;
    temp_60 = in_attr4.y;
    temp_61 = in_attr4.z;
    temp_62 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
    temp_63 = inversesqrt(fma(temp_61, temp_61, fma(temp_60, temp_60, temp_59 * temp_59)));
    temp_64 = temp_59 * temp_63;
    temp_65 = temp_60 * temp_63;
    temp_66 = temp_61 * temp_63;
    temp_67 = fma(temp_66, fp_c4.data[42].z, fma(temp_65, fp_c4.data[42].y, temp_64 * fp_c4.data[42].x));
    temp_68 = temp_67;
    temp_69 = temp_44;
    if (temp_12)
    {
        temp_33 = in_attr5.z;
    }
    if (temp_12)
    {
        temp_68 = temp_26 * fp_c4.data[26].x;
    }
    temp_70 = fma(temp_28, temp_66, fma(temp_27, temp_65, temp_26 * temp_64));
    if (temp_12)
    {
        temp_36 = fma(temp_27, fp_c4.data[26].y, temp_68);
    }
    temp_71 = temp_36;
    if (temp_12)
    {
        temp_71 = fma(temp_28, fp_c4.data[26].z, temp_36);
    }
    temp_72 = temp_28 * -temp_70;
    temp_73 = fma(temp_66, fp_c4.data[44].z, fma(temp_65, fp_c4.data[44].y, temp_64 * fp_c4.data[44].x));
    temp_74 = temp_27 * -temp_70;
    temp_75 = fma(temp_26 * -temp_70, 2.0, temp_64);
    temp_76 = temp_71;
    temp_77 = temp_74;
    temp_78 = temp_73;
    temp_79 = temp_72;
    if (temp_12)
    {
        temp_76 = temp_71 + 1.0;
    }
    temp_80 = fma(temp_72, 2.0, temp_66);
    temp_81 = clamp((fma(fma(temp_28, fp_c4.data[33].z, fma(temp_27, fp_c4.data[33].y, temp_26 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
    temp_82 = clamp(fma(temp_73, temp_35, fma(fma(temp_66, fp_c4.data[43].z, fma(temp_65, fp_c4.data[43].y, temp_64 * fp_c4.data[43].x)), temp_34, temp_67 * temp_31)), 0.0, 1.0);
    temp_83 = fma(temp_74, 2.0, temp_65);
    temp_84 = temp_76;
    temp_85 = temp_81;
    if (temp_12)
    {
        temp_84 = min(temp_76, 1.0);
    }
    temp_86 = 0.0 - fp_c4.data[34].x + fp_c4.data[35].x;
    temp_87 = temp_84;
    temp_88 = temp_86;
    if (temp_12)
    {
        temp_87 = temp_84 * temp_84;
    }
    temp_89 = temp_87;
    if (temp_24)
    {
        temp_88 = 0.349999994;
    }
    temp_90 = in_attr6.w;
    temp_91 = temp_88;
    if (temp_12)
    {
        temp_89 = temp_87 * temp_87;
    }
    if (!temp_12)
    {
        temp_85 = 1.0;
    }
    temp_92 = temp_85;
    if (temp_12)
    {
        temp_37 = 0.0 - temp_33 + temp_22;
    }
    if (temp_12)
    {
        temp_77 = temp_37 * fp_c4.data[45].x;
    }
    temp_93 = fma(temp_83, 0.0 - fp_c4.data[44].y, temp_75 * -fp_c4.data[44].x);
    temp_94 = temp_77;
    temp_95 = temp_93;
    if (temp_12)
    {
        temp_94 = temp_77 * fp_c5.data[30].w * 5.0; // Shadow improvement #1
    }
    temp_96 = fma(temp_80, 0.0 - fp_c4.data[42].z, fma(temp_83, 0.0 - fp_c4.data[42].y, temp_75 * -fp_c4.data[42].x));
    temp_97 = fma(temp_80, 0.0 - fp_c4.data[43].z, fma(temp_83, 0.0 - fp_c4.data[43].y, temp_75 * -fp_c4.data[43].x));
    temp_98 = fma(temp_80, 0.0 - fp_c4.data[44].z, temp_93);
    temp_99 = temp_94;
    temp_100 = fp_c3.data[0].w;
    if (temp_12)
    {
        temp_99 = temp_94;
    }
    if (temp_12)
    {
        temp_95 = exp2(temp_99);
    }
    temp_101 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1)) != 0;
    temp_102 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1);
    temp_103 = temp_95;
    temp_104 = uintBitsToFloat(temp_102);
    if (temp_12)
    {
        temp_103 = min(temp_95, 1.0);
    }
    temp_105 = int(temp_102) == 1;
    temp_106 = temp_103;
    if (temp_12)
    {
        temp_92 = min(temp_89, temp_103);
    }
    if (temp_101)
    {
        temp_104 = max(abs(temp_96), abs(temp_97));
    }
    temp_107 = max(abs(temp_96), abs(temp_97));
    temp_108 = temp_107;
    if (temp_24)
    {
        temp_91 = fma(temp_92, 0.65, temp_88);
    }
    temp_109 = temp_91;
    if (!temp_24)
    {
        temp_100 = temp_48 + 0.0 - temp_17;
    }
    temp_110 = intBitsToFloat(undef);
    if (!temp_24)
    {
        temp_110 = temp_49 + 0.0 - temp_18;
    }
    if (temp_101)
    {
        temp_106 = max(abs(temp_98), temp_104);
    }
    temp_111 = temp_106;
    if (!temp_24)
    {
        temp_53 = temp_50 + 0.0 - temp_43;
    }
    if (temp_101)
    {
        temp_111 = 1.0 / temp_106;
    }
    if (temp_24)
    {
        temp_78 = temp_48 * temp_91;
    }
    temp_112 = 1.0 / max(abs(temp_98), temp_107);
    temp_113 = temp_78;
    if (temp_24)
    {
        temp_79 = temp_49 * temp_91;
    }
    temp_114 = temp_79;
    if (!temp_24)
    {
        temp_113 = fma(temp_100, temp_92, temp_17);
    }
    if (!temp_24)
    {
        temp_114 = fma(temp_110, temp_92, temp_18);
    }
    if (temp_24)
    {
        temp_108 = temp_53 * temp_91;
    }
    temp_115 = temp_108;
    if (!temp_24)
    {
        temp_115 = fma(temp_53, temp_92, temp_43);
    }
    if (temp_101)
    {
        temp_54 = temp_97 * temp_111;
    }
    temp_116 = temp_54;
    if (temp_101)
    {
        temp_109 = temp_98 * temp_111;
    }
    temp_117 = temp_96 * temp_112;
    temp_118 = temp_97 * temp_112;
    temp_119 = temp_98 * temp_112;
    temp_120 = temp_109;
    if (temp_101)
    {
        temp_55 = temp_96 * temp_111;
    }
    temp_121 = texture(g_ibl_textures_1_, vec3(temp_117, temp_118, temp_119)).xyz;
    temp_122 = texture(g_ibl_textures_2_, vec3(temp_117, temp_118, temp_119)).xyz;
    temp_123 = temp_122.x;
    temp_124 = temp_122.y;
    temp_125 = temp_122.z;
    temp_126 = texture(g_ibl_textures_3_, vec3(temp_117, temp_118, temp_119)).xyz;
    temp_127 = texture(g_ibl_textures_4_, vec3(temp_117, temp_118, temp_119)).xyz;
    temp_128 = temp_127.x;
    temp_129 = temp_127.y;
    temp_130 = temp_127.z;
    temp_131 = temp_55;
    if (temp_105)
    {
        temp_132 = texture(g_textures_3_, vec2(temp_0, temp_1)).xyzw;
        temp_56 = temp_132.x;
        temp_57 = temp_132.y;
        temp_19 = temp_132.z;
        temp_20 = temp_132.w;
    }
    if (temp_101)
    {
        temp_133 = texture(g_envmap_texture, vec3(temp_55, temp_54, temp_109)).xyz;
        temp_131 = temp_133.x;
        temp_116 = temp_133.y;
        temp_120 = temp_133.z;
    }
    temp_134 = fma(temp_114, fp_c4.data[14].y, temp_90) + fp_c4.data[15].y;
    temp_135 = fma(temp_115, fp_c4.data[14].z, temp_90) + fp_c4.data[15].z;
    temp_136 = fma(temp_113, fp_c4.data[14].x, temp_90) + fp_c4.data[15].x;
    temp_137 = temp_131;
    temp_138 = temp_116;
    temp_139 = temp_120;
    if (!temp_101)
    {
        temp_137 = 0.0;
    }
    temp_140 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_81, fp_c4.data[34].y), fp_c4.data[36].z, temp_134);
    if (!temp_62)
    {
        temp_140 = temp_134;
    }
    temp_141 = inversesqrt(fma(temp_82, 0.0 - temp_82, 1.00001));
    temp_142 = fma(fma(temp_86, temp_81, fp_c4.data[34].x), fp_c4.data[36].z, temp_136);
    temp_143 = temp_141;
    if (!temp_62)
    {
        temp_142 = temp_136;
    }
    if (!temp_101)
    {
        temp_138 = 0.0;
    }
    if (!temp_101)
    {
        temp_139 = 0.0;
    }
    if (!temp_23)
    {
        temp_69 = temp_142;
    }
    temp_144 = in_attr6.x;
    temp_145 = temp_69;
    if (temp_23)
    {
        temp_143 = 0.0 - temp_69 + temp_142;
    }
    temp_146 = temp_143;
    if (temp_23)
    {
        temp_145 = fma(temp_143, 0.3, temp_69);
    }
    temp_147 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_81, fp_c4.data[34].z), fp_c4.data[36].z, temp_135);
    if (!temp_62)
    {
        temp_147 = temp_135;
    }
    temp_148 = 0.0 - fma(texture(g_textures_4_, vec2(in_attr3.z, in_attr3.w)).w, 0.0 - temp_144, temp_144) + 1.0;
    temp_149 = 0.0 - temp_82 + 1.0;
    if (temp_23)
    {
        temp_146 = 0.0 - temp_52 + temp_147;
    }
    temp_150 = clamp(temp_148 * fma(fp_c5.data[29].w, 2.0, 0.00999999978) * (1.0 / fma(temp_82, temp_141, 1E-06)), 0.0, 1.0);
    temp_151 = temp_150 + fma(temp_51.w * fma(temp_148, 0.5, 0.5), 0.0 - temp_150, temp_51.w * fma(temp_148, 0.5, 0.5));
    temp_152 = temp_149 * temp_149 * temp_149 * temp_149 * temp_149;
    temp_153 = fma(temp_92, 0.95, 0.05); // Shadow improvement #2
    temp_154 = temp_153;
    temp_155 = temp_152;
    if (temp_23)
    {
        temp_154 = 0.0 - temp_45 + temp_140;
    }
    temp_156 = temp_154;
    if (temp_23)
    {
        temp_155 = fma(temp_146, 0.3, temp_52);
    }
    temp_157 = temp_155;
    if (!temp_23)
    {
        temp_157 = temp_147;
    }
    temp_158 = temp_145 * 0.970000029;
    if (!temp_23)
    {
        temp_156 = temp_140;
    }
    temp_159 = temp_156;
    if (temp_23)
    {
        temp_159 = fma(temp_156, 0.3, temp_45);
    }
    temp_160 = temp_157 * 0.779999971;
    temp_161 = temp_159 * 0.839999974;
    temp_162 = fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * fma(temp_82, 0.0 - temp_82, 1) * in_attr7.w;
    temp_163 = fma(temp_152 * temp_153, fp_c5.data[33].x, fp_c5.data[33].y);
    temp_164 = fma(temp_92, 0.5, 0.5) * fp_c4.data[16].w;
    temp_165 = fma(temp_126.x + 0.0 - temp_128, fp_c5.data[31].x, temp_128);
    temp_166 = fma(temp_126.y + 0.0 - temp_129, fp_c5.data[31].x, temp_129);
    temp_167 = fma(temp_126.z + 0.0 - temp_130, fp_c5.data[31].x, temp_130);
    temp_168 = temp_163 * fp_c5.data[32].x;
    temp_169 = temp_163 * fp_c5.data[32].y;
    temp_170 = temp_163 * fp_c5.data[32].z;
    temp_171 = temp_168;
    temp_172 = temp_169;
    temp_173 = temp_170;
    temp_174 = fp_c5.data[32].w;
    if (temp_105)
    {
        temp_171 = temp_168 * temp_56;
    }
    if (temp_105)
    {
        temp_172 = temp_169 * temp_57;
    }
    if (temp_105)
    {
        temp_173 = temp_170 * temp_19;
    }
    if (temp_105)
    {
        temp_174 = temp_20 * fp_c5.data[32].w;
    }
    temp_175 = fma(fma(temp_151, fma(temp_51.x * fp_c5.data[34].x, temp_142, 0.0 - temp_158), temp_158), 0.96, temp_151 * fma(0.0 - temp_165 + fma(temp_121.x + 0.0 - temp_123, fp_c5.data[31].x, temp_123), temp_92, temp_165) * fp_c4.data[16].x * (temp_171 + fp_c5.data[34].w));
    temp_176 = fma(fma(temp_151, fma(temp_51.y * fp_c5.data[34].x, temp_140, 0.0 - temp_161), temp_161), 0.96, temp_151 * fma(0.0 - temp_166 + fma(temp_121.y + 0.0 - temp_124, fp_c5.data[31].x, temp_124), temp_92, temp_166) * fp_c4.data[16].y * (temp_172 + fp_c5.data[34].w));
    temp_177 = fma(temp_164 * temp_137, temp_174, temp_175);
    if (!temp_101)
    {
        temp_177 = temp_175;
    }
    temp_178 = fma(fma(temp_151, fma(temp_51.z * fp_c5.data[34].x, temp_147, 0.0 - temp_160), temp_160), 0.96, temp_151 * fma(0.0 - temp_167 + fma(temp_121.z + 0.0 - temp_125, fp_c5.data[31].x, temp_125), temp_92, temp_167) * fp_c4.data[16].z * (temp_173 + fp_c5.data[34].w));
    
    temp_179 = fma(temp_164 * temp_138, temp_174, temp_176);
    if (!temp_101)
    {
        temp_179 = temp_176;
    }
    temp_180 = fma(temp_162 * fp_c4.data[28].x * temp_92, 0.5, temp_177);
    temp_181 = fma(temp_164 * temp_139, temp_174, temp_178);
    if (!temp_101)
    {
        temp_181 = temp_178;
    }
    temp_182 = fma(temp_162 * fp_c4.data[28].y * temp_92, 0.5, temp_179);
    temp_183 = fma(temp_162 * fp_c4.data[28].z * temp_92, 0.5, temp_181);
    temp_184 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
    temp_185 = in_attr5.w;
    temp_186 = fma(temp_183, 0.1145, fma(temp_182, 0.5866, temp_180 * 0.298900008));
    temp_187 = floatBitsToInt(max(0.0, fma(0.0 - temp_180 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_186, fp_c4.data[31].x), fp_c4.data[32].w, temp_180)));
    temp_188 = floatBitsToInt(max(0.0, fma(0.0 - temp_182 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_186, fp_c4.data[31].y), fp_c4.data[32].w, temp_182)));
    temp_189 = floatBitsToInt(max(0.0, fma(0.0 - temp_183 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_186, fp_c4.data[31].z), fp_c4.data[32].w, temp_183)));
    if (!temp_184)
    {
        temp_187 = floatBitsToInt(fma(0.0 - temp_180 + in_attr7.x, temp_185, temp_180));
    }
    if (!temp_184)
    {
        temp_188 = floatBitsToInt(fma(0.0 - temp_182 + in_attr7.y, temp_185, temp_182));
    }
    if (!temp_184)
    {
        temp_189 = floatBitsToInt(fma(0.0 - temp_183 + in_attr7.z, temp_185, temp_183));
    }
    SV_Target0.x = intBitsToFloat(temp_187);
    SV_Target0.y = intBitsToFloat(temp_188);
    SV_Target0.z = intBitsToFloat(temp_189);
    SV_Target0.w = 1.0;
    return;
}
