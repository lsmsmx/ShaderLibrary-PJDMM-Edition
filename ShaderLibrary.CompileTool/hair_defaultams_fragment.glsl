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

layout(binding = 4) uniform sampler2D g_textures_4_;
layout(binding = 0) uniform sampler2D g_textures_0_;
layout(binding = 2) uniform sampler2D g_textures_2_;
layout(binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout(binding = 9) uniform samplerCube g_ibl_textures_0_;
layout(binding = 1) uniform sampler2D g_textures_1_;
layout(binding = 3) uniform sampler2D g_textures_3_;
layout(location = 0) in vec4 in_attr0;
layout(location = 1) in vec4 in_attr1;
layout(location = 2) in vec4 in_attr2;
layout(location = 3) in vec4 in_attr3;
layout(location = 4) in vec4 in_attr4;
layout(location = 5) in vec4 in_attr5;
layout(location = 6) in vec4 in_attr6;
layout(location = 7) in vec4 in_attr7;
layout(location = 8) in vec4 in_attr8;

layout(location = 0) out vec4 SV_Target0;

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
    precise vec4 temp_8;
    precise float temp_9;
    precise float temp_10;
    precise vec2 temp_11;
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
    bool temp_37;
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
    precise vec3 temp_64;
    precise float temp_65;
    precise float temp_66;
    precise float temp_67;
    precise vec3 temp_68;
    precise float temp_69;
    precise float temp_70;
    precise vec3 temp_71;
    precise float temp_72;
    precise float temp_73;
    precise vec3 temp_74;
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
    bool temp_103;
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
    bool temp_129;
    precise float temp_130;
    precise float temp_131;
    precise float temp_132;
    precise float temp_133;
    precise float temp_134;
    int temp_135;
    int temp_136;
    int temp_137;
    temp_0 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 9, 1)) == 1;
    temp_1 = intBitsToFloat(undef);
    if(temp_0) {
        temp_1 = in_attr3.z;
    }
    temp_2 = intBitsToFloat(undef);
    if(temp_0) {
        temp_2 = in_attr3.w;
    }
    temp_3 = in_attr3.x;
    temp_4 = in_attr3.y;
    temp_5 = intBitsToFloat(undef);
    temp_6 = temp_3;
    temp_7 = temp_4;
    if(temp_0) {
        temp_5 = texture(g_textures_4_, vec2(temp_1, temp_2)).w;
    }
    temp_8 = texture(g_textures_0_, vec2(temp_3, temp_4)).xyzw;
    temp_9 = temp_5;
    if(temp_0) {
        temp_9 = max(temp_5, fp_c5.data[39].w);
    }
    temp_10 = temp_9;
    if(!temp_0) {
        temp_10 = max(temp_8.w, fp_c5.data[39].w);
    }
    if((temp_10 != 1.0 || isnan(temp_10) || isnan(1.0)) && temp_10 <= fp_c5.data[39].z) {
        //discard // Yuzu crash;
        keep = false;
    } else {
        temp_11 = texture(g_textures_2_, vec2(temp_3, temp_4)).xy;
        temp_12 = in_attr4.x;
        temp_13 = in_attr4.y;
        temp_14 = in_attr4.z;
        temp_15 = inversesqrt(fma(temp_14, temp_14, fma(temp_13, temp_13, temp_12 * temp_12)));
        temp_16 = temp_13 * temp_15;
        temp_17 = temp_14 * temp_15;
        temp_18 = temp_12 * temp_15;
        temp_19 = fma(temp_11.y, 2.0, -1.0);
        temp_20 = in_attr8.x;
        temp_21 = in_attr8.z;
        temp_22 = temp_19 * 2.0 * temp_19 * temp_19;
        temp_23 = in_attr8.y;
        temp_24 = fma(temp_19, 1.5, temp_22);
        temp_25 = fma(fma(temp_11.x, 2.0, -1.0), 1.5, temp_22);
        temp_26 = fma(temp_25, in_attr1.y, temp_24 * in_attr2.y) + in_attr0.y;
        temp_27 = fma(temp_25, in_attr1.z, temp_24 * in_attr2.z) + in_attr0.z;
        temp_28 = fma(temp_25, in_attr1.x, temp_24 * in_attr2.x) + in_attr0.x;
        temp_29 = fma(temp_21, temp_21, fma(temp_23, temp_23, temp_20 * temp_20));
        temp_30 = inversesqrt(fma(temp_27, temp_27, fma(temp_26, temp_26, temp_28 * temp_28)));
        temp_31 = temp_21 * inversesqrt(temp_29);
        temp_32 = temp_20 * inversesqrt(temp_29);
        temp_33 = temp_23 * inversesqrt(temp_29);
        temp_34 = temp_28 * temp_30;
        temp_35 = temp_26 * temp_30;
        temp_36 = temp_27 * temp_30;
        temp_37 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1)) != 0;
        temp_38 = temp_29;
        temp_39 = temp_16;
        if(temp_37) {
            temp_38 = in_attr5.x;
        }
        temp_40 = intBitsToFloat(undef);
        temp_41 = temp_38;
        if(temp_37) {
            temp_40 = in_attr5.y;
        }
        temp_42 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 7, 1)) == 1;
        temp_43 = fma(temp_35, fp_c4.data[42].y, temp_34 * fp_c4.data[42].x);
        temp_44 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].w), 14, 1)) == 1;
        temp_45 = fma(temp_36, temp_31, fma(temp_35, temp_33, temp_34 * temp_32));
        temp_46 = fma(temp_36, fp_c4.data[42].z, temp_43);
        temp_47 = temp_43;
        if(temp_42) {
            temp_47 = in_attr3.z;
        }
        temp_48 = fma(temp_34, 0.0 - temp_45, temp_32);
        temp_49 = fma(temp_35, 0.0 - temp_45, temp_33);
        temp_50 = fma(temp_36, 0.0 - temp_45, temp_31);
        temp_51 = fma(temp_36, fp_c4.data[43].z, fma(temp_35, fp_c4.data[43].y, temp_34 * fp_c4.data[43].x));
        temp_52 = temp_47;
        if(temp_37) {
            temp_41 = texture(g_shadow_depth_textures_0_, vec2(temp_38, temp_40)).x;
        }
        temp_53 = fma(temp_36, fp_c4.data[44].z, fma(temp_35, fp_c4.data[44].y, temp_34 * fp_c4.data[44].x));
        temp_54 = inversesqrt(fma(temp_50, temp_50, fma(temp_49, temp_49, temp_48 * temp_48)));
        temp_55 = 1.0 / max(abs(temp_53), max(abs(temp_46), abs(temp_51)));
        temp_56 = temp_48 * temp_54;
        temp_57 = temp_49 * temp_54;
        temp_58 = temp_53 * temp_55;
        temp_59 = temp_53;
        temp_60 = temp_58;
        if(temp_42) {
            temp_59 = in_attr3.w;
        }
        temp_61 = temp_46 * temp_55;
        temp_62 = temp_51 * temp_55;
        temp_63 = temp_50 * temp_54;
        temp_64 = textureLod(g_ibl_textures_0_, vec3(temp_61, temp_62, temp_58), 1.0).xyz;
        temp_65 = temp_64.x;
        temp_66 = temp_64.y;
        temp_67 = temp_64.z;
        temp_68 = textureLod(g_ibl_textures_0_, vec3(temp_61, temp_62, temp_58), 0.0).xyz;
        temp_69 = temp_59;
        temp_70 = intBitsToFloat(undef);
        if(temp_42) {
            temp_71 = texture(g_textures_1_, vec2(temp_47, temp_59)).xyz;
            temp_52 = temp_71.x;
            temp_69 = temp_71.y;
            temp_70 = temp_71.z;
        }
        temp_72 = intBitsToFloat(undef);
        temp_73 = temp_69;
        if(temp_44) {
            temp_74 = texture(g_textures_3_, vec2(temp_3, temp_4)).xyz;
            temp_6 = temp_74.y;
            temp_72 = temp_74.z;
            temp_7 = temp_74.x;
        }
        temp_75 = fma(temp_63, fp_c4.data[26].z, fma(temp_57, fp_c4.data[26].y, temp_56 * fp_c4.data[26].x));
        temp_76 = fma(temp_17, temp_63, fma(temp_16, temp_57, temp_18 * temp_56));
        if(temp_37) {
            temp_60 = temp_34 * fp_c4.data[26].x;
        }
        temp_77 = temp_60;
        if(temp_37) {
            temp_39 = in_attr5.z;
        }
        temp_78 = fma(temp_75, temp_75, -1.01);
        temp_79 = fma(temp_76, temp_76, -1.01);
        temp_80 = fma(temp_36, temp_17, fma(temp_35, temp_16, temp_34 * temp_18));
        temp_81 = temp_78;
        temp_82 = temp_39;
        temp_83 = temp_79;
        if(temp_37) {
            temp_77 = fma(temp_35, fp_c4.data[26].y, temp_60);
        }
        temp_84 = temp_77;
        if(temp_37) {
            temp_84 = fma(temp_36, fp_c4.data[26].z, temp_77);
        }
        temp_85 = temp_78 * -inversesqrt(0.0 - temp_78);
        temp_86 = temp_79 * -inversesqrt(0.0 - temp_79);
        if(temp_37) {
            temp_81 = temp_84 + 1.0;
        }
        temp_87 = log2(clamp(fma(temp_85, temp_86, 0.0 - temp_75 * temp_76), 0.0, 1.0));
        temp_88 = temp_81;
        temp_89 = temp_87;
        if(temp_37) {
            temp_88 = min(temp_81, 1.0);
        }
        temp_90 = temp_88;
        if(temp_37) {
            temp_90 = temp_88 * temp_88;
        }
        temp_91 = temp_90;
        if(temp_37) {
            temp_91 = temp_90 * temp_90;
        }
        if(temp_37) {
            temp_82 = 0.0 - temp_39 + temp_41;
        }
        temp_92 = temp_82;
        if(!temp_37) {
            temp_89 = 1.0;
        }
        temp_93 = temp_89;
        if(temp_37) {
            temp_92 = temp_82 * fp_c4.data[45].x;
        }
        temp_94 = temp_92;
        if(temp_37) {
            temp_94 = temp_92 * fp_c5.data[30].w * 5.0; // Shadow improvement #1
        }
        if(temp_37) {
            temp_83 = temp_94;
        }
        temp_95 = fma(temp_36, fp_c4.data[26].z, fma(temp_35, fp_c4.data[26].y, temp_34 * fp_c4.data[26].x));
        if(temp_37) {
            temp_93 = exp2(temp_83);
        }
        temp_96 = clamp(fma(temp_95, 0.95, 0.05), 0.0, 1.0); // Shadow improvement #2
        temp_97 = temp_93;
        temp_98 = temp_96;
        if(temp_37) {
            temp_97 = min(temp_93, 1.0);
        }
        temp_99 = temp_97;
        if(!temp_37) {
            temp_98 = 1.0;
        }
        temp_100 = temp_98;
        if(temp_37) {
            temp_100 = min(temp_91, temp_97);
        }
        temp_101 = temp_96 * exp2(temp_87 * fp_c5.data[38].x) * 0.180000007;
        temp_102 = exp2(log2(clamp(fma(temp_85, temp_86, 0.0 - temp_75 * -temp_76), 0.0, 1.0)) * fp_c5.data[38].x) * clamp(fma(temp_95, -0.7, 0.300000012), 0.0, 1.0) * 0.0500000007;
        if(temp_37) {
            temp_99 = temp_100;
        }
        temp_103 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
        temp_104 = clamp((fma(fma(temp_36, fp_c4.data[33].z, fma(temp_35, fp_c4.data[33].y, temp_34 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
        temp_105 = fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * fma(temp_80, 0.0 - temp_80, 1) * in_attr7.w;
        temp_106 = in_attr6.w;
        temp_107 = temp_105 * fp_c4.data[28].x;
        temp_108 = fma(temp_101 * fp_c4.data[27].y, temp_99, temp_102 * fp_c4.data[29].y) + fp_c5.data[34].w;
        temp_109 = fma(temp_101 * fp_c4.data[27].z, temp_99, temp_102 * fp_c4.data[29].z) + fp_c5.data[34].w;
        temp_110 = temp_107;
        temp_111 = temp_108;
        temp_112 = temp_109;
        if(temp_42) {
            temp_110 = temp_52 * temp_107;
        }
        temp_113 = fma(temp_104, 0.0 - fp_c4.data[34].y + fp_c4.data[35].y, fp_c4.data[34].y);
        temp_114 = temp_105 * fp_c4.data[28].y;
        temp_115 = temp_114;
        temp_116 = temp_113;
        if(temp_44) {
            temp_111 = temp_6 * temp_108;
        }
        if(temp_44) {
            temp_112 = temp_109 * temp_72;
        }
        if(temp_42) {
            temp_115 = temp_69 * temp_114;
        }
        temp_117 = fma(fma(temp_68.x + 0.0 - temp_65, temp_100, temp_65), fp_c4.data[14].x, temp_106) + fp_c4.data[15].x;
        temp_118 = fma(fma(temp_68.y + 0.0 - temp_66, temp_100, temp_66), fp_c4.data[14].y, temp_106) + fp_c4.data[15].y;
        temp_119 = fma(fma(temp_68.z + 0.0 - temp_67, temp_100, temp_67), fp_c4.data[14].z, temp_106) + fp_c4.data[15].z;
        temp_120 = temp_117;
        if(!temp_103) {
            temp_116 = temp_117;
        }
        temp_121 = fma(temp_85 * temp_85, 0.25, 0.75);
        temp_122 = temp_116;
        if(!temp_103) {
            temp_73 = temp_118;
        }
        temp_123 = temp_73;
        if(!temp_103) {
            temp_120 = temp_119;
        }
        temp_124 = temp_120;
        if(temp_103) {
            temp_122 = fma(fma(temp_104, 0.0 - fp_c4.data[34].x + fp_c4.data[35].x, fp_c4.data[34].x), fp_c4.data[36].z, temp_117);
        }
        temp_125 = temp_105 * fp_c4.data[28].z;
        temp_126 = temp_125;
        if(temp_103) {
            temp_123 = fma(temp_113, fp_c4.data[36].z, temp_118);
        }
        temp_127 = fma(temp_101 * fp_c4.data[27].x, temp_99, temp_102 * fp_c4.data[29].x) + fp_c5.data[34].w;
        temp_128 = temp_127;
        if(temp_42) {
            temp_126 = temp_70 * temp_125;
        }
        if(temp_103) {
            temp_124 = fma(fma(temp_104, 0.0 - fp_c4.data[34].z + fp_c4.data[35].z, fp_c4.data[34].z), fp_c4.data[36].z, temp_119);
        }
        if(temp_44) {
            temp_128 = temp_7 * temp_127;
        }
        temp_129 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1;
        temp_130 = fma(temp_128, fp_c5.data[32].x, fma(temp_121, temp_8.x * fp_c5.data[34].x * temp_122, temp_110 * 0.5 * temp_99));
        temp_131 = fma(temp_111, fp_c5.data[32].y, fma(temp_121, temp_8.y * fp_c5.data[34].x * temp_123, temp_115 * 0.5 * temp_99));
        temp_132 = fma(temp_112, fp_c5.data[32].z, fma(temp_121, temp_8.z * fp_c5.data[34].x * temp_124, temp_126 * 0.5 * temp_99));

        temp_133 = in_attr5.w;
        temp_134 = fma(temp_132, 0.1145, fma(temp_131, 0.5866, temp_130 * 0.298900008));
        temp_135 = floatBitsToInt(max(0.0, fma(0.0 - temp_130 + fma(fp_c4.data[32].x + 0.0 - fp_c4.data[31].x, temp_134, fp_c4.data[31].x), fp_c4.data[32].w, temp_130)));
        temp_136 = floatBitsToInt(max(0.0, fma(0.0 - temp_131 + fma(fp_c4.data[32].y + 0.0 - fp_c4.data[31].y, temp_134, fp_c4.data[31].y), fp_c4.data[32].w, temp_131)));
        if(!temp_129) {
            temp_135 = floatBitsToInt(fma(0.0 - temp_130 + in_attr7.x, temp_133, temp_130));
        }
        temp_137 = floatBitsToInt(max(0.0, fma(0.0 - temp_132 + fma(fp_c4.data[32].z + 0.0 - fp_c4.data[31].z, temp_134, fp_c4.data[31].z), fp_c4.data[32].w, temp_132)));
        if(!temp_129) {
            temp_136 = floatBitsToInt(fma(0.0 - temp_131 + in_attr7.y, temp_133, temp_131));
        }
        if(!temp_129) {
            temp_137 = floatBitsToInt(fma(0.0 - temp_132 + in_attr7.z, temp_133, temp_132));
        }
        SV_Target0.x = intBitsToFloat(temp_135);
        SV_Target0.y = intBitsToFloat(temp_136);
        SV_Target0.z = intBitsToFloat(temp_137);
        SV_Target0.w = temp_10;
         // return; Yuzu crash;
    }
    if (!keep) {
        discard;
    }
}
