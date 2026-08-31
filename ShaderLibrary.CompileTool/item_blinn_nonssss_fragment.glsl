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

layout (binding = 2, std140) uniform _Batch
{
    precise vec4 data[4096];
} fp_c5;

layout (binding = 1, std140) uniform _Scene
{
    precise vec4 data[4096];
} fp_c4;

layout (binding = 4, std140) uniform _NPRParam
{
    precise vec4 data[4096];
} fp_c7;

layout (binding = 0) uniform sampler2D g_textures_0_;
layout (binding = 2) uniform sampler2D g_textures_2_;
layout (binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout (binding = 5) uniform samplerCube g_envmap_texture;
layout (binding = 9) uniform samplerCube g_ibl_textures_0_;
layout (binding = 10) uniform samplerCube g_ibl_textures_1_;
layout (binding = 11) uniform samplerCube g_ibl_textures_2_;
layout (binding = 3) uniform sampler2D g_textures_3_;
layout (location = 0) in vec4 in_attr0;
layout (location = 1) in vec4 in_attr1;
layout (location = 2) in vec4 in_attr2;
layout (location = 3) in vec4 in_attr3;
layout (location = 4) in vec4 in_attr4;
layout (location = 5) in vec4 in_attr5;
layout (location = 6) in vec4 in_attr6;
layout (location = 7) in vec4 in_attr7;

layout (location = 0) out vec4 SV_Target0;
layout (location = 1) out vec4 SV_Target1;

void main()
{
    uint temp_0;
    uint temp_1;
    bool temp_2;
    bool temp_3;
    precise float temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    precise float temp_11;
    precise float temp_12;
    precise float temp_13;
    precise float temp_14;
    precise float temp_15;
    precise float temp_16;
    precise float temp_17;
    precise vec4 temp_18;
    precise vec2 temp_19;
    uint temp_20;
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
    precise float temp_44;
    precise float temp_45;
    precise float temp_46;
    precise float temp_47;
    precise float temp_48;
    precise float temp_49;
    uint temp_50;
    bool temp_51;
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
    precise vec3 temp_74;
    precise float temp_75;
    precise float temp_76;
    precise float temp_77;
    precise float temp_78;
    int temp_79;
    bool temp_80;
    bool temp_81;
    precise float temp_82;
    precise float temp_83;
    precise float temp_84;
    precise float temp_85;
    int temp_86;
    bool temp_87;
    precise float temp_88;
    precise float temp_89;
    int temp_90;
    bool temp_91;
    precise float temp_92;
    bool temp_93;
    precise float temp_94;
    int temp_95;
    int temp_96;
    bool temp_97;
    precise float temp_98;
    bool temp_99;
    precise float temp_100;
    int temp_101;
    int temp_102;
    precise float temp_103;
    precise float temp_104;
    precise float temp_105;
    int temp_106;
    int temp_107;
    int temp_108;
    precise float temp_109;
    precise float temp_110;
    precise float temp_111;
    int temp_112;
    int temp_113;
    precise float temp_114;
    precise float temp_115;
    int temp_116;
    precise float temp_117;
    int temp_118;
    precise float temp_119;
    precise float temp_120;
    int temp_121;
    int temp_122;
    precise float temp_123;
    precise float temp_124;
    int temp_125;
    int temp_126;
    precise float temp_127;
    precise float temp_128;
    precise float temp_129;
    int temp_130;
    precise float temp_131;
    precise float temp_132;
    int temp_133;
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
    bool temp_154;
    precise float temp_155;
    precise float temp_156;
    precise float temp_157;
    precise float temp_158;
    precise float temp_159;
    precise float temp_160;
    precise vec3 temp_161;
    precise float temp_162;
    precise float temp_163;
    precise float temp_164;
    precise vec3 temp_165;
    precise float temp_166;
    precise float temp_167;
    precise float temp_168;
    precise float temp_169;
    precise float temp_170;
    precise float temp_171;
    bool temp_172;
    bool temp_173;
    precise float temp_174;
    precise float temp_175;
    precise float temp_176;
    precise float temp_177;
    bool temp_178;
    precise float temp_179;
    precise float temp_180;
    precise float temp_181;
    precise float temp_182;
    precise float temp_183;
    precise float temp_184;
    precise float temp_185;
    precise float temp_186;
    precise float temp_187;
    bool temp_188;
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
    precise float temp_199;
    precise float temp_200;
    precise float temp_201;
    precise float temp_202;
    precise float temp_203;
    precise float temp_204;
    precise float temp_205;
    precise float temp_206;
    precise float temp_207;
    precise float temp_208;
    precise float temp_209;
    precise float temp_210;
    precise float temp_211;
    precise float temp_212;
    precise float temp_213;
    precise float temp_214;
    precise float temp_215;
    precise float temp_216;
    precise float temp_217;
    bool temp_218;
    precise float temp_219;
    precise float temp_220;
    precise float temp_221;
    precise float temp_222;
    precise float temp_223;
    precise vec3 temp_224;
    precise vec3 temp_225;
    precise float temp_226;
    precise float temp_227;
    precise float temp_228;
    precise float temp_229;
    precise vec4 temp_230;
    precise float temp_231;
    precise float temp_232;
    precise float temp_233;
    precise float temp_234;
    precise float temp_235;
    precise float temp_236;
    precise float temp_237;
    precise float temp_238;
    precise float temp_239;
    precise float temp_240;
    precise float temp_241;
    int temp_242;
    int temp_243;
    int temp_244;
    temp_0 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 2, 2);
    temp_1 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 8, 1);
    temp_2 = int(temp_0) == 0;
    temp_3 = int(temp_1) == 1;
    temp_4 = intBitsToFloat(undef);
    temp_5 = uintBitsToFloat(temp_0);
    temp_6 = uintBitsToFloat(temp_1);
    if (temp_2)
    {
        temp_4 = fp_c5.data[28].w;
    }
    temp_7 = intBitsToFloat(undef);
    temp_8 = temp_4;
    if (temp_2)
    {
        temp_7 = fp_c5.data[28].x;
    }
    temp_9 = intBitsToFloat(undef);
    temp_10 = temp_7;
    if (temp_2)
    {
        temp_9 = fp_c5.data[28].y;
    }
    temp_11 = intBitsToFloat(undef);
    temp_12 = temp_9;
    if (temp_2)
    {
        temp_11 = fp_c5.data[28].z;
    }
    temp_13 = intBitsToFloat(undef);
    temp_14 = temp_11;
    if (!temp_2)
    {
        temp_13 = in_attr3.x;
    }
    temp_15 = intBitsToFloat(undef);
    if (!temp_2)
    {
        temp_15 = in_attr3.y;
    }
    if (temp_3)
    {
        temp_5 = in_attr3.y;
    }
    temp_16 = temp_5;
    if (temp_3)
    {
        temp_6 = in_attr3.x;
    }
    temp_17 = temp_6;
    if (!temp_2)
    {
        temp_18 = texture(g_textures_0_, vec2(temp_13, temp_15)).xyzw;
        temp_8 = temp_18.w;
        temp_10 = temp_18.x;
        temp_12 = temp_18.y;
        temp_14 = temp_18.z;
    }
    if (temp_3)
    {
        temp_19 = texture(g_textures_2_, vec2(temp_6, temp_5)).xy;
        temp_16 = temp_19.y;
        temp_17 = temp_19.x;
    }
    temp_20 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1);
    if (temp_3)
    {
        temp_21 = fma(temp_16, 2.0, -1.0);
        temp_22 = temp_21 * 2.0 * temp_21 * temp_21;
        temp_23 = fma(temp_21, 1.5, temp_22);
        temp_24 = in_attr0.x;
        temp_25 = fma(fma(temp_17, 2.0, -1.0), 1.5, temp_22);
        temp_26 = in_attr0.y;
        temp_27 = in_attr0.z;
        temp_28 = fma(temp_25, in_attr1.x, temp_23 * in_attr2.x) + temp_24;
        temp_29 = fma(temp_25, in_attr1.y, temp_23 * in_attr2.y) + temp_26;
        temp_30 = fma(temp_25, in_attr1.z, temp_23 * in_attr2.z) + temp_27;
        temp_31 = inversesqrt(fma(temp_30, temp_30, fma(temp_29, temp_29, temp_28 * temp_28)));
        temp_32 = temp_24;
        temp_33 = temp_26;
        temp_34 = temp_28 * temp_31;
        temp_35 = temp_29 * temp_31;
        temp_36 = temp_30 * temp_31;
        temp_37 = temp_27;
    }
    else
    {
        temp_38 = in_attr0.x;
        temp_39 = in_attr0.y;
        temp_40 = in_attr0.z;
        temp_41 = inversesqrt(fma(temp_40, temp_40, fma(temp_39, temp_39, temp_38 * temp_38)));
        temp_32 = temp_38;
        temp_33 = temp_39;
        temp_34 = temp_38 * temp_41;
        temp_35 = temp_39 * temp_41;
        temp_36 = temp_40 * temp_41;
        temp_37 = temp_40;
    }
    temp_42 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_43 = in_attr4.x;
    temp_44 = in_attr4.y;
    temp_45 = in_attr4.z;
    temp_46 = inversesqrt(fma(temp_45, temp_45, fma(temp_44, temp_44, temp_43 * temp_43)));
    temp_47 = temp_43 * temp_46;
    temp_48 = temp_44 * temp_46;
    temp_49 = temp_45 * temp_46;
    temp_50 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1);
    temp_51 = int(temp_50) != 0;
    temp_52 = fma(temp_49, temp_36, fma(temp_48, temp_35, temp_47 * temp_34));
    temp_53 = fma(temp_52 * -temp_34, 2.0, temp_47);
    temp_54 = fma(temp_52 * -temp_35, 2.0, temp_48);
    temp_55 = fma(temp_52 * -temp_36, 2.0, temp_49);
    temp_56 = fma(temp_54, 0.0 - fp_c4.data[42].y, temp_53 * -fp_c4.data[42].x);
    temp_57 = fma(temp_54, 0.0 - fp_c4.data[44].y, temp_53 * -fp_c4.data[44].x);
    temp_58 = temp_54;
    temp_59 = temp_56;
    temp_60 = uintBitsToFloat(temp_50);
    temp_61 = temp_57;
    temp_62 = temp_53;
    temp_63 = temp_55;
    if (temp_42)
    {
        temp_58 = in_attr5.x;
    }
    temp_64 = fma(temp_55, 0.0 - fp_c4.data[42].z, temp_56);
    temp_65 = temp_58;
    if (temp_42)
    {
        temp_59 = in_attr5.y;
    }
    temp_66 = fma(temp_55, 0.0 - fp_c4.data[43].z, fma(temp_54, 0.0 - fp_c4.data[43].y, temp_53 * -fp_c4.data[43].x));
    temp_67 = fma(temp_55, 0.0 - fp_c4.data[44].z, temp_57);
    if (temp_51)
    {
        temp_60 = max(abs(temp_64), abs(temp_66));
    }
    temp_68 = temp_60;
    if (temp_51)
    {
        temp_68 = max(abs(temp_67), temp_60);
    }
    if (temp_51)
    {
        temp_61 = 1.0 / temp_68;
    }
    temp_69 = temp_61;
    if (temp_51)
    {
        temp_62 = temp_67 * temp_61;
    }
    if (temp_42)
    {
        temp_65 = texture(g_shadow_depth_textures_0_, vec2(temp_58, temp_59)).x;
    }
    temp_70 = temp_65;
    if (temp_51)
    {
        temp_63 = temp_64 * temp_61;
    }
    temp_71 = temp_63;
    if (temp_51)
    {
        temp_69 = temp_66 * temp_61;
    }
    temp_72 = temp_69;
    temp_73 = intBitsToFloat(undef);
    if (temp_51)
    {
        temp_74 = texture(g_envmap_texture, vec3(temp_63, temp_69, temp_62)).xyz;
        temp_72 = temp_74.y;
        temp_71 = temp_74.x;
        temp_73 = temp_74.z;
    }
    temp_75 = inversesqrt(fma(temp_37, temp_37, fma(temp_33, temp_33, temp_32 * temp_32)));
    temp_76 = temp_73;
    temp_77 = temp_71;
    temp_78 = temp_72;
    temp_79 = floatBitsToInt(temp_75);
    if (!temp_51)
    {
        temp_76 = 0.0;
    }
    temp_80 = int(temp_20) == 1;
    if (!temp_51)
    {
        temp_77 = 0.0;
    }
    if (!temp_51)
    {
        temp_78 = 0.0;
    }
    temp_81 = fp_c5.data[30].w < 0.15;
    temp_82 = temp_32 * temp_75;
    temp_83 = temp_33 * temp_75;
    temp_84 = temp_37 * temp_75;
    temp_85 = fp_c4.data[31].z + 0.0 - fp_c4.data[32].z;
    temp_86 = 1 & floatBitsToInt(fp_c3.data[0].w);
    temp_87 = fp_c4.data[32].w >= 1.0;
    temp_88 = fma(temp_85, temp_85, fma(fp_c4.data[31].y + 0.0 - fp_c4.data[32].y, fp_c4.data[31].y + 0.0 - fp_c4.data[32].y, (fp_c4.data[31].x + 0.0 - fp_c4.data[32].x) * (fp_c4.data[31].x + 0.0 - fp_c4.data[32].x)));
    temp_89 = temp_85;
    temp_90 = temp_86;
    if (temp_81)
    {
        temp_89 = 100.0;
    }
    temp_91 = (1 & floatBitsToInt(fp_c3.data[0].z)) == 1;
    temp_92 = temp_82 * fp_c4.data[59].x;
    temp_93 = (0 - (fp_c4.data[32].w >= 1.0 ? -1 : 0) & (temp_88 != 0.0 || isnan(temp_88) || isnan(0.0) ? 0 : floatBitsToInt(1E-45)) & 0 - (int(temp_20) == 1 ? -1 : 0)) != 0;
    temp_94 = temp_89;
    temp_95 = floatBitsToInt(temp_92);
    if (!temp_81)
    {
        temp_94 = fma(temp_84, fp_c4.data[58].z, fma(temp_83, fp_c4.data[58].y, temp_82 * fp_c4.data[58].x)) + 2.0;
    }
    temp_96 = temp_88 == 0.0 && temp_87 ? 0x3F800000 : 0;
    temp_97 = temp_88 == 0.0 && temp_87;
    temp_98 = fma(temp_84, fp_c4.data[59].z, fma(temp_83, fp_c4.data[59].y, temp_92));
    temp_99 = temp_86 != 0;
    temp_100 = intBitsToFloat(temp_96);
    temp_101 = floatBitsToInt(temp_98);
    if (temp_80)
    {
        temp_95 = temp_96;
    }
    temp_102 = temp_95;
    if (temp_42)
    {
        temp_100 = in_attr5.z;
    }
    temp_103 = temp_34 * fp_c4.data[43].x;
    temp_104 = int(floatBitsToUint(fp_c3.data[0].y) >> 31) == 1 ? 1.0 : 0.0;
    temp_105 = fma(temp_49, fp_c4.data[43].z, fma(temp_48, fp_c4.data[43].y, temp_47 * fp_c4.data[43].x));
    temp_106 = floatBitsToInt(temp_103);
    temp_107 = floatBitsToInt(temp_105);
    if (!temp_80)
    {
        temp_102 = 0;
    }
    temp_108 = temp_102;
    if (!temp_99)
    {
        temp_79 = 0x3C23D70A;
    }
    temp_109 = (temp_98 + 2.0) * temp_104;
    temp_110 = temp_104 * temp_94;
    temp_111 = fma(temp_35, fp_c4.data[43].y, temp_103);
    temp_112 = temp_79;
    temp_113 = floatBitsToInt(temp_111);
    temp_114 = temp_109;
    temp_115 = temp_110;
    if (temp_99)
    {
        temp_101 = 0x3F800000;
    }
    temp_116 = temp_101;
    if (!temp_99)
    {
        temp_116 = temp_79;
    }
    temp_117 = intBitsToFloat(temp_116);
    if (temp_99)
    {
        temp_112 = temp_102;
    }
    temp_118 = temp_112;
    if (!temp_97)
    {
        temp_106 = floatBitsToInt(temp_110);
    }
    temp_119 = fma(temp_36, fp_c4.data[42].z, fma(temp_35, fp_c4.data[42].y, temp_34 * fp_c4.data[42].x));
    temp_120 = fma(temp_36, fp_c4.data[43].z, temp_111);
    temp_121 = temp_106;
    if (!temp_93)
    {
        temp_113 = temp_116;
    }
    temp_122 = temp_113;
    if (temp_42)
    {
        temp_117 = temp_34 * fp_c4.data[26].x;
    }
    temp_123 = temp_117;
    if (temp_93)
    {
        temp_122 = temp_102;
    }
    temp_124 = fma(temp_36, fp_c4.data[44].z, fma(temp_35, fp_c4.data[44].y, temp_34 * fp_c4.data[44].x));
    if (!temp_80)
    {
        temp_108 = floatBitsToInt(temp_110);
    }
    temp_125 = temp_108;
    if (!temp_97)
    {
        temp_118 = floatBitsToInt(temp_109);
    }
    temp_126 = temp_118;
    if (temp_42)
    {
        temp_123 = fma(temp_35, fp_c4.data[26].y, temp_117);
    }
    temp_127 = temp_123;
    if (temp_97)
    {
        temp_121 = 0x42C80000;
    }
    temp_128 = fma(temp_120, temp_105, temp_119 * fma(temp_49, fp_c4.data[42].z, fma(temp_48, fp_c4.data[42].y, temp_47 * fp_c4.data[42].x)));
    temp_129 = temp_128;
    if (!temp_80)
    {
        temp_107 = floatBitsToInt(temp_109);
    }
    temp_130 = temp_107;
    if (!temp_42)
    {
        temp_114 = 1.0;
    }
    temp_131 = temp_114;
    if (temp_97)
    {
        temp_126 = 0;
    }
    if (temp_42)
    {
        temp_127 = fma(temp_36, fp_c4.data[26].z, temp_123);
    }
    temp_132 = temp_127;
    if (temp_80)
    {
        temp_125 = temp_121;
    }
    if (!temp_93)
    {
        temp_90 = temp_86 != 0 ? 0x3F800000 : 0;
    }
    temp_133 = temp_90;
    if (temp_80)
    {
        temp_130 = temp_126;
    }
    if (temp_42)
    {
        temp_132 = temp_127 + 1.0;
    }
    temp_134 = 0.0 - clamp(fma(temp_124, fma(temp_49, fp_c4.data[44].z, fma(temp_48, fp_c4.data[44].y, temp_47 * fp_c4.data[44].x)), temp_128), 0.0, 1.0) + 1.0;
    temp_135 = temp_132;
    if (temp_93)
    {
        temp_133 = 0;
    }
    if (!temp_42)
    {
        temp_115 = 1.0;
    }
    temp_136 = temp_115;
    if (temp_42)
    {
        temp_135 = min(temp_132, 1.0);
    }
    temp_137 = temp_135;
    if (temp_42)
    {
        temp_137 = temp_135 * temp_135;
    }
    if (temp_42)
    {
        temp_136 = temp_137 * temp_137;
    }
    temp_138 = temp_136;
    if (temp_42)
    {
        temp_70 = 0.0 - temp_100 + temp_65;
    }
    temp_139 = temp_70;
    if (temp_42)
    {
        temp_139 = temp_70 * fp_c4.data[45].x;
    }
    temp_140 = temp_139;
    if (temp_42)
    {
        temp_140 = temp_139 * fp_c5.data[30].w * 3.0; // Shadow improvement #1
    }
    temp_141 = temp_140;
    if (temp_42)
    {
        temp_129 = temp_140;
    }
    if (temp_42)
    {
        temp_141 = exp2(temp_129);
    }
    temp_142 = temp_141;
    if (temp_42)
    {
        temp_142 = min(temp_141, 1.0);
    }
    if (temp_42)
    {
        temp_138 = min(temp_142, temp_136);
    }
    if (temp_42)
    {
        temp_131 = temp_138;
    } 
    temp_143 = temp_134 * temp_134 * temp_134 * temp_134 * temp_134 * fma(temp_131, 0.95, 0.05); // Shadow improvement #2
    temp_144 = fma(temp_143, fp_c5.data[33].x, fp_c5.data[33].y);
    temp_145 = temp_144 * fp_c5.data[32].x;
    temp_146 = temp_144 * fp_c5.data[32].y;
    temp_147 = temp_144 * fp_c5.data[32].z;
    temp_148 = fma(temp_143 * fp_c5.data[33].x, 10.0, 1.0) * fp_c5.data[32].w;
    temp_149 = temp_147;
    temp_150 = temp_145;
    temp_151 = temp_146;
    temp_152 = temp_148;
    temp_153 = temp_148;
    if (temp_91)
    {
        temp_154 = int(bitfieldExtract(floatBitsToUint(fp_c5.data[50].x), 15, 1)) != 0;
        temp_155 = intBitsToFloat(undef);
        if (temp_154)
        {
            temp_155 = fp_c7.data[5].z;
        }
        temp_156 = temp_155;
        if (!temp_154)
        {
            temp_156 = fp_c7.data[5].w;
        }
        if (temp_156 > 0.0)
        {
            temp_157 = 1.0 / max(abs(temp_124), max(abs(temp_119), abs(temp_120)));
            temp_158 = temp_124 * temp_157;
            temp_159 = temp_119 * temp_157;
            temp_160 = temp_120 * temp_157;
            temp_161 = textureLod(g_ibl_textures_0_, vec3(temp_159, temp_160, temp_158), 1.0).xyz;
            temp_162 = temp_161.x;
            temp_163 = temp_161.y;
            temp_164 = temp_161.z;
            temp_165 = textureLod(g_ibl_textures_0_, vec3(temp_159, temp_160, temp_158), 0.0).xyz;
            temp_166 = fma(temp_165.x + 0.0 - temp_162, temp_138, temp_162);
            temp_167 = fma(temp_165.y + 0.0 - temp_163, temp_138, temp_163);
            temp_168 = fma(temp_165.z + 0.0 - temp_164, temp_138, temp_164);
            temp_169 = sqrt(fma(temp_168, temp_168, fma(temp_167, temp_167, temp_166 * temp_166)));
            temp_170 = 1.0 / fp_c7.data[7].z * temp_169;
            temp_171 = temp_170 + 0.0 - fp_c7.data[7].w;
            temp_172 = temp_170 > 1.0;
            temp_173 = temp_170 < fp_c7.data[7].w;
            temp_174 = temp_171;
            temp_175 = temp_169;
            if (temp_172)
            {
                temp_174 = 1.0;
            }
            temp_176 = temp_174;
            if (temp_173)
            {
                temp_175 = fp_c7.data[7].y;
            }
            temp_177 = temp_175;
            if (!temp_172)
            {
                temp_176 = fma(1.0 + 0.0 - fp_c7.data[7].y, temp_171 * (1.0 / (1.0 + 0.0 - fp_c7.data[7].w)), fp_c7.data[7].y);
            }
            temp_178 = 0.0 < fp_c7.data[6].w;
            if (!temp_173)
            {
                temp_177 = temp_176;
            }
            temp_179 = fma(temp_177, fp_c7.data[7].x, 0.0 - temp_168);
            temp_180 = temp_179;
            temp_181 = fma(fma(temp_177, fp_c7.data[7].x, 0.0 - temp_167), fp_c7.data[6].w, temp_167);
            temp_182 = fma(temp_179, fp_c7.data[6].w, temp_168);
            if (!temp_178)
            {
                temp_180 = temp_166;
            }
            temp_183 = temp_180;
            if (!temp_178)
            {
                temp_181 = temp_167;
            }
            if (!temp_178)
            {
                temp_182 = temp_168;
            }
            if (temp_178)
            {
                temp_183 = fma(fma(temp_177, fp_c7.data[7].x, 0.0 - temp_166), fp_c7.data[6].w, temp_166);
            }
            temp_184 = fma(temp_181, temp_156, 0.0 - temp_156) + 1.0;
            temp_185 = fma(temp_183, temp_156, 0.0 - temp_156) + 1.0;
            temp_186 = fma(temp_182, temp_156, 0.0 - temp_156) + 1.0;
        }
        else
        {
            temp_184 = 1.0;
            temp_185 = 1.0;
            temp_186 = 1.0;
        }
    }

    // MM+ based ibl shading logic
    else {
        vec3 fb_norm = vec3(temp_159, temp_160, temp_158);
        vec3 fb_lod0 = textureLod(g_ibl_textures_0_, fb_norm, 0.0).xyz;
        vec3 fb_lod1 = textureLod(g_ibl_textures_0_, fb_norm, 1.0).xyz;
        vec3 fb_diff = mix(fb_lod1, fb_lod0, temp_138);
        temp_185 = fb_diff.x;
        temp_184 = fb_diff.y;
        temp_186 = fb_diff.z;
    }

    temp_187 = in_attr6.w;
    temp_188 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
    temp_189 = fma(temp_184 * fp_c4.data[14].y, fp_c7.data[1].w, temp_187);
    temp_190 = fma(temp_185 * fp_c4.data[14].x, fp_c7.data[1].w, temp_187);
    temp_191 = fma(temp_186 * fp_c4.data[14].z, fp_c7.data[1].w, temp_187);
    if (!temp_91)
    {
        temp_189 = fma(temp_184, fp_c4.data[14].y, temp_187);
    }
    if (!temp_91)
    {
        temp_190 = fma(temp_185, fp_c4.data[14].x, temp_187);
    }
    temp_192 = clamp((fma(fma(temp_36, fp_c4.data[33].z, fma(temp_35, fp_c4.data[33].y, temp_34 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
    if (!temp_91)
    {
        temp_191 = fma(temp_186, fp_c4.data[14].z, temp_187);
    }
    temp_193 = temp_189 + fp_c4.data[15].y;
    temp_194 = temp_190 + fp_c4.data[15].x;
    temp_195 = temp_191 + fp_c4.data[15].z;
    temp_196 = temp_193 * fp_c7.data[1].y;
    if (!temp_91)
    {
        temp_196 = temp_193;
    }
    temp_197 = temp_194 * fp_c7.data[1].y;
    if (!temp_91)
    {
        temp_197 = temp_194;
    }
    temp_198 = temp_195 * fp_c7.data[1].y;
    if (!temp_91)
    {
        temp_198 = temp_195;
    }
    temp_199 = fma(temp_192, 0.0 - fp_c4.data[34].y + fp_c4.data[35].y, fp_c4.data[34].y);
    temp_200 = fma(temp_192, 0.0 - fp_c4.data[34].z + fp_c4.data[35].z, fp_c4.data[34].z);
    temp_201 = temp_197 + fp_c5.data[30].x;
    temp_202 = temp_196 + fp_c5.data[30].y;
    temp_203 = temp_198 + fp_c5.data[30].z;
    temp_204 = fma(fma(temp_192, 0.0 - fp_c4.data[34].x + fp_c4.data[35].x, fp_c4.data[34].x), fp_c4.data[36].z, temp_201);
    temp_205 = fma(temp_199, fp_c4.data[36].z, temp_202);
    temp_206 = fma(temp_200, fp_c4.data[36].z, temp_203);
    temp_207 = temp_203;
    temp_208 = temp_199;
    temp_209 = temp_200;
    if (!temp_188)
    {
        temp_204 = temp_201;
    }
    if (!temp_188)
    {
        temp_205 = temp_202;
    }
    if (!temp_188)
    {
        temp_206 = temp_203;
    }
    temp_210 = fma(temp_131, 0.5, 0.5) * fp_c4.data[16].w;
    temp_211 = temp_204 * temp_10 * 0.959999979;
    temp_212 = temp_205 * temp_12 * 0.959999979;
    temp_213 = temp_206 * temp_14 * 0.959999979;

    temp_214 = temp_211;
    temp_215 = temp_212;
    temp_216 = temp_213;
    if (int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 22, 2)) != 0)
    {
        temp_217 = 1.0 / max(abs(temp_67), max(abs(temp_64), abs(temp_66)));
        temp_218 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
        temp_219 = temp_67 * temp_217;
        temp_220 = temp_217;
        if (temp_218)
        {
            temp_207 = in_attr3.x;
        }
        temp_221 = temp_64 * temp_217;
        temp_222 = temp_66 * temp_217;
        temp_223 = temp_207;
        if (temp_218)
        {
            temp_220 = in_attr3.y;
        }
        temp_224 = texture(g_ibl_textures_1_, vec3(temp_221, temp_222, temp_219)).xyz;
        temp_225 = texture(g_ibl_textures_2_, vec3(temp_221, temp_222, temp_219)).xyz;
        temp_226 = temp_225.x;
        temp_227 = temp_225.y;
        temp_228 = temp_225.z;
        temp_229 = temp_220;
        if (temp_218)
        {
            temp_230 = texture(g_textures_3_, vec2(temp_207, temp_220)).xyzw;
            temp_223 = temp_230.z;
            temp_208 = temp_230.x;
            temp_209 = temp_230.y;
            temp_229 = temp_230.w;
        }
        temp_231 = fma(temp_224.x + 0.0 - temp_226, fp_c5.data[31].x, temp_226);
        temp_232 = fma(temp_224.y + 0.0 - temp_227, fp_c5.data[31].x, temp_227);
        temp_233 = fma(temp_224.z + 0.0 - temp_228, fp_c5.data[31].x, temp_228);
        temp_234 = min(temp_231, 3.0);
        temp_235 = min(temp_232, 3.0);
        temp_236 = min(temp_233, 3.0);
        if (temp_218)
        {
            temp_149 = temp_223 * temp_147;
        }
        if (temp_218)
        {
            temp_150 = temp_208 * temp_145;
        }
        if (temp_218)
        {
            temp_151 = temp_209 * temp_146;
        }
        if (temp_218)
        {
            temp_152 = temp_229 * temp_148;
        }
        temp_153 = temp_152;
        temp_214 = fma(fma(temp_231 + 0.0 - temp_234, temp_131, temp_234) * fp_c4.data[16].x, temp_150, temp_211);
        temp_215 = fma(fma(temp_232 + 0.0 - temp_235, temp_131, temp_235) * fp_c4.data[16].y, temp_151, temp_212);
        temp_216 = fma(fma(temp_233 + 0.0 - temp_236, temp_131, temp_236) * fp_c4.data[16].z, temp_149, temp_213);
    }
    temp_237 = fma(temp_210 * temp_77, temp_153, temp_214);
    if (!temp_51)
    {
        temp_237 = temp_214;
    }
    temp_238 = fma(temp_210 * temp_78, temp_153, temp_215);
    if (!temp_51)
    {
        temp_238 = temp_215;
    }
    temp_239 = in_attr5.w;
    temp_240 = fma(temp_210 * temp_76, temp_153, temp_216);
    if (!temp_51)
    {
        temp_240 = temp_216;
    }
    temp_241 = fma(temp_240, 0.1145, fma(temp_238, 0.5866, temp_237 * 0.298900008));
    temp_242 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_241, fp_c4.data[31].x) + 0.0 - temp_237, fp_c4.data[32].w, temp_237)));
    temp_243 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_241, fp_c4.data[31].y) + 0.0 - temp_238, fp_c4.data[32].w, temp_238)));
    if (!temp_80)
    {
        temp_242 = floatBitsToInt(fma(in_attr7.x + 0.0 - temp_237, temp_239, temp_237));
    }
    temp_244 = floatBitsToInt(max(0.0, fma(fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_241, fp_c4.data[31].z) + 0.0 - temp_240, fp_c4.data[32].w, temp_240)));
    if (!temp_80)
    {
        temp_243 = floatBitsToInt(fma(in_attr7.y + 0.0 - temp_238, temp_239, temp_238));
    }
    if (!temp_80)
    {
        temp_244 = floatBitsToInt(fma(in_attr7.z + 0.0 - temp_240, temp_239, temp_240));
    }
    SV_Target0.x = intBitsToFloat(temp_242);
    SV_Target0.y = intBitsToFloat(temp_243);
    SV_Target0.z = intBitsToFloat(temp_244);
    SV_Target0.w = max(temp_8, fp_c5.data[39].w);
    SV_Target1.x = intBitsToFloat(temp_133);
    SV_Target1.y = intBitsToFloat(temp_125);
    SV_Target1.z = intBitsToFloat(temp_130);
    SV_Target1.w = intBitsToFloat(temp_122);
    // return; Yuzu crash;
}
