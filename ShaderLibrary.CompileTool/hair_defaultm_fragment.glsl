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
layout (binding = 1) uniform sampler2D g_textures_1_;
layout (binding = 0) uniform sampler2D g_textures_0_;
layout (binding = 3) uniform sampler2D g_textures_3_;
layout (binding = 4) uniform sampler2D g_textures_4_;
layout (location = 0) in vec4 in_attr0;
layout (location = 1) in vec4 in_attr1;
layout (location = 2) in vec4 in_attr2;
layout (location = 3) in vec4 in_attr3;
layout (location = 4) in vec4 in_attr4;
layout (location = 5) in vec4 in_attr5;
layout (location = 6) in vec4 in_attr6;
layout (location = 7) in vec4 in_attr7;
layout (location = 8) in vec4 in_attr8;

layout (location = 0) out vec4 SV_Target0;

void main()
{
    bool temp_0;
    precise float temp_1;
    precise float temp_2;
    precise float temp_3;
    precise float temp_4;
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
    bool temp_41;
    bool temp_42;
    precise float temp_43;
    precise float temp_44;
    precise float temp_45;
    precise float temp_46;
    precise float temp_47;
    precise float temp_48;
    bool temp_49;
    precise float temp_50;
    precise float temp_51;
    precise float temp_52;
    int temp_53;
    precise float temp_54;
    precise float temp_55;
    precise float temp_56;
    precise float temp_57;
    precise float temp_58;
    precise float temp_59;
    precise float temp_60;
    precise vec3 temp_61;
    precise float temp_62;
    precise float temp_63;
    precise float temp_64;
    precise float temp_65;
    precise float temp_66;
    precise vec3 temp_67;
    precise float temp_68;
    int temp_69;
    precise float temp_70;
    precise vec3 temp_71;
    precise vec4 temp_72;
    precise vec3 temp_73;
    precise float temp_74;
    precise float temp_75;
    int temp_76;
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
    int temp_111;
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
    bool temp_127;
    precise float temp_128;
    precise float temp_129;
    precise float temp_130;
    precise float temp_131;
    int temp_132;
    int temp_133;
    int temp_134;
    temp_0 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
    temp_1 = in_attr3.x;
    temp_2 = in_attr3.y;
    temp_3 = intBitsToFloat(undef);
    temp_4 = temp_2;
    if (temp_0)
    {
        temp_3 = in_attr5.x;
    }
    temp_5 = intBitsToFloat(undef);
    temp_6 = temp_3;
    if (temp_0)
    {
        temp_5 = in_attr5.y;
    }
    temp_7 = texture(g_textures_2_, vec2(temp_1, temp_2)).xy;
    if (temp_0)
    {
        temp_6 = texture(g_shadow_depth_textures_0_, vec2(temp_3, temp_5)).x;
    }
    temp_8 = in_attr4.x;
    temp_9 = in_attr4.y;
    temp_10 = in_attr4.z;
    temp_11 = inversesqrt(fma(temp_10, temp_10, fma(temp_9, temp_9, temp_8 * temp_8)));
    temp_12 = in_attr8.x;
    temp_13 = temp_8 * temp_11;
    temp_14 = temp_9 * temp_11;
    temp_15 = temp_10 * temp_11;
    temp_16 = in_attr8.y;
    temp_17 = fma(temp_7.y, 2.0, -1.0);
    temp_18 = fma(temp_7.x, 2.0, -1.0);
    temp_19 = in_attr8.z;
    temp_20 = temp_17 * 2.0 * temp_17 * temp_17;
    temp_21 = fma(temp_17, 1.5, temp_20);
    temp_22 = fma(temp_18, 1.5, temp_20);
    temp_23 = fma(temp_22, in_attr1.x, temp_21 * in_attr2.x) + in_attr0.x;
    temp_24 = fma(temp_22, in_attr1.y, temp_21 * in_attr2.y) + in_attr0.y;
    temp_25 = fma(temp_22, in_attr1.z, temp_21 * in_attr2.z) + in_attr0.z;
    temp_26 = inversesqrt(fma(temp_19, temp_19, fma(temp_16, temp_16, temp_12 * temp_12)));
    temp_27 = inversesqrt(fma(temp_25, temp_25, fma(temp_24, temp_24, temp_23 * temp_23)));
    temp_28 = temp_19 * temp_26;
    temp_29 = temp_12 * temp_26;
    temp_30 = temp_16 * temp_26;
    temp_31 = temp_23 * temp_27;
    temp_32 = temp_24 * temp_27;
    temp_33 = temp_25 * temp_27;
    temp_34 = fma(temp_33, temp_28, fma(temp_32, temp_30, temp_31 * temp_29));
    temp_35 = fma(temp_33, fp_c4.data[44].z, fma(temp_32, fp_c4.data[44].y, temp_31 * fp_c4.data[44].x));
    temp_36 = fma(temp_31, 0.0 - temp_34, temp_29);
    temp_37 = fma(temp_32, 0.0 - temp_34, temp_30);
    temp_38 = fma(temp_33, 0.0 - temp_34, temp_28);
    temp_39 = fma(temp_33, fp_c4.data[43].z, fma(temp_32, fp_c4.data[43].y, temp_31 * fp_c4.data[43].x));
    temp_40 = fma(temp_33, fp_c4.data[42].z, fma(temp_32, fp_c4.data[42].y, temp_31 * fp_c4.data[42].x));
    temp_41 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
    temp_42 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 7, 1)) == 1;
    temp_43 = temp_18;
    temp_44 = temp_22;
    temp_45 = temp_15;
    temp_46 = temp_33;
    if (temp_42)
    {
        temp_43 = in_attr3.z;
    }
    temp_47 = temp_43;
    if (temp_42)
    {
        temp_44 = in_attr3.w;
    }
    temp_48 = inversesqrt(fma(temp_38, temp_38, fma(temp_37, temp_37, temp_36 * temp_36)));
    temp_49 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 9, 1)) == 1;
    temp_50 = 1.0 / max(abs(temp_35), max(abs(temp_39), abs(temp_40)));
    temp_51 = temp_36 * temp_48;
    temp_52 = intBitsToFloat(undef);
    temp_53 = floatBitsToInt(temp_51);
    temp_54 = temp_44;
    temp_55 = temp_48;
    temp_56 = temp_50;
    if (temp_49)
    {
        temp_52 = in_attr3.w;
    }
    temp_57 = temp_37 * temp_48;
    temp_58 = temp_35 * temp_50;
    temp_59 = temp_40 * temp_50;
    temp_60 = temp_39 * temp_50;
    temp_61 = textureLod(g_ibl_textures_0_, vec3(temp_59, temp_60, temp_58), 1.0).xyz;
    temp_62 = temp_61.x;
    temp_63 = temp_61.y;
    temp_64 = temp_61.z;
    temp_65 = temp_60;
    if (temp_49)
    {
        temp_53 = floatBitsToInt(in_attr3.z);
    }
    temp_66 = temp_38 * temp_48;
    temp_67 = textureLod(g_ibl_textures_0_, vec3(temp_59, temp_60, temp_58), 0.0).xyz;
    temp_68 = intBitsToFloat(undef);
    temp_69 = temp_53;
    temp_70 = temp_66;
    if (temp_42)
    {
        temp_71 = texture(g_textures_1_, vec2(temp_43, temp_44)).xyz;
        temp_47 = temp_71.x;
        temp_54 = temp_71.y;
        temp_68 = temp_71.z;
    }
    temp_72 = texture(g_textures_0_, vec2(temp_1, temp_2)).xyzw;
    if (temp_41)
    {
        temp_73 = texture(g_textures_3_, vec2(temp_1, temp_2)).xyz;
        temp_55 = temp_73.x;
        temp_56 = temp_73.y;
        temp_4 = temp_73.z;
    }
    if (temp_49)
    {
        temp_69 = floatBitsToInt(texture(g_textures_4_, vec2(intBitsToFloat(temp_53), temp_52)).w);
    }
    temp_74 = fma(temp_33, temp_15, fma(temp_32, temp_14, temp_31 * temp_13));
    temp_75 = fma(temp_15, temp_66, fma(temp_14, temp_57, temp_13 * temp_51));
    temp_76 = temp_69;
    if (temp_0)
    {
        temp_45 = in_attr5.z;
    }
    temp_77 = fma(temp_66, fp_c4.data[26].z, fma(temp_57, fp_c4.data[26].y, temp_51 * fp_c4.data[26].x));
    temp_78 = temp_45;
    if (temp_0)
    {
        temp_70 = temp_31 * fp_c4.data[26].x;
    }
    if (temp_0)
    {
        temp_65 = fma(temp_32, fp_c4.data[26].y, temp_70);
    }
    temp_79 = fma(temp_75, temp_75, -1.01);
    temp_80 = fma(temp_77, temp_77, -1.01);
    temp_81 = inversesqrt(0.0 - temp_80);
    temp_82 = fma(temp_33, fp_c4.data[26].z, fma(temp_32, fp_c4.data[26].y, temp_31 * fp_c4.data[26].x));
    temp_83 = temp_79 * -inversesqrt(0.0 - temp_79);
    temp_84 = temp_79;
    temp_85 = temp_81;
    temp_86 = temp_80;
    if (temp_0)
    {
        temp_84 = fma(temp_33, fp_c4.data[26].z, temp_65);
    }
    temp_87 = temp_84;
    if (temp_0)
    {
        temp_78 = 0.0 - temp_45 + temp_6;
    }
    temp_88 = temp_80 * -temp_81;
    if (temp_0)
    {
        temp_87 = temp_84 + 1.0;
    }
    temp_89 = temp_87;
    if (temp_0)
    {
        temp_85 = temp_78 * fp_c4.data[45].x;
    }
    temp_90 = log2(clamp(fma(temp_88, temp_83, 0.0 - temp_77 * temp_75), 0.0, 1.0));
    temp_91 = temp_85;
    temp_92 = temp_90;
    if (temp_0)
    {
        temp_91 = temp_85 * fp_c5.data[30].w * 5.0; // Shadow improvement #1
    }
    if (temp_0)
    {
        temp_89 = min(temp_87, 1.0);
    }
    temp_93 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
    if (temp_0)
    {
        temp_86 = temp_91;
    }
    if (temp_0)
    {
        temp_46 = temp_89 * temp_89;
    }
    temp_94 = temp_46;
    if (temp_0)
    {
        temp_92 = exp2(temp_86);
    }
    temp_95 = temp_92;
    if (temp_0)
    {
        temp_94 = temp_46 * temp_46;
    }
    if (temp_0)
    {
        temp_95 = min(temp_92, 1.0);
    }
    temp_96 = clamp(fma(temp_82, 0.95, 0.05), 0.0, 1.0); // Shadow improvement #2
    temp_97 = temp_96;
    temp_98 = fp_c4.data[34].x;
    if (temp_0)
    {
        temp_97 = min(temp_94, temp_95);
    }
    temp_99 = temp_97;
    if (!temp_0)
    {
        temp_98 = 1.0;
    }
    temp_100 = temp_96 * exp2(temp_90 * fp_c5.data[38].x) * 0.180000007;
    temp_101 = temp_98;
    if (temp_0)
    {
        temp_101 = temp_97;
    }
    temp_102 = clamp((fma(fma(temp_33, fp_c4.data[33].z, fma(temp_32, fp_c4.data[33].y, temp_31 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
    temp_103 = exp2(log2(clamp(fma(temp_88, temp_83, 0.0 - temp_77 * -temp_75), 0.0, 1.0)) * fp_c5.data[38].x) * clamp(fma(temp_82, -0.7, 0.300000012), 0.0, 1.0) * 0.0500000007;
    if (!temp_0)
    {
        temp_99 = 1.0;
    }
    temp_104 = fma(temp_100 * fp_c4.data[27].x, temp_101, temp_103 * fp_c4.data[29].x) + fp_c5.data[34].w;
    temp_105 = fma(temp_100 * fp_c4.data[27].y, temp_101, temp_103 * fp_c4.data[29].y) + fp_c5.data[34].w;
    temp_106 = in_attr6.w;
    temp_107 = temp_104;
    temp_108 = temp_105;
    if (temp_41)
    {
        temp_107 = temp_104 * temp_55;
    }
    temp_109 = fma(temp_100 * fp_c4.data[27].z, temp_101, temp_103 * fp_c4.data[29].z) + fp_c5.data[34].w;
    temp_110 = temp_109;
    if (temp_41)
    {
        temp_108 = temp_105 * temp_56;
    }
    if (!temp_49)
    {
        temp_76 = floatBitsToInt(max(temp_72.w, fp_c5.data[39].w));
    }
    temp_111 = temp_76;
    if (temp_41)
    {
        temp_110 = temp_109 * temp_4;
    }
    if (temp_49)
    {
        temp_111 = floatBitsToInt(max(intBitsToFloat(temp_76), fp_c5.data[39].w));
    }
    temp_112 = fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * fma(temp_74, 0.0 - temp_74, 1) * in_attr7.w;
    temp_113 = fma(fma(temp_67.x + 0.0 - temp_62, temp_99, temp_62), fp_c4.data[14].x, temp_106) + fp_c4.data[15].x;
    temp_114 = fma(temp_88 * temp_88, 0.25, 0.75);
    temp_115 = temp_112 * fp_c4.data[28].x;
    temp_116 = temp_112 * fp_c4.data[28].y;
    temp_117 = temp_112 * fp_c4.data[28].z;
    temp_118 = fma(fma(temp_67.y + 0.0 - temp_63, temp_99, temp_63), fp_c4.data[14].y, temp_106) + fp_c4.data[15].y;
    temp_119 = fma(fma(temp_67.z + 0.0 - temp_64, temp_99, temp_64), fp_c4.data[14].z, temp_106) + fp_c4.data[15].z;
    temp_120 = temp_115;
    temp_121 = temp_116;
    temp_122 = temp_117;
    temp_123 = temp_113;
    temp_124 = temp_118;
    temp_125 = temp_119;
    if (temp_42)
    {
        temp_120 = temp_115 * temp_47;
    }
    if (temp_42)
    {
        temp_121 = temp_116 * temp_54;
    }
    if (temp_42)
    {
        temp_122 = temp_117 * temp_68;
    }
    if (temp_93)
    {
        temp_123 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_102, fp_c4.data[34].x), fp_c4.data[36].z, temp_113);
    }
    if (temp_93)
    {
        temp_124 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_102, fp_c4.data[34].y), fp_c4.data[36].z, temp_118);
    }
    if (temp_93)
    {
        temp_125 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_102, fp_c4.data[34].z), fp_c4.data[36].z, temp_119);
    }
    temp_126 = fma(temp_107, fp_c5.data[32].x, fma(temp_114, temp_72.x * fp_c5.data[34].x * temp_123, temp_101 * 0.5 * temp_120));
    temp_127 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
    temp_128 = fma(temp_108, fp_c5.data[32].y, fma(temp_114, temp_72.y * fp_c5.data[34].x * temp_124, temp_101 * 0.5 * temp_121));
    temp_129 = fma(temp_110, fp_c5.data[32].z, fma(temp_114, temp_72.z * fp_c5.data[34].x * temp_125, temp_101 * 0.5 * temp_122));

    temp_130 = in_attr5.w;
    temp_131 = fma(temp_129, 0.1145, fma(temp_128, 0.5866, temp_126 * 0.298900008));
    temp_132 = floatBitsToInt(max(0.0, fma(0.0 - temp_126 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_131, fp_c4.data[31].x), fp_c4.data[32].w, temp_126)));
    temp_133 = floatBitsToInt(max(0.0, fma(0.0 - temp_128 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_131, fp_c4.data[31].y), fp_c4.data[32].w, temp_128)));
    if (!temp_127)
    {
        temp_132 = floatBitsToInt(fma(0.0 - temp_126 + in_attr7.x, temp_130, temp_126));
    }
    temp_134 = floatBitsToInt(max(0.0, fma(0.0 - temp_129 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_131, fp_c4.data[31].z), fp_c4.data[32].w, temp_129)));
    if (!temp_127)
    {
        temp_133 = floatBitsToInt(fma(0.0 - temp_128 + in_attr7.y, temp_130, temp_128));
    }
    if (!temp_127)
    {
        temp_134 = floatBitsToInt(fma(0.0 - temp_129 + in_attr7.z, temp_130, temp_129));
    }
    SV_Target0.x = intBitsToFloat(temp_132);
    SV_Target0.y = intBitsToFloat(temp_133);
    SV_Target0.z = intBitsToFloat(temp_134);
    SV_Target0.w = intBitsToFloat(temp_111);
    // return; Yuzu crash;
}
