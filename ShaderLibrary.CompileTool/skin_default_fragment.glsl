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
layout (binding = 3) uniform sampler2D g_textures_3_;
layout (binding = 16) uniform sampler2D g_sss_texture;
layout (binding = 9) uniform samplerCube g_ibl_textures_0_;
layout (binding = 11) uniform samplerCube g_ibl_textures_2_;
layout (binding = 13) uniform samplerCube g_ibl_textures_4_;
layout (binding = 10) uniform samplerCube g_ibl_textures_1_;
layout (binding = 12) uniform samplerCube g_ibl_textures_3_;
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
    uint temp_0;
    bool temp_1;
    precise float temp_2;
    precise float temp_3;
    precise vec4 temp_4;
    precise float temp_5;
    precise float temp_6;
    precise vec2 temp_7;
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
    precise float temp_18;
    precise float temp_19;
    precise float temp_20;
    precise float temp_21;
    precise float temp_22;
    precise float temp_23;
    bool temp_24;
    precise float temp_25;
    precise float temp_26;
    precise float temp_27;
    precise float temp_28;
    precise float temp_29;
    bool temp_30;
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
    precise vec3 temp_88;
    precise float temp_89;
    precise float temp_90;
    precise float temp_91;
    precise vec3 temp_92;
    precise float temp_93;
    precise float temp_94;
    precise float temp_95;
    precise float temp_96;
    precise float temp_97;
    bool temp_98;
    precise float temp_99;
    precise float temp_100;
    precise float temp_101;
    precise float temp_102;
    precise float temp_103;
    bool temp_104;
    precise float temp_105;
    precise float temp_106;
    precise float temp_107;
    precise float temp_108;
    precise float temp_109;
    precise float temp_110;
    precise float temp_111;
    precise float temp_112;
    precise float temp_113;
    bool temp_114;
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
    precise vec3 temp_129;
    precise float temp_130;
    precise float temp_131;
    precise float temp_132;
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
    precise vec3 temp_146;
    precise float temp_147;
    precise float temp_148;
    precise float temp_149;
    precise vec3 temp_150;
    precise float temp_151;
    precise float temp_152;
    precise float temp_153;
    precise vec3 temp_154;
    precise vec3 temp_155;
    precise float temp_156;
    precise float temp_157;
    precise float temp_158;
    bool temp_159;
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
    int temp_177;
    int temp_178;
    int temp_179;
    temp_0 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 8, 1);
    temp_1 = int(temp_0) == 1;
    temp_2 = in_attr3.x;
    temp_3 = in_attr3.y;
    temp_4 = texture(g_textures_0_, vec2(temp_2, temp_3)).xyzw;
    temp_5 = intBitsToFloat(undef);
    temp_6 = uintBitsToFloat(temp_0);
    if (temp_1)
    {
        temp_7 = texture(g_textures_2_, vec2(temp_2, temp_3)).xy;
        temp_5 = temp_7.y;
        temp_6 = temp_7.x;
    }
    if (temp_1)
    {
        temp_8 = fma(temp_5, 2.0, -1.0);
        temp_9 = temp_8 * 2.0 * temp_8 * temp_8;
        temp_10 = fma(temp_8, 1.5, temp_9);
        temp_11 = fma(fma(temp_6, 2.0, -1.0), 1.5, temp_9);
        temp_12 = fma(temp_11, in_attr1.x, temp_10 * in_attr2.x) + in_attr0.x;
        temp_13 = fma(temp_11, in_attr1.y, temp_10 * in_attr2.y) + in_attr0.y;
        temp_14 = fma(temp_11, in_attr1.z, temp_10 * in_attr2.z) + in_attr0.z;
        temp_15 = inversesqrt(fma(temp_14, temp_14, fma(temp_13, temp_13, temp_12 * temp_12)));
        temp_16 = temp_12 * temp_15;
        temp_17 = temp_13 * temp_15;
        temp_18 = temp_14 * temp_15;
    }
    else
    {
        temp_19 = in_attr0.x;
        temp_20 = in_attr0.y;
        temp_21 = in_attr0.z;
        temp_22 = inversesqrt(fma(temp_21, temp_21, fma(temp_20, temp_20, temp_19 * temp_19)));
        temp_16 = temp_19 * temp_22;
        temp_17 = temp_20 * temp_22;
        temp_18 = temp_21 * temp_22;
    }
    temp_23 = in_attr4.x;
    temp_24 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_25 = in_attr4.y;
    temp_26 = in_attr4.z;
    temp_27 = fma(temp_17, fp_c4.data[43].y, temp_16 * fp_c4.data[43].x);
    temp_28 = intBitsToFloat(undef);
    temp_29 = temp_27;
    if (temp_24)
    {
        temp_28 = in_attr5.y;
    }
    temp_30 = (1 & floatBitsToInt(fp_c3.data[0].z)) == 1;
    temp_31 = fma(temp_18, fp_c4.data[44].z, fma(temp_17, fp_c4.data[44].y, temp_16 * fp_c4.data[44].x));
    temp_32 = inversesqrt(fma(temp_26, temp_26, fma(temp_25, temp_25, temp_23 * temp_23)));
    temp_33 = temp_23 * temp_32;
    temp_34 = temp_25 * temp_32;
    temp_35 = temp_26 * temp_32;
    temp_36 = fma(temp_18, fp_c4.data[42].z, fma(temp_17, fp_c4.data[42].y, temp_16 * fp_c4.data[42].x));
    temp_37 = fma(temp_35, fp_c4.data[42].z, fma(temp_34, fp_c4.data[42].y, temp_33 * fp_c4.data[42].x));
    temp_38 = fma(temp_18, fp_c4.data[43].z, temp_27);
    temp_39 = temp_28;
    if (temp_24)
    {
        temp_29 = in_attr5.x;
    }
    temp_40 = fma(temp_35, fp_c4.data[44].z, fma(temp_34, fp_c4.data[44].y, temp_33 * fp_c4.data[44].x));
    temp_41 = fma(temp_35, fp_c4.data[43].z, fma(temp_34, fp_c4.data[43].y, temp_33 * fp_c4.data[43].x));
    temp_42 = fma(0.0 - temp_37 + temp_36, 1.25, temp_37);
    temp_43 = fma(0.0 - temp_40 + temp_31, 1.25, temp_40);
    temp_44 = fma(0.0 - temp_41 + temp_38, 1.25, temp_41);
    if (temp_24)
    {
        temp_39 = texture(g_shadow_depth_textures_0_, vec2(temp_29, temp_28)).x;
    }
    temp_45 = texture(g_textures_3_, vec2(temp_2, temp_3)).w;
    temp_46 = texture(g_sss_texture, vec2(gl_FragCoord.x / 1.0 * fp_c4.data[54].x, gl_FragCoord.y / 1.0 * fp_c4.data[54].y)).xyz;
    temp_47 = temp_46.x;
    temp_48 = temp_46.y;
    temp_49 = temp_46.z;
    temp_50 = temp_39;
    if (!temp_24)
    {
        temp_50 = 1.0;
    }
    temp_51 = inversesqrt(fma(temp_43, temp_43, fma(temp_44, temp_44, temp_42 * temp_42)));
    temp_52 = fma(temp_35, temp_18, fma(temp_34, temp_17, temp_33 * temp_16));
    temp_53 = fma(temp_52 * 0.0 - temp_16, 2.0, temp_33);
    temp_54 = fma(temp_52 * 0.0 - temp_18, 2.0, temp_35);
    temp_55 = fma(temp_52 * 0.0 - temp_17, 2.0, temp_34);
    temp_56 = clamp(0.0 - fma(temp_40, temp_43 * temp_51, fma(temp_41, temp_44 * temp_51, temp_37 * temp_42 * temp_51)) + 1.0, 0.0, 1.0);
    temp_57 = temp_56 * temp_56;
    temp_58 = fma(temp_54, 0.0 - fp_c4.data[44].z, fma(temp_55, 0.0 - fp_c4.data[44].y, temp_53 * 0.0 - fp_c4.data[44].x));
    temp_59 = fma(temp_54, 0.0 - fp_c4.data[43].z, fma(temp_55, 0.0 - fp_c4.data[43].y, temp_53 * 0.0 - fp_c4.data[43].x));
    temp_60 = fma(temp_54, 0.0 - fp_c4.data[42].z, fma(temp_55, 0.0 - fp_c4.data[42].y, temp_53 * 0.0 - fp_c4.data[42].x));
    temp_61 = temp_57;
    temp_62 = temp_50;
    if (temp_24)
    {
        temp_61 = in_attr5.z;
    }
    temp_63 = temp_56 * temp_57 * temp_57;
    temp_64 = fma(temp_63, 0.2, 0.0219999999);
    temp_65 = fma(temp_63, 0.3, 0.0329999998);
    temp_66 = temp_64;
    temp_67 = temp_63;
    temp_68 = temp_61;
    if (!temp_30)
    {
        temp_65 = temp_64;
    }
    if (temp_24)
    {
        temp_66 = temp_16 * fp_c4.data[26].x;
    }
    temp_69 = temp_66;
    if (temp_24)
    {
        temp_67 = fma(temp_17, fp_c4.data[26].y, temp_66);
    }
    temp_70 = temp_67;
    if (temp_24)
    {
        temp_70 = fma(temp_18, fp_c4.data[26].z, temp_67);
    }
    temp_71 = temp_70;
    if (temp_24)
    {
        temp_71 = temp_70 + 1.0;
    }
    temp_72 = temp_71;
    if (temp_24)
    {
        temp_72 = min(temp_71, 1.0);
    }
    temp_73 = temp_72;
    if (temp_24)
    {
        temp_73 = temp_72 * temp_72;
    }
    temp_74 = temp_73;
    if (temp_24)
    {
        temp_74 = temp_73 * temp_73;
    }
    if (temp_24)
    {
        temp_68 = 0.0 - temp_61 + temp_50;
    }
    temp_75 = temp_68;
    if (temp_24)
    {
        temp_75 = temp_68 * fp_c4.data[45].x;
    }
    temp_76 = temp_75;
    if (temp_24)
    {
        temp_76 = temp_75 * fp_c5.data[30].w * 3.0; // Shadow improvement #1
    }
    temp_77 = temp_76;
    if (temp_24)
    {
        temp_77 = temp_76;
    }
    if (temp_24)
    {
        temp_69 = exp2(temp_77);
    }
    temp_78 = temp_69;
    if (temp_24)
    {
        temp_78 = min(temp_69, 1.0);
    }
    if (temp_24)
    {
        temp_62 = min(temp_78, temp_74);
    }
    temp_79 = temp_45 * temp_62;
    if (temp_30)
    {
        temp_80 = clamp(temp_47 + -0.0, 0.0, 1.0);
        temp_81 = clamp(temp_48 + -0.0, 0.0, 1.0);
        temp_82 = clamp(temp_49 + -0.0, 0.0, 1.0);
        temp_83 = fma(temp_62, 0.8, 0.200000003);
        if (0.0 < fp_c7.data[5].x)
        {
            temp_84 = 1.0 / max(abs(temp_31), max(abs(temp_38), abs(temp_36)));
            temp_85 = temp_31 * temp_84;
            temp_86 = temp_36 * temp_84;
            temp_87 = temp_38 * temp_84;
            temp_88 = textureLod(g_ibl_textures_0_, vec3(temp_86, temp_87, temp_85), 1.0).xyz;
            temp_89 = temp_88.x;
            temp_90 = temp_88.y;
            temp_91 = temp_88.z;
            temp_92 = textureLod(g_ibl_textures_0_, vec3(temp_86, temp_87, temp_85), 0.0).xyz;
            temp_93 = fma(0.0 - temp_89 + temp_92.x, temp_62, temp_89);
            temp_94 = fma(0.0 - temp_90 + temp_92.y, temp_62, temp_90);
            temp_95 = 1.0 / (1.0 + 0.0 - fp_c7.data[7].w);
            temp_96 = fma(0.0 - temp_91 + temp_92.z, temp_62, temp_91);
            temp_97 = 1.0 / fp_c7.data[7].z * sqrt(fma(temp_96, temp_96, fma(temp_94, temp_94, temp_93 * temp_93)));
            temp_98 = temp_97 < fp_c7.data[7].w;
            temp_99 = fma(1.0 + 0.0 - fp_c7.data[7].y, (temp_97 + 0.0 - fp_c7.data[7].w) * temp_95, fp_c7.data[7].y);
            temp_100 = temp_95;
            temp_101 = temp_93;
            temp_102 = temp_94;
            temp_103 = temp_96;
            if (temp_97 > 1.0)
            {
                temp_99 = 1.0;
            }
            temp_104 = 0.0 < fp_c7.data[6].w;
            if (temp_98)
            {
                temp_100 = fp_c7.data[7].y;
            }
            temp_105 = temp_100;
            if (!temp_98)
            {
                temp_105 = temp_99;
            }
            if (temp_104)
            {
                temp_101 = fma(fma(temp_105, fp_c7.data[7].x, 0.0 - temp_93), fp_c7.data[6].w, temp_93);
            }
            if (temp_104)
            {
                temp_102 = fma(fma(temp_105, fp_c7.data[7].x, 0.0 - temp_94), fp_c7.data[6].w, temp_94);
            }
            if (temp_104)
            {
                temp_103 = fma(fma(temp_105, fp_c7.data[7].x, 0.0 - temp_96), fp_c7.data[6].w, temp_96);
            }
            temp_106 = fma(temp_101, fp_c7.data[5].x, 0.0 - fp_c7.data[5].x) + 1.0;
            temp_107 = fma(temp_102, fp_c7.data[5].x, 0.0 - fp_c7.data[5].x) + 1.0;
            temp_108 = fma(temp_103, fp_c7.data[5].x, 0.0 - fp_c7.data[5].x) + 1.0;
        }
        else
        {
            temp_106 = 1.0;
            temp_107 = 1.0;
            temp_108 = 1.0;
        }
        temp_109 = in_attr6.w;
        temp_110 = fma(temp_18, fp_c4.data[26].z, fma(temp_17, fp_c4.data[26].y, temp_16 * fp_c4.data[26].x));
        temp_111 = 1.0 + 0.0 - fp_c7.data[10].y;
        temp_112 = (0.0 - temp_110 + fp_c7.data[10].x) * (1.0 / fp_c7.data[10].z) * temp_111;
        if (!(0.0 - fp_c7.data[10].z + fp_c7.data[10].x < temp_110))
        {
            temp_112 = temp_111;
        }
        temp_113 = temp_112;
        if (temp_110 > fp_c7.data[10].x)
        {
            temp_113 = 0.0;
        }
        temp_114 = temp_3 < fp_c7.data[11].w && temp_3 > fp_c7.data[11].z && temp_2 < fp_c7.data[11].y && temp_2 > fp_c7.data[11].x;
        temp_115 = fma(fma(fma(temp_80, -0.9, 1.03999996), temp_83, temp_80 * 0.899999976), fma(temp_106 * fp_c4.data[14].x, fp_c7.data[1].w, temp_109), fp_c4.data[15].x) * fp_c7.data[1].y;
        temp_116 = fma(fma(fma(temp_82, -0.88, 1.03999996), temp_83, temp_82 * 0.879999995), fma(temp_108 * fp_c4.data[14].z, fp_c7.data[1].w, temp_109), fp_c4.data[15].z) * fp_c7.data[1].y;
        temp_117 = fma(1.0 / ((0.0 - fp_c7.data[11].z + fp_c7.data[11].w) * 0.5), 0.0 - abs(fma(fp_c7.data[11].z + fp_c7.data[11].w, 0.5, 0.0 - temp_3)) + -0.0, 1) * 0.0 - fma(1.0 / ((0.0 - fp_c7.data[11].x + fp_c7.data[11].y) * 0.5), 0.0 - abs(fma(fp_c7.data[11].x + fp_c7.data[11].y, 0.5, 0.0 - temp_2)) + -0.0, 1) * temp_113;
        temp_118 = fma(fma(fma(temp_81, -0.77, 1.03999996), temp_83, temp_81 * 0.769999981), fma(temp_107 * fp_c4.data[14].y, fp_c7.data[1].w, temp_109), fp_c4.data[15].y) * fp_c7.data[1].y;
        temp_119 = fma(temp_115, temp_117, temp_115);
        temp_120 = fma(temp_118, temp_117, temp_118);
        temp_121 = fma(temp_116, temp_117, temp_116);
        if (!temp_114)
        {
            temp_119 = temp_115;
        }
        temp_122 = temp_119;
        if (!temp_114)
        {
            temp_120 = temp_118;
        }
        temp_123 = temp_120;
        if (!temp_114)
        {
            temp_121 = temp_116;
        }
        temp_124 = temp_121;
    }
    else
    {
        temp_125 = 1.0 / max(abs(temp_31), max(abs(temp_38), abs(temp_36)));
        temp_126 = temp_31 * temp_125;
        temp_127 = temp_36 * temp_125;
        temp_128 = temp_38 * temp_125;
        temp_129 = textureLod(g_ibl_textures_0_, vec3(temp_127, temp_128, temp_126), 1.0).xyz;
        temp_130 = temp_129.x;
        temp_131 = temp_129.y;
        temp_132 = temp_129.z;
        temp_133 = textureLod(g_ibl_textures_0_, vec3(temp_127, temp_128, temp_126), 0.0).xyz;
        temp_134 = temp_45 > 0.99 ? 1.0 : 0.0;
        temp_135 = in_attr6.w;
        temp_136 = clamp((fma(fma(temp_18, fp_c4.data[33].z, fma(temp_17, fp_c4.data[33].y, temp_16 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
        temp_137 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1 ? 1.0 : 0.0;
        temp_138 = fma(fma(temp_136, 0.0 - fp_c4.data[34].x + fp_c4.data[35].x, fp_c4.data[34].x) * fp_c4.data[36].z * temp_137, temp_134, fma(fma(0.0 - temp_130 + temp_133.x, temp_62, temp_130), fp_c4.data[14].x, temp_135) + fp_c4.data[15].x);
        temp_139 = fma(fma(temp_136, 0.0 - fp_c4.data[34].y + fp_c4.data[35].y, fp_c4.data[34].y) * fp_c4.data[36].z * temp_137, temp_134, fma(fma(0.0 - temp_131 + temp_133.y, temp_62, temp_131), fp_c4.data[14].y, temp_135) + fp_c4.data[15].y);
        temp_140 = fma(fma(temp_136, 0.0 - fp_c4.data[34].z + fp_c4.data[35].z, fp_c4.data[34].z) * fp_c4.data[36].z * temp_137, temp_134, fma(fma(0.0 - temp_132 + temp_133.z, temp_62, temp_132), fp_c4.data[14].z, temp_135) + fp_c4.data[15].z);
        temp_141 = fma(sqrt(clamp(fma(temp_40, temp_31, fma(temp_41, temp_38, temp_37 * temp_36)), 0.0, 1.0)), 0.75, 0.25) * fp_c5.data[41].x;
        temp_122 = fma(temp_47 + 0.0 - temp_138, temp_141, temp_138);
        temp_123 = fma(temp_48 + 0.0 - temp_139, temp_141, temp_139);
        temp_124 = fma(temp_49 + 0.0 - temp_140, temp_141, temp_140);
    }
    temp_142 = 1.0 / max(abs(temp_58), max(abs(temp_59), abs(temp_60)));
    temp_143 = temp_60 * temp_142;
    temp_144 = temp_59 * temp_142;
    temp_145 = temp_58 * temp_142;
    temp_146 = textureLod(g_ibl_textures_2_, vec3(temp_143, temp_144, temp_145), 1.0).xyz;
    temp_147 = temp_146.x;
    temp_148 = temp_146.y;
    temp_149 = temp_146.z;
    temp_150 = textureLod(g_ibl_textures_4_, vec3(temp_143, temp_144, temp_145), 1.0).xyz;
    temp_151 = temp_150.x;
    temp_152 = temp_150.y;
    temp_153 = temp_150.z;
    temp_154 = textureLod(g_ibl_textures_1_, vec3(temp_143, temp_144, temp_145), 0.0).xyz;
    temp_155 = textureLod(g_ibl_textures_3_, vec3(temp_143, temp_144, temp_145), 0.0).xyz;
    temp_156 = temp_155.x;
    temp_157 = temp_65 + fp_c5.data[34].w;
    temp_158 = fma(temp_157, fp_c5.data[36].y, fp_c5.data[37].y);
    temp_159 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
    temp_160 = fma(temp_157, fp_c5.data[36].x, fp_c5.data[37].x);
    temp_161 = fma(fp_c5.data[34].w, 15.0, 0.100000001);
    temp_162 = temp_145;
    temp_163 = temp_156;
    if (!temp_30)
    {
        temp_162 = temp_160;
    }
    temp_164 = temp_162;
    if (temp_30)
    {
        temp_164 = temp_160 * fp_c7.data[2].x;
    }
    if (temp_30)
    {
        temp_163 = temp_158 * fp_c7.data[2].x;
    }
    temp_165 = fma(temp_161, 0.0 - temp_151 + temp_156, temp_151);
    temp_166 = in_attr5.w;
    temp_167 = fma(temp_161, 0.0 - temp_152 + temp_155.y, temp_152);
    temp_168 = fma(temp_161, 0.0 - temp_153 + temp_155.z, temp_153);
    temp_169 = temp_163;
    if (!temp_30)
    {
        temp_169 = temp_158;
    }
    temp_170 = fma(temp_79, 0.7, 0.300000012);
    temp_171 = fma(temp_157, fp_c5.data[36].z, fp_c5.data[37].z);
    temp_172 = temp_171 * fp_c7.data[2].x;
    if (!temp_30)
    {
        temp_172 = temp_171;
    }
    temp_173 = fma(fma(temp_4.x, fp_c5.data[34].x, fp_c5.data[35].x) * temp_122, 0.98, fma(temp_79, 0.0 - temp_165 + fma(temp_161, 0.0 - temp_147 + temp_154.x, temp_147), temp_165) * fp_c4.data[16].x * temp_170 * temp_164);
    temp_174 = fma(fma(temp_4.y, fp_c5.data[34].y, fp_c5.data[35].y) * temp_123, 0.98, fma(temp_79, 0.0 - temp_167 + fma(temp_161, 0.0 - temp_148 + temp_154.y, temp_148), temp_167) * fp_c4.data[16].y * temp_170 * temp_169);
    temp_175 = fma(fma(temp_4.z, fp_c5.data[34].z, fp_c5.data[35].z) * temp_124, 0.98, fma(temp_79, 0.0 - temp_168 + fma(temp_161, 0.0 - temp_149 + temp_154.z, temp_149), temp_168) * fp_c4.data[16].z * temp_170 * temp_172);
    temp_176 = fma(temp_175, 0.1145, fma(temp_174, 0.5866, temp_173 * 0.298900008));
    temp_177 = floatBitsToInt(max(0.0, fma(0.0 - temp_174 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_176, fp_c4.data[31].y), fp_c4.data[32].w, temp_174)));
    if (!temp_159)
    {
        temp_177 = floatBitsToInt(fma(0.0 - temp_174 + in_attr7.y, temp_166, temp_174));
    }
    temp_178 = floatBitsToInt(max(0.0, fma(0.0 - temp_173 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_176, fp_c4.data[31].x), fp_c4.data[32].w, temp_173)));
    if (!temp_159)
    {
        temp_178 = floatBitsToInt(fma(0.0 - temp_173 + in_attr7.x, temp_166, temp_173));
    }
    temp_179 = floatBitsToInt(max(0.0, fma(0.0 - temp_175 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_176, fp_c4.data[31].z), fp_c4.data[32].w, temp_175)));
    if (!temp_159)
    {
        temp_179 = floatBitsToInt(fma(0.0 - temp_175 + in_attr7.z, temp_166, temp_175));
    }
    SV_Target0.x = intBitsToFloat(temp_178);
    SV_Target0.y = intBitsToFloat(temp_177);
    SV_Target0.z = intBitsToFloat(temp_179);
    SV_Target0.w = max(temp_4.w, fp_c5.data[39].w);
 // return; Yuzu crash
}
