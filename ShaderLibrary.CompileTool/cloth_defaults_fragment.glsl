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

layout (binding = 0) uniform sampler2D g_textures_0_;
layout (binding = 4) uniform sampler2D g_textures_4_;
layout (binding = 2) uniform sampler2D g_textures_2_;
layout (binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout (binding = 9) uniform samplerCube g_ibl_textures_0_;
layout (binding = 16) uniform sampler2D g_sss_texture;
layout (binding = 5) uniform samplerCube g_envmap_texture;
layout (binding = 3) uniform sampler2D g_textures_3_;
layout (binding = 10) uniform samplerCube g_ibl_textures_1_;
layout (binding = 11) uniform samplerCube g_ibl_textures_2_;
layout (binding = 12) uniform samplerCube g_ibl_textures_3_;
layout (binding = 13) uniform samplerCube g_ibl_textures_4_;
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
    precise vec4 temp_2;
    bool temp_3;
    precise float temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise vec2 temp_9;
    precise float temp_10;
    precise float temp_11;
    precise float temp_12;
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
    precise float temp_27;
    precise float temp_28;
    bool temp_29;
    precise float temp_30;
    precise float temp_31;
    precise float temp_32;
    bool temp_33;
    precise float temp_34;
    precise float temp_35;
    precise float temp_36;
    bool temp_37;
    precise float temp_38;
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
    precise vec3 temp_76;
    precise float temp_77;
    precise float temp_78;
    precise float temp_79;
    precise vec3 temp_80;
    precise vec3 temp_81;
    precise float temp_82;
    precise float temp_83;
    precise float temp_84;
    precise float temp_85;
    precise vec3 temp_86;
    precise float temp_87;
    precise float temp_88;
    precise float temp_89;
    precise vec4 temp_90;
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
    bool temp_119;
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
    precise vec3 temp_144;
    precise vec3 temp_145;
    precise float temp_146;
    precise float temp_147;
    precise float temp_148;
    precise vec3 temp_149;
    precise vec3 temp_150;
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
    bool temp_162;
    precise float temp_163;
    precise float temp_164;
    precise float temp_165;
    int temp_166;
    int temp_167;
    int temp_168;
    temp_0 = in_attr3.x;
    temp_1 = in_attr3.y;
    temp_2 = texture(g_textures_0_, vec2(temp_0, temp_1)).xyzw;
    temp_3 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 9, 1)) == 1;
    temp_4 = intBitsToFloat(undef);
    temp_5 = temp_2.w;
    temp_6 = temp_0;
    temp_7 = temp_1;
    if (temp_3)
    {
        temp_4 = in_attr3.z;
    }
    temp_8 = intBitsToFloat(undef);
    if (temp_3)
    {
        temp_8 = in_attr3.w;
    }
    if (temp_3)
    {
        temp_5 = texture(g_textures_4_, vec2(temp_4, temp_8)).w;
    }
    if (int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 8, 1)) == 1)
    {
        temp_9 = texture(g_textures_2_, vec2(temp_0, temp_1)).xy;
        temp_10 = in_attr1.x;
        temp_11 = in_attr1.y;
        temp_12 = fma(temp_9.y, 2.0, -1.0);
        temp_13 = temp_12 * 2.0 * temp_12 * temp_12;
        temp_14 = fma(temp_12, 1.5, temp_13);
        temp_15 = fma(fma(temp_9.x, 2.0, -1.0), 1.5, temp_13);
        temp_16 = fma(temp_15, temp_10, temp_14 * in_attr2.x) + in_attr0.x;
        temp_17 = fma(temp_15, temp_11, temp_14 * in_attr2.y) + in_attr0.y;
        temp_18 = fma(temp_15, in_attr1.z, temp_14 * in_attr2.z) + in_attr0.z;
        temp_19 = inversesqrt(fma(temp_18, temp_18, fma(temp_17, temp_17, temp_16 * temp_16)));
        temp_20 = temp_16 * temp_19;
        temp_21 = temp_17 * temp_19;
        temp_22 = temp_18 * temp_19;
        temp_23 = temp_10;
        temp_24 = temp_11;
    }
    else
    {
        temp_25 = in_attr0.x;
        temp_26 = in_attr0.y;
        temp_27 = in_attr0.z;
        temp_28 = inversesqrt(fma(temp_27, temp_27, fma(temp_26, temp_26, temp_25 * temp_25)));
        temp_20 = temp_25 * temp_28;
        temp_21 = temp_26 * temp_28;
        temp_22 = temp_27 * temp_28;
        temp_23 = intBitsToFloat(undef);
        temp_24 = intBitsToFloat(undef);
    }
    temp_29 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_30 = in_attr4.x;
    temp_31 = in_attr4.y;
    temp_32 = in_attr4.z;
    temp_33 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
    temp_34 = intBitsToFloat(undef);
    temp_35 = temp_24;
    temp_36 = temp_23;
    if (temp_29)
    {
        temp_34 = in_attr5.x;
    }
    temp_37 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 4, 1)) != 0;
    temp_38 = intBitsToFloat(undef);
    temp_39 = temp_34;
    if (temp_29)
    {
        temp_38 = in_attr5.y;
    }
    temp_40 = fma(temp_22, fp_c4.data[42].z, fma(temp_21, fp_c4.data[42].y, temp_20 * fp_c4.data[42].x));
    temp_41 = intBitsToFloat(undef);
    if (temp_29)
    {
        temp_41 = in_attr5.z;
    }
    temp_42 = temp_41;
    if (temp_29)
    {
        temp_39 = texture(g_shadow_depth_textures_0_, vec2(temp_34, temp_38)).x;
    }
    temp_43 = inversesqrt(fma(temp_32, temp_32, fma(temp_31, temp_31, temp_30 * temp_30)));
    temp_44 = temp_30 * temp_43;
    temp_45 = temp_31 * temp_43;
    temp_46 = temp_32 * temp_43;
    temp_47 = fma(temp_22, fp_c4.data[43].z, fma(temp_21, fp_c4.data[43].y, temp_20 * fp_c4.data[43].x));
    temp_48 = fma(temp_46, temp_22, fma(temp_45, temp_21, temp_44 * temp_20));
    temp_49 = temp_40 * fma(temp_46, fp_c4.data[42].z, fma(temp_45, fp_c4.data[42].y, temp_44 * fp_c4.data[42].x));
    temp_50 = fma(temp_21, fp_c4.data[44].y, temp_20 * fp_c4.data[44].x);
    temp_51 = fma(temp_48 * -temp_20, 2.0, temp_44);
    temp_52 = fma(temp_48 * -temp_21, 2.0, temp_45);
    temp_53 = fma(temp_48 * -temp_22, 2.0, temp_46);
    temp_54 = fma(temp_22, fp_c4.data[44].z, temp_50);
    temp_55 = temp_51 * -fp_c4.data[43].x;
    temp_56 = fma(temp_52, 0.0 - fp_c4.data[44].y, temp_51 * -fp_c4.data[44].x);
    temp_57 = 1.0 / max(abs(temp_54), max(abs(temp_47), abs(temp_40)));
    temp_58 = fma(temp_53, 0.0 - fp_c4.data[44].z, temp_56);
    temp_59 = fma(temp_53, 0.0 - fp_c4.data[43].z, fma(temp_52, 0.0 - fp_c4.data[43].y, temp_55));
    temp_60 = fma(temp_53, 0.0 - fp_c4.data[42].z, fma(temp_52, 0.0 - fp_c4.data[42].y, temp_51 * -fp_c4.data[42].x));
    temp_61 = temp_40 * temp_57;
    temp_62 = temp_50;
    temp_63 = temp_56;
    temp_64 = temp_49;
    temp_65 = temp_55;
    temp_66 = temp_57;
    temp_67 = temp_61;
    temp_68 = temp_39;
    if (temp_37)
    {
        temp_62 = max(abs(temp_59), abs(temp_60));
    }
    temp_69 = temp_47 * temp_57;
    temp_70 = temp_62;
    temp_71 = temp_69;
    if (temp_37)
    {
        temp_70 = max(abs(temp_58), temp_62);
    }
    if (temp_37)
    {
        temp_63 = 1.0 / temp_70;
    }
    temp_72 = clamp(fma(temp_54, fma(temp_46, fp_c4.data[44].z, fma(temp_45, fp_c4.data[44].y, temp_44 * fp_c4.data[44].x)), fma(temp_47, fma(temp_46, fp_c4.data[43].z, fma(temp_45, fp_c4.data[43].y, temp_44 * fp_c4.data[43].x)), temp_49)), 0.0, 1.0);
    temp_73 = temp_54 * temp_57;
    if (temp_37)
    {
        temp_35 = temp_58 * temp_63;
    }
    temp_74 = temp_35;
    if (temp_37)
    {
        temp_64 = temp_60 * temp_63;
    }
    temp_75 = temp_64;
    if (temp_37)
    {
        temp_36 = temp_59 * temp_63;
    }
    temp_76 = textureLod(g_ibl_textures_0_, vec3(temp_61, temp_69, temp_73), 1.0).xyz;
    temp_77 = temp_76.x;
    temp_78 = temp_76.y;
    temp_79 = temp_76.z;
    temp_80 = textureLod(g_ibl_textures_0_, vec3(temp_61, temp_69, temp_73), 0.0).xyz;
    temp_81 = texture(g_sss_texture, vec2(gl_FragCoord.x / 1.0 * fp_c4.data[54].x, gl_FragCoord.y / 1.0 * fp_c4.data[54].y)).xyz;
    temp_82 = temp_81.x;
    temp_83 = temp_81.y;
    temp_84 = temp_81.z;
    temp_85 = temp_36;
    if (temp_37)
    {
        temp_86 = texture(g_envmap_texture, vec3(temp_64, temp_36, temp_35)).xyz;
        temp_75 = temp_86.x;
        temp_85 = temp_86.y;
        temp_74 = temp_86.z;
    }
    temp_87 = temp_75;
    temp_88 = temp_85;
    temp_89 = temp_74;
    if (temp_33)
    {
        temp_90 = texture(g_textures_3_, vec2(temp_0, temp_1)).xyzw;
        temp_65 = temp_90.x;
        temp_66 = temp_90.y;
        temp_6 = temp_90.z;
        temp_7 = temp_90.w;
    }
    temp_91 = temp_65;
    temp_92 = temp_66;
    temp_93 = temp_6;
    temp_94 = temp_7;
    if (!temp_29)
    {
        temp_42 = 1.0;
    }
    temp_95 = temp_42;
    if (!temp_33)
    {
        temp_91 = fp_c5.data[32].x;
    }
    temp_96 = temp_91;
    if (!temp_33)
    {
        temp_92 = fp_c5.data[32].y;
    }
    temp_97 = temp_92;
    if (!temp_33)
    {
        temp_93 = fp_c5.data[32].z;
    }
    temp_98 = temp_93;
    if (!temp_33)
    {
        temp_94 = fp_c5.data[32].w;
    }
    temp_99 = temp_94;
    if (!temp_37)
    {
        temp_87 = 0.0;
    }
    if (!temp_37)
    {
        temp_88 = 0.0;
    }
    if (!temp_29)
    {
        temp_71 = 1.0;
    }
    temp_100 = temp_71;
    if (!temp_29)
    {
        temp_67 = 1.0;
    }
    temp_101 = temp_67;
    if (temp_29)
    {
        temp_95 = 0.0 - temp_42 + temp_39;
    }
    temp_102 = temp_95;
    if (temp_29)
    {
        temp_68 = temp_20 * fp_c4.data[26].x;
    }
    temp_103 = temp_68;
    if (temp_29)
    {
        temp_102 = temp_95 * fp_c4.data[45].x;
    }
    temp_104 = temp_102;
    if (temp_29)
    {
        temp_103 = fma(temp_21, fp_c4.data[26].y, temp_68);
    }
    temp_105 = temp_103;
    if (temp_29)
    {
        temp_104 = temp_102 * fp_c5.data[30].w * 5.0; // Shadow improvement #1
    }
    temp_106 = temp_104;
    if (temp_29)
    {
        temp_105 = fma(temp_22, fp_c4.data[26].z, temp_103);
    }
    temp_107 = intBitsToFloat(undef);
    temp_108 = temp_105;
    if (temp_29)
    {
        temp_107 = temp_104;
    }
    if (temp_29)
    {
        temp_108 = temp_105 + 1.0;
    }
    temp_109 = temp_108;
    if (temp_29)
    {
        temp_106 = exp2(temp_107);
    }
    temp_110 = temp_106;
    if (temp_29)
    {
        temp_109 = min(temp_108, 1.0);
    }
    temp_111 = temp_109;
    if (temp_29)
    {
        temp_111 = temp_109 * temp_109;
    }
    if (temp_29)
    {
        temp_110 = min(temp_106, 1.0);
    }
    if (temp_29)
    {
        temp_101 = temp_111 * temp_111;
    }
    temp_112 = temp_101;
    if (temp_29)
    {
        temp_112 = min(temp_110, temp_101);
    }
    if (temp_29)
    {
        temp_100 = temp_112;
    }
    if (temp_33)
    {
        temp_96 = temp_91 * fp_c5.data[32].x;
    }
    if (temp_33)
    {
        temp_97 = temp_92 * fp_c5.data[32].y;
    }
    if (temp_33)
    {
        temp_98 = temp_93 * fp_c5.data[32].z;
    }
    if (temp_33)
    {
        temp_99 = temp_94 * fp_c5.data[32].w;
    }
    temp_113 = in_attr6.w;
    temp_114 = 0.0 - temp_72 + 1.0;
    temp_115 = fma(temp_72, 0.0 - temp_72, 1) * fma(temp_72, 0.0 - temp_72, 1) * fma(temp_72, 0.0 - temp_72, 1) * fma(temp_72, 0.0 - temp_72, 1) * in_attr7.w * temp_110;
    temp_116 = clamp(fma(temp_98, -3.0, fma(temp_97, -3.0, temp_96 * -3.0)) + 1.3, 0.0, 1.0);
    temp_117 = fma(temp_115 * fp_c4.data[28].x * 0.75, temp_116, fma(fma(temp_80.x + 0.0 - temp_77, temp_100, temp_77), fp_c4.data[14].x, temp_113) + fp_c4.data[15].x);
    temp_118 = fma(temp_115 * fp_c4.data[28].y * 0.75, temp_116, fma(fma(temp_80.y + 0.0 - temp_78, temp_100, temp_78), fp_c4.data[14].y, temp_113) + fp_c4.data[15].y);
    temp_119 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
    temp_120 = fma(temp_115 * fp_c4.data[28].z * 0.75, temp_116, fma(fma(temp_80.z + 0.0 - temp_79, temp_100, temp_79), fp_c4.data[14].z, temp_113) + fp_c4.data[15].z);
    temp_121 = clamp((fma(fma(temp_22, fp_c4.data[33].z, fma(temp_21, fp_c4.data[33].y, temp_20 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
    temp_122 = fma(temp_121, 0.0 - fp_c4.data[34].y + fp_c4.data[35].y, fp_c4.data[34].y);
    temp_123 = 0.300000012;
    temp_124 = temp_122;
    if (!temp_119)
    {
        temp_123 = temp_120;
    }
    temp_125 = temp_114 * temp_114 * temp_114 * temp_114 * temp_114;
    temp_126 = temp_123;
    if (temp_119)
    {
        temp_126 = fma(fma(temp_121, 0.0 - fp_c4.data[34].z + fp_c4.data[35].z, fp_c4.data[34].z), fp_c4.data[36].z, temp_120);
    }
    temp_127 = temp_125 * fma(temp_112, 0.95, 0.05); // Shadow improvement #2
    temp_128 = fma(temp_122, fp_c4.data[36].z, temp_118);
    if (!temp_119)
    {
        temp_124 = temp_117;
    }
    temp_129 = temp_124;
    if (!temp_119)
    {
        temp_128 = temp_118;
    }
    if (temp_119)
    {
        temp_129 = fma(fma(temp_121, 0.0 - fp_c4.data[34].x + fp_c4.data[35].x, fp_c4.data[34].x), fp_c4.data[36].z, temp_117);
    }
    temp_130 = temp_125 * 0.5 * fma(fma(temp_46, 0.0 - fp_c4.data[26].z, fma(temp_45, 0.0 - fp_c4.data[26].y, temp_44 * -fp_c4.data[26].x)), 0.2, 0.400000006);
    temp_131 = fma(temp_112, 0.5, 0.5) * fp_c4.data[16].w;
    temp_132 = fma(temp_127, fp_c5.data[33].x, fp_c5.data[33].y);
    temp_133 = fma(fma(temp_127 * fp_c5.data[33].x, 10.0, 1.0), temp_99, fp_c5.data[34].w);
    temp_134 = temp_2.x * fp_c5.data[34].x * fma(0.0 - temp_82 + temp_129, fp_c5.data[29].w, temp_82) * 0.959999979;
    temp_135 = temp_2.y * fp_c5.data[34].x * fma(0.0 - temp_83 + temp_128, fp_c5.data[29].w, temp_83) * 0.959999979;
    temp_136 = temp_2.z * fp_c5.data[34].x * fma(0.0 - temp_84 + temp_126, fp_c5.data[29].w, temp_84) * 0.959999979;
    
    temp_137 = temp_134;
    temp_138 = temp_135;
    temp_139 = temp_136;
    if (int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 22, 2)) != 0)
    {
        temp_140 = 1.0 / max(abs(temp_58), max(abs(temp_59), abs(temp_60)));
        temp_141 = temp_58 * temp_140;
        temp_142 = temp_60 * temp_140;
        temp_143 = temp_59 * temp_140;
        temp_144 = texture(g_ibl_textures_1_, vec3(temp_142, temp_143, temp_141)).xyz;
        temp_145 = texture(g_ibl_textures_2_, vec3(temp_142, temp_143, temp_141)).xyz;
        temp_146 = temp_145.x;
        temp_147 = temp_145.y;
        temp_148 = temp_145.z;
        temp_149 = texture(g_ibl_textures_3_, vec3(temp_142, temp_143, temp_141)).xyz;
        temp_150 = texture(g_ibl_textures_4_, vec3(temp_142, temp_143, temp_141)).xyz;
        temp_151 = temp_150.x;
        temp_152 = temp_150.y;
        temp_153 = temp_150.z;
        temp_154 = fma(temp_149.x + 0.0 - temp_151, fp_c5.data[31].x, temp_151);
        temp_155 = fma(temp_149.y + 0.0 - temp_152, fp_c5.data[31].x, temp_152);
        temp_156 = fma(temp_149.z + 0.0 - temp_153, fp_c5.data[31].x, temp_153);
        temp_137 = fma(fma(temp_132, temp_96, fp_c5.data[34].w), fma(0.0 - temp_154 + fma(temp_144.x + 0.0 - temp_146, fp_c5.data[31].x, temp_146), temp_112, temp_154) * fp_c4.data[16].x, temp_134);
        temp_138 = fma(fma(temp_132, temp_97, fp_c5.data[34].w), fma(0.0 - temp_155 + fma(temp_144.y + 0.0 - temp_147, fp_c5.data[31].x, temp_147), temp_112, temp_155) * fp_c4.data[16].y, temp_135);
        temp_139 = fma(fma(temp_132, temp_98, fp_c5.data[34].w), fma(0.0 - temp_156 + fma(temp_144.z + 0.0 - temp_148, fp_c5.data[31].x, temp_148), temp_112, temp_156) * fp_c4.data[16].z, temp_136);
    }
    if (!temp_37)
    {
        temp_89 = 0.0;
    }
    temp_157 = fma(temp_133, temp_131 * temp_87, temp_137);
    if (!temp_37)
    {
        temp_157 = temp_137;
    }
    temp_158 = fma(temp_133, temp_131 * temp_88, temp_138);
    if (!temp_37)
    {
        temp_158 = temp_138;
    }
    temp_159 = fma(temp_130, temp_116, temp_157);
    temp_160 = fma(temp_133, temp_131 * temp_89, temp_139);
    if (!temp_37)
    {
        temp_160 = temp_139;
    }
    temp_161 = fma(temp_130, temp_116, temp_158);
    temp_162 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
    temp_163 = fma(temp_130, temp_116, temp_160);
    temp_164 = in_attr5.w;
    temp_165 = fma(temp_163, 0.1145, fma(temp_161, 0.5866, temp_159 * 0.298900008));
    temp_166 = floatBitsToInt(max(0.0, fma(0.0 - temp_159 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_165, fp_c4.data[31].x), fp_c4.data[32].w, temp_159)));
    temp_167 = floatBitsToInt(max(0.0, fma(0.0 - temp_161 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_165, fp_c4.data[31].y), fp_c4.data[32].w, temp_161)));
    if (!temp_162)
    {
        temp_166 = floatBitsToInt(fma(0.0 - temp_159 + in_attr7.x, temp_164, temp_159));
    }
    temp_168 = floatBitsToInt(max(0.0, fma(0.0 - temp_163 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_165, fp_c4.data[31].z), fp_c4.data[32].w, temp_163)));
    if (!temp_162)
    {
        temp_167 = floatBitsToInt(fma(0.0 - temp_161 + in_attr7.y, temp_164, temp_161));
    }
    if (!temp_162)
    {
        temp_168 = floatBitsToInt(fma(0.0 - temp_163 + in_attr7.z, temp_164, temp_163));
    }
    SV_Target0.x = intBitsToFloat(temp_166);
    SV_Target0.y = intBitsToFloat(temp_167);
    SV_Target0.z = intBitsToFloat(temp_168);
    SV_Target0.w = max(temp_5, fp_c5.data[39].w);
    // return; Yuzu crash;
}
