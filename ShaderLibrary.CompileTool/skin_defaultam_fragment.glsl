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

layout (binding = 2, std140) uniform _Batch
{
    precise vec4 data[4096];
} fp_c5;

layout (binding = 0, std140) uniform _Shader
{
    precise vec4 data[4096];
} fp_c3;

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
layout (binding = 13) uniform samplerCube g_ibl_textures_4_;
layout (binding = 11) uniform samplerCube g_ibl_textures_2_;
layout (binding = 12) uniform samplerCube g_ibl_textures_3_;
layout (binding = 10) uniform samplerCube g_ibl_textures_1_;
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
    bool keep = true;
    precise float temp_0;
    precise float temp_1;
    precise vec4 temp_2;
    precise float temp_3;
    uint temp_4;
    precise float temp_5;
    bool temp_6;
    precise float temp_7;
    precise vec2 temp_8;
    uint temp_9;
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
    precise float temp_29;
    bool temp_30;
    precise float temp_31;
    precise float temp_32;
    precise float temp_33;
    precise float temp_34;
    precise float temp_35;
    precise float temp_36;
    precise float temp_37;
    precise vec3 temp_38;
    precise float temp_39;
    precise float temp_40;
    precise float temp_41;
    precise float temp_42;
    precise float temp_43;
    precise float temp_44;
    precise float temp_45;
    int temp_46;
    precise float temp_47;
    precise float temp_48;
    bool temp_49;
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
    precise vec3 temp_79;
    precise float temp_80;
    precise float temp_81;
    precise float temp_82;
    precise vec3 temp_83;
    precise float temp_84;
    precise float temp_85;
    precise float temp_86;
    precise float temp_87;
    precise float temp_88;
    precise float temp_89;
    bool temp_90;
    precise float temp_91;
    precise float temp_92;
    precise float temp_93;
    precise float temp_94;
    precise float temp_95;
    precise float temp_96;
    precise float temp_97;
    precise float temp_98;
    precise float temp_99;
    bool temp_100;
    precise float temp_101;
    precise float temp_102;
    precise float temp_103;
    precise float temp_104;
    precise float temp_105;
    bool temp_106;
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
    precise vec3 temp_119;
    precise float temp_120;
    precise float temp_121;
    precise float temp_122;
    precise vec3 temp_123;
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
    precise vec3 temp_143;
    precise float temp_144;
    precise float temp_145;
    precise float temp_146;
    precise vec3 temp_147;
    precise float temp_148;
    precise float temp_149;
    precise float temp_150;
    precise vec3 temp_151;
    precise float temp_152;
    precise vec3 temp_153;
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
    bool temp_182;
    int temp_183;
    int temp_184;
    int temp_185;
    temp_0 = in_attr3.x;
    temp_1 = in_attr3.y;
    temp_2 = texture(g_textures_0_, vec2(temp_0, temp_1)).xyzw;
    temp_3 = temp_2.w;
    temp_4 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 8, 1);
    temp_5 = uintBitsToFloat(temp_4);
    if (temp_3 < min(fp_c5.data[39].z, 0.5))
    {
        // discard; Yuzu crash
        keep = false;
    }
    else
    {
        temp_6 = int(temp_4) == 1;
        temp_7 = intBitsToFloat(undef);
        if (temp_6)
        {
            temp_8 = texture(g_textures_2_, vec2(temp_0, temp_1)).xy;
            temp_7 = temp_8.y;
            temp_5 = temp_8.x;
        }
        temp_9 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1);
        temp_10 = max(temp_3, fp_c5.data[39].w);
        temp_11 = temp_7;
        temp_12 = uintBitsToFloat(temp_9);
        if (!(fp_c5.data[39].z < 0.5))
        {
            temp_10 = 1.0;
        }
        if (temp_6)
        {
            temp_13 = fma(temp_7, 2.0, -1.0);
            temp_14 = temp_13 * 2.0 * temp_13 * temp_13;
            temp_15 = fma(temp_13, 1.5, temp_14);
            temp_16 = fma(fma(temp_5, 2.0, -1.0), 1.5, temp_14);
            temp_17 = fma(temp_16, in_attr1.x, temp_15 * in_attr2.x) + in_attr0.x;
            temp_18 = fma(temp_16, in_attr1.y, temp_15 * in_attr2.y) + in_attr0.y;
            temp_19 = fma(temp_16, in_attr1.z, temp_15 * in_attr2.z) + in_attr0.z;
            temp_20 = inversesqrt(fma(temp_19, temp_19, fma(temp_18, temp_18, temp_17 * temp_17)));
            temp_11 = temp_20;
            temp_21 = temp_17 * temp_20;
            temp_22 = temp_18 * temp_20;
            temp_23 = temp_19 * temp_20;
            temp_24 = temp_14;
            temp_25 = temp_17;
        }
        else
        {
            temp_26 = in_attr0.x;
            temp_27 = in_attr0.y;
            temp_28 = in_attr0.z;
            temp_29 = inversesqrt(fma(temp_28, temp_28, fma(temp_27, temp_27, temp_26 * temp_26)));
            temp_21 = temp_26 * temp_29;
            temp_22 = temp_27 * temp_29;
            temp_23 = temp_28 * temp_29;
            temp_24 = intBitsToFloat(undef);
            temp_25 = intBitsToFloat(undef);
        }
        temp_30 = int(temp_9) != 0;
        temp_31 = intBitsToFloat(undef);
        temp_32 = temp_11;
        temp_33 = temp_25;
        temp_34 = temp_24;
        temp_35 = 1.40129846E-45;
        if (!temp_30)
        {
            temp_31 = 1.0;
        }
        temp_36 = temp_31;
        if (temp_30)
        {
            temp_32 = in_attr5.x;
        }
        if (temp_30)
        {
            temp_12 = in_attr5.y;
        }
        if (temp_30)
        {
            temp_33 = texture(g_shadow_depth_textures_0_, vec2(temp_32, temp_12)).x;
        }
        temp_37 = texture(g_textures_3_, vec2(temp_0, temp_1)).w;
        temp_38 = texture(g_sss_texture, vec2(gl_FragCoord.x / 1.0 * fp_c4.data[54].x, gl_FragCoord.y / 1.0 * fp_c4.data[54].y)).xyz;
        temp_39 = temp_38.x;
        temp_40 = temp_38.y;
        temp_41 = temp_38.z;
        temp_42 = in_attr4.x;
        temp_43 = temp_33;
        if (temp_30)
        {
            temp_34 = in_attr5.z;
        }
        temp_44 = in_attr4.y;
        temp_45 = in_attr4.z;
        temp_46 = 1 & floatBitsToInt(fp_c3.data[0].z);
        temp_47 = intBitsToFloat(temp_46);
        temp_48 = temp_34;
        if (!temp_30)
        {
            temp_35 = 1.0;
        }
        temp_49 = temp_46 == 1;
        temp_50 = temp_35;
        if (temp_30)
        {
            temp_47 = temp_21 * fp_c4.data[26].x;
        }
        temp_51 = temp_47;
        if (temp_30)
        {
            temp_51 = fma(temp_22, fp_c4.data[26].y, temp_47);
        }
        temp_52 = fma(temp_23, fp_c4.data[42].z, fma(temp_22, fp_c4.data[42].y, temp_21 * fp_c4.data[42].x));
        temp_53 = temp_51;
        if (temp_30)
        {
            temp_53 = fma(temp_23, fp_c4.data[26].z, temp_51);
        }
        temp_54 = temp_53;
        if (temp_30)
        {
            temp_54 = temp_53 + 1.0;
        }
        temp_55 = temp_54;
        if (temp_30)
        {
            temp_55 = min(temp_54, 1.0);
        }
        temp_56 = inversesqrt(fma(temp_45, temp_45, fma(temp_44, temp_44, temp_42 * temp_42)));
        temp_57 = temp_42 * temp_56;
        temp_58 = temp_44 * temp_56;
        temp_59 = temp_45 * temp_56;
        temp_60 = fma(temp_59, fp_c4.data[42].z, fma(temp_58, fp_c4.data[42].y, temp_57 * fp_c4.data[42].x));
        if (temp_30)
        {
            temp_48 = 0.0 - temp_34 + temp_33;
        }
        temp_61 = temp_48;
        if (temp_30)
        {
            temp_61 = temp_48 * fp_c4.data[45].x;
        }
        temp_62 = temp_61;
        if (temp_30)
        {
            temp_62 = temp_61 * fp_c5.data[30].w * 3.0; // Shadow improvement #1
        }
        temp_63 = intBitsToFloat(undef);
        temp_64 = temp_62;
        if (temp_30)
        {
            temp_63 = temp_62;
        }
        if (temp_30)
        {
            temp_64 = temp_55 * temp_55;
        }
        temp_65 = temp_64;
        if (temp_30)
        {
            temp_43 = exp2(temp_63);
        }
        if (temp_30)
        {
            temp_65 = temp_64 * temp_64;
        }
        temp_66 = fma(temp_23, fp_c4.data[44].z, fma(temp_22, fp_c4.data[44].y, temp_21 * fp_c4.data[44].x));
        if (temp_30)
        {
            temp_50 = min(temp_43, 1.0);
        }
        temp_67 = fma(temp_23, fp_c4.data[43].z, fma(temp_22, fp_c4.data[43].y, temp_21 * fp_c4.data[43].x));
        temp_68 = temp_50;
        if (temp_30)
        {
            temp_68 = min(temp_65, temp_50);
        }
        temp_69 = fma(temp_59, fp_c4.data[44].z, fma(temp_58, fp_c4.data[44].y, temp_57 * fp_c4.data[44].x));
        if (temp_30)
        {
            temp_36 = temp_68;
        }
        temp_70 = fma(temp_59, fp_c4.data[43].z, fma(temp_58, fp_c4.data[43].y, temp_57 * fp_c4.data[43].x));
        if (temp_49)
        {
            temp_71 = clamp(temp_39 + -0.0, 0.0, 1.0);
            temp_72 = clamp(temp_40 + -0.0, 0.0, 1.0);
            temp_73 = clamp(temp_41 + -0.0, 0.0, 1.0);
            temp_74 = fma(temp_68, 0.8, 0.200000003);
            if (0.0 < fp_c7.data[5].x)
            {
                temp_75 = 1.0 / max(abs(temp_66), max(abs(temp_67), abs(temp_52)));
                temp_76 = temp_66 * temp_75;
                temp_77 = temp_52 * temp_75;
                temp_78 = temp_67 * temp_75;
                temp_79 = textureLod(g_ibl_textures_0_, vec3(temp_77, temp_78, temp_76), 1.0).xyz;
                temp_80 = temp_79.x;
                temp_81 = temp_79.y;
                temp_82 = temp_79.z;
                temp_83 = textureLod(g_ibl_textures_0_, vec3(temp_77, temp_78, temp_76), 0.0).xyz;
                temp_84 = fma(0.0 - temp_80 + temp_83.x, temp_68, temp_80);
                temp_85 = fma(0.0 - temp_82 + temp_83.z, temp_68, temp_82);
                temp_86 = fma(0.0 - temp_81 + temp_83.y, temp_68, temp_81);
                temp_87 = 1.0 / fp_c7.data[7].z * sqrt(fma(temp_85, temp_85, fma(temp_86, temp_86, temp_84 * temp_84)));
                temp_88 = fma(1.0 + 0.0 - fp_c7.data[7].y, (temp_87 + 0.0 - fp_c7.data[7].w) * (1.0 / (1.0 + 0.0 - fp_c7.data[7].w)), fp_c7.data[7].y);
                if (temp_87 > 1.0)
                {
                    temp_88 = 1.0;
                }
                temp_89 = temp_88;
                if (temp_87 < fp_c7.data[7].w)
                {
                    temp_89 = fp_c7.data[7].y;
                }
                temp_90 = 0.0 < fp_c7.data[6].w;
                temp_91 = fma(fma(temp_89, fp_c7.data[7].x, 0.0 - temp_86), fp_c7.data[6].w, temp_86);
                temp_92 = fma(fma(temp_89, fp_c7.data[7].x, 0.0 - temp_84), fp_c7.data[6].w, temp_84);
                if (!temp_90)
                {
                    temp_91 = temp_86;
                }
                temp_93 = fma(fma(temp_89, fp_c7.data[7].x, 0.0 - temp_85), fp_c7.data[6].w, temp_85);
                if (!temp_90)
                {
                    temp_92 = temp_84;
                }
                if (!temp_90)
                {
                    temp_93 = temp_85;
                }
                temp_94 = fma(temp_92, fp_c7.data[5].x, 0.0 - fp_c7.data[5].x) + 1.0;
                temp_95 = fma(temp_91, fp_c7.data[5].x, 0.0 - fp_c7.data[5].x) + 1.0;
                temp_96 = fma(temp_93, fp_c7.data[5].x, 0.0 - fp_c7.data[5].x) + 1.0;
            }
            else
            {
                temp_94 = 1.0;
                temp_95 = 1.0;
                temp_96 = 1.0;
            }
            temp_97 = in_attr6.w;
            temp_98 = fma(temp_23, fp_c4.data[26].z, fma(temp_22, fp_c4.data[26].y, temp_21 * fp_c4.data[26].x));
            temp_99 = fma(fma(fma(temp_72, -0.77, 1.03999996), temp_74, temp_72 * 0.769999981), fma(temp_95 * fp_c4.data[14].y, fp_c7.data[1].w, temp_97), fp_c4.data[15].y) * fp_c7.data[1].y;
            temp_100 = temp_98 > fp_c7.data[10].x;
            temp_101 = 1.0 + 0.0 - fp_c7.data[10].y;
            temp_102 = (0.0 - temp_98 + fp_c7.data[10].x) * (1.0 / fp_c7.data[10].z) * temp_101;
            temp_103 = temp_101;
            if (!(0.0 - fp_c7.data[10].z + fp_c7.data[10].x < temp_98))
            {
                temp_102 = temp_101;
            }
            if (temp_100)
            {
                temp_103 = 0.0;
            }
            temp_104 = temp_103;
            if (!temp_100)
            {
                temp_104 = temp_102;
            }
            temp_105 = fma(fma(fma(temp_73, -0.88, 1.03999996), temp_74, temp_73 * 0.879999995), fma(temp_96 * fp_c4.data[14].z, fp_c7.data[1].w, temp_97), fp_c4.data[15].z) * fp_c7.data[1].y;
            temp_106 = temp_1 < fp_c7.data[11].w && temp_1 > fp_c7.data[11].z && temp_0 < fp_c7.data[11].y && temp_0 > fp_c7.data[11].x;
            temp_107 = fma(1.0 / ((fp_c7.data[11].w + 0.0 - fp_c7.data[11].z) * 0.5), 0.0 - abs(fma(fp_c7.data[11].w + fp_c7.data[11].z, 0.5, 0.0 - temp_1)) + -0.0, 1) * 0.0 - fma(1.0 / ((fp_c7.data[11].y + 0.0 - fp_c7.data[11].x) * 0.5), 0.0 - abs(fma(fp_c7.data[11].y + fp_c7.data[11].x, 0.5, 0.0 - temp_0)) + -0.0, 1) * temp_104;
            temp_108 = fma(fma(fma(temp_71, -0.9, 1.03999996), temp_74, temp_71 * 0.899999976), fma(temp_94 * fp_c4.data[14].x, fp_c7.data[1].w, temp_97), fp_c4.data[15].x) * fp_c7.data[1].y;
            temp_109 = fma(temp_108, temp_107, temp_108);
            temp_110 = fma(temp_99, temp_107, temp_99);
            temp_111 = fma(temp_105, temp_107, temp_105);
            if (!temp_106)
            {
                temp_109 = temp_108;
            }
            temp_112 = temp_109;
            if (!temp_106)
            {
                temp_110 = temp_99;
            }
            temp_113 = temp_110;
            if (!temp_106)
            {
                temp_111 = temp_105;
            }
            temp_114 = temp_111;
        }
        else
        {
            temp_115 = 1.0 / max(abs(temp_66), max(abs(temp_67), abs(temp_52)));
            temp_116 = temp_66 * temp_115;
            temp_117 = temp_52 * temp_115;
            temp_118 = temp_67 * temp_115;
            temp_119 = textureLod(g_ibl_textures_0_, vec3(temp_117, temp_118, temp_116), 1.0).xyz;
            temp_120 = temp_119.x;
            temp_121 = temp_119.y;
            temp_122 = temp_119.z;
            temp_123 = textureLod(g_ibl_textures_0_, vec3(temp_117, temp_118, temp_116), 0.0).xyz;
            temp_124 = in_attr6.w;
            temp_125 = clamp((fma(fma(temp_23, fp_c4.data[33].z, fma(temp_22, fp_c4.data[33].y, temp_21 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
            temp_126 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1 ? 1.0 : 0.0;
            temp_127 = temp_37 > 0.99 ? 1.0 : 0.0;
            temp_128 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_125, fp_c4.data[34].y) * fp_c4.data[36].z * temp_126, temp_127, fma(fma(0.0 - temp_121 + temp_123.y, temp_68, temp_121), fp_c4.data[14].y, temp_124) + fp_c4.data[15].y);
            temp_129 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_125, fp_c4.data[34].x) * fp_c4.data[36].z * temp_126, temp_127, fma(fma(0.0 - temp_120 + temp_123.x, temp_68, temp_120), fp_c4.data[14].x, temp_124) + fp_c4.data[15].x);
            temp_130 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_125, fp_c4.data[34].z) * fp_c4.data[36].z * temp_126, temp_127, fma(fma(0.0 - temp_122 + temp_123.z, temp_68, temp_122), fp_c4.data[14].z, temp_124) + fp_c4.data[15].z);
            temp_131 = fma(sqrt(clamp(fma(temp_66, temp_69, fma(temp_67, temp_70, temp_52 * temp_60)), 0.0, 1.0)), 0.75, 0.25) * fp_c5.data[41].x;
            temp_113 = fma(temp_40 + 0.0 - temp_128, temp_131, temp_128);
            temp_112 = fma(temp_39 + 0.0 - temp_129, temp_131, temp_129);
            temp_114 = fma(temp_41 + 0.0 - temp_130, temp_131, temp_130);
        }
        if (temp_10 <= fp_c5.data[39].z && (temp_10 != 1.0 || isnan(temp_10) || isnan(1.0)))
        {
            // discard; Yuzu crash
            keep = false;
        }
        else
        {
            temp_132 = fma(temp_59, temp_23, fma(temp_58, temp_22, temp_57 * temp_21));
            temp_133 = fma(temp_132 * 0.0 - temp_21, 2.0, temp_57);
            temp_134 = fma(temp_132 * 0.0 - temp_22, 2.0, temp_58);
            temp_135 = fma(temp_132 * 0.0 - temp_23, 2.0, temp_59);
            temp_136 = fma(temp_135, 0.0 - fp_c4.data[43].z, fma(temp_134, 0.0 - fp_c4.data[43].y, temp_133 * 0.0 - fp_c4.data[43].x));
            temp_137 = fma(temp_135, 0.0 - fp_c4.data[42].z, fma(temp_134, 0.0 - fp_c4.data[42].y, temp_133 * 0.0 - fp_c4.data[42].x));
            temp_138 = fma(temp_135, 0.0 - fp_c4.data[44].z, fma(temp_134, 0.0 - fp_c4.data[44].y, temp_133 * 0.0 - fp_c4.data[44].x));
            temp_139 = 1.0 / max(abs(temp_138), max(abs(temp_136), abs(temp_137)));
            temp_140 = temp_138 * temp_139;
            temp_141 = temp_137 * temp_139;
            temp_142 = temp_136 * temp_139;
            temp_143 = textureLod(g_ibl_textures_4_, vec3(temp_141, temp_142, temp_140), 1.0).xyz;
            temp_144 = temp_143.x;
            temp_145 = temp_143.y;
            temp_146 = temp_143.z;
            temp_147 = textureLod(g_ibl_textures_2_, vec3(temp_141, temp_142, temp_140), 1.0).xyz;
            temp_148 = temp_147.x;
            temp_149 = temp_147.y;
            temp_150 = temp_147.z;
            temp_151 = textureLod(g_ibl_textures_3_, vec3(temp_141, temp_142, temp_140), 0.0).xyz;
            temp_152 = temp_151.x;
            temp_153 = textureLod(g_ibl_textures_1_, vec3(temp_141, temp_142, temp_140), 0.0).xyz;
            temp_154 = temp_37 * temp_36;
            temp_155 = fma(temp_52 + 0.0 - temp_60, 1.25, temp_60);
            temp_156 = fma(temp_67 + 0.0 - temp_70, 1.25, temp_70);
            temp_157 = fma(temp_66 + 0.0 - temp_69, 1.25, temp_69);
            temp_158 = inversesqrt(fma(temp_157, temp_157, fma(temp_156, temp_156, temp_155 * temp_155)));
            temp_159 = clamp(0.0 - fma(temp_69, temp_157 * temp_158, fma(temp_70, temp_156 * temp_158, temp_60 * temp_155 * temp_158)) + 1.0, 0.0, 1.0);
            temp_160 = temp_159 * temp_159 * temp_159 * temp_159 * temp_159;
            temp_161 = temp_160;
            temp_162 = temp_152;
            if (temp_49)
            {
                temp_161 = fma(temp_160, 0.3, 0.0329999998);
            }
            temp_163 = temp_161;
            if (!temp_49)
            {
                temp_163 = fma(temp_160, 0.2, 0.0219999999);
            }
            temp_164 = temp_163 + fp_c5.data[34].w;
            temp_165 = fma(temp_164, fp_c5.data[36].x, fp_c5.data[37].x);
            temp_166 = fma(temp_164, fp_c5.data[36].y, fp_c5.data[37].y);
            temp_167 = fp_c5.data[34].z;
            if (!temp_49)
            {
                temp_167 = temp_165;
            }
            temp_168 = fma(fp_c5.data[34].w, 15.0, 0.100000001);
            temp_169 = temp_167;
            if (temp_49)
            {
                temp_169 = temp_165 * fp_c7.data[2].x;
            }
            temp_170 = fma(temp_168, temp_152 + 0.0 - temp_144, temp_144);
            temp_171 = fma(temp_168, temp_151.y + 0.0 - temp_145, temp_145);
            temp_172 = fma(temp_168, temp_151.z + 0.0 - temp_146, temp_146);
            if (!temp_49)
            {
                temp_162 = temp_166;
            }
            temp_173 = fma(temp_164, fp_c5.data[36].z, fp_c5.data[37].z);
            temp_174 = temp_162;
            if (temp_49)
            {
                temp_174 = temp_166 * fp_c7.data[2].x;
            }
            temp_175 = fma(temp_154, 0.7, 0.300000012);
            temp_176 = temp_173 * fp_c7.data[2].x;
            if (!temp_49)
            {
                temp_176 = temp_173;
            }
            temp_177 = in_attr5.w;
            temp_178 = fma(fma(temp_2.x, fp_c5.data[34].x, fp_c5.data[35].x) * temp_112, 0.98, fma(temp_154, temp_170 + 0.0 - fma(0.0 - temp_148 + temp_153.x, temp_168, temp_148), fma(0.0 - temp_148 + temp_153.x, temp_168, temp_148)) * fp_c4.data[16].x * temp_175 * temp_169);
            temp_179 = fma(fma(temp_2.y, fp_c5.data[34].y, fp_c5.data[35].y) * temp_113, 0.98, fma(temp_154, temp_171 + 0.0 - fma(0.0 - temp_149 + temp_153.y, temp_168, temp_149), fma(0.0 - temp_149 + temp_153.y, temp_168, temp_149)) * fp_c4.data[16].y * temp_175 * temp_174);
            temp_180 = fma(fma(temp_2.z, fp_c5.data[34].z, fp_c5.data[35].z) * temp_114, 0.98, fma(temp_154, temp_172 + 0.0 - fma(0.0 - temp_150 + temp_153.z, temp_168, temp_150), fma(0.0 - temp_150 + temp_153.z, temp_168, temp_150)) * fp_c4.data[16].z * temp_175 * temp_176);
            temp_181 = fma(temp_180, 0.1145, fma(temp_179, 0.5866, temp_178 * 0.298900008));
            temp_182 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
            temp_183 = floatBitsToInt(max(0.0, fma(0.0 - temp_179 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_181, fp_c4.data[31].y), fp_c4.data[32].w, temp_179)));
            if (!temp_182)
            {
                temp_183 = floatBitsToInt(fma(0.0 - temp_179 + in_attr7.y, temp_177, temp_179));
            }
            temp_184 = floatBitsToInt(max(0.0, fma(0.0 - temp_178 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_181, fp_c4.data[31].x), fp_c4.data[32].w, temp_178)));
            if (!temp_182)
            {
                temp_184 = floatBitsToInt(fma(0.0 - temp_178 + in_attr7.x, temp_177, temp_178));
            }
            temp_185 = floatBitsToInt(max(0.0, fma(0.0 - temp_180 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_181, fp_c4.data[31].z), fp_c4.data[32].w, temp_180)));
            if (!temp_182)
            {
                temp_185 = floatBitsToInt(fma(0.0 - temp_180 + in_attr7.z, temp_177, temp_180));
            }
            SV_Target0.x = intBitsToFloat(temp_184);
            SV_Target0.y = intBitsToFloat(temp_183);
            SV_Target0.z = intBitsToFloat(temp_185);
            SV_Target0.w = temp_10;
            // return; Yuzu crash
        }
    }

    if (!keep)
    {
        discard;
    }
}
