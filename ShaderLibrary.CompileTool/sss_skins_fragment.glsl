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

layout(binding = 0, std140) uniform _Shader {
    precise vec4 data[4096];
} fp_c3;

layout(binding = 1, std140) uniform _Scene {
    precise vec4 data[4096];
} fp_c4;

layout(binding = 2, std140) uniform _Batch {
    precise vec4 data[4096];
} fp_c5;

layout(binding = 19) uniform sampler2D g_shadow_depth_textures_0_;
layout(binding = 3) uniform sampler2D g_textures_3_;
layout(binding = 9) uniform samplerCube g_ibl_textures_0_;
layout(location = 0) in vec4 in_attr0;
layout(location = 1) in vec4 in_attr1;
layout(location = 2) in vec4 in_attr2;
layout(location = 3) in vec4 in_attr3;
layout(location = 4) in vec4 in_attr4;

layout(location = 0) out vec4 SV_Target0;

void main() {
    int temp_0;
    bool temp_1;
    precise float temp_2;
    precise float temp_3;
    precise float temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    int temp_9;
    int temp_10;
    int temp_11;
    bool temp_12;
    precise float temp_13;
    precise float temp_14;
    precise float temp_15;
    precise float temp_16;
    int temp_17;
    int temp_18;
    bool temp_19;
    int temp_20;
    int temp_21;
    int temp_22;
    int temp_23;
    int temp_24;
    int temp_25;
    int temp_26;
    precise float temp_27;
    precise float temp_28;
    int temp_29;
    precise float temp_30;
    precise float temp_31;
    precise float temp_32;
    uint temp_33;
    bool temp_34;
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
    precise vec3 temp_47;
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
    precise vec3 temp_73;
    precise float temp_74;
    precise float temp_75;
    precise float temp_76;
    precise float temp_77;
    precise float temp_78;
    bool temp_79;
    precise float temp_80;
    bool temp_81;
    precise float temp_82;
    precise float temp_83;
    precise float temp_84;
    precise float temp_85;
    bool temp_86;
    precise float temp_87;
    precise float temp_88;
    precise float temp_89;
    precise float temp_90;
    precise float temp_91;
    precise vec3 temp_92;
    precise float temp_93;
    precise float temp_94;
    precise float temp_95;
    precise float temp_96;
    precise float temp_97;
    precise float temp_98;
    precise float temp_99;
    precise float temp_100;
    precise vec3 temp_101;
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
    int temp_115;
    precise float temp_116;
    bool temp_117;
    precise float temp_118;
    int temp_119;
    precise float temp_120;
    precise float temp_121;
    precise float temp_122;
    int temp_123;
    int temp_124;
    int temp_125;
    int temp_126;
    int temp_127;
    temp_19 = false;
    temp_0 = 1 & floatBitsToInt(fp_c3.data[0].z);
    temp_1 = temp_0 == 1;
    temp_2 = in_attr0.x;
    temp_3 = in_attr0.y;
    temp_4 = in_attr0.z;

    // prevent from NaN crash on zero-length normals;
    temp_5 = inversesqrt(fma(temp_4, temp_4, fma(temp_3, temp_3, temp_2 * temp_2)) + 0.000001);

    temp_6 = temp_2 * temp_5;
    temp_7 = temp_3 * temp_5;
    temp_8 = temp_4 * temp_5;
    temp_9 = 1;
    temp_10 = 0;
    temp_11 = 0;
    if(temp_1) {
        temp_12 = fp_c5.data[30].w < 0.15;
        temp_13 = intBitsToFloat(undef);
        if(temp_12) {
            temp_13 = 100.0;
        }
        temp_14 = int(floatBitsToUint(fp_c3.data[0].y) >> 31) == 1 ? 1.0 : 0.0;
        temp_15 = temp_13;
        temp_16 = temp_14;
        if(!temp_12) {
            temp_15 = fma(temp_8, fp_c4.data[58].z, fma(temp_7, fp_c4.data[58].y, temp_6 * fp_c4.data[58].x)) + 2.0;
        }
        temp_17 = floatBitsToInt((fma(temp_8, fp_c4.data[59].z, fma(temp_7, fp_c4.data[59].y, temp_6 * fp_c4.data[59].x)) + 2.0) * temp_14);
        temp_18 = floatBitsToInt(temp_14 * temp_15);
        temp_19 = !(int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].x), 10, 1)) == 1);
        if(!temp_19) {
            temp_16 = fp_c4.data[31].y + 0.0 - fp_c4.data[32].y;
            temp_9 = 0;
            temp_10 = 0x42C80000;
            temp_11 = 0x3F800000;
            temp_19 = true;
        }
    } else {
        temp_17 = 0;
        temp_18 = 0;
        temp_16 = intBitsToFloat(undef);
    }
    temp_19 = false;
    temp_20 = 0;
    temp_21 = temp_10;
    temp_22 = temp_9;
    temp_23 = 0;
    temp_24 = temp_10;
    temp_25 = 0;
    temp_26 = temp_11;
    temp_27 = temp_16;
    if(!(temp_9 != 0)) {
        SV_Target0.x = 0.0;
        SV_Target0.y = intBitsToFloat(temp_10);
        SV_Target0.z = 0.0;
        SV_Target0.w = intBitsToFloat(temp_11);
        // return; This causes crash on yuzu;
    } else {
        temp_28 = fp_c3.data[0].w;
        if(!((floatBitsToInt(fp_c3.data[0].w) & 1) != 0)) {
            if(temp_1) {
                temp_20 = temp_17;
            }
            temp_29 = temp_20;
            if(temp_1) {
                temp_21 = temp_18;
            }
            temp_22 = 0;
            temp_23 = floatBitsToInt(fp_c5.data[41].x);
            temp_24 = temp_21;
            temp_26 = 0x3C23D70A;
            if(!temp_1) {
                temp_29 = floatBitsToInt(fp_c5.data[41].z);
            }
            temp_25 = temp_29;
            if(!temp_1) {
                temp_24 = floatBitsToInt(fp_c5.data[41].y);
            }
        }
        temp_30 = intBitsToFloat(temp_24);
        temp_31 = intBitsToFloat(temp_25);
        temp_32 = intBitsToFloat(temp_26);
        if(!(temp_22 != 0)) {
            SV_Target0.x = intBitsToFloat(temp_23);
            SV_Target0.y = intBitsToFloat(temp_24);
            SV_Target0.z = intBitsToFloat(temp_25);
            SV_Target0.w = intBitsToFloat(temp_26);
            // return; This causes crash on yuzu;
        } else {
            temp_33 = bitfieldExtract(floatBitsToUint(fp_c3.data[0].z), 9, 1);
            temp_34 = int(temp_33) != 0;
            temp_35 = uintBitsToFloat(temp_33);
            if(temp_34) {
                temp_30 = in_attr2.x;
            }
            temp_36 = temp_30;
            if(temp_34) {
                temp_31 = in_attr2.y;
            }
            if(temp_34) {
                temp_36 = texture(g_shadow_depth_textures_0_, vec2(temp_30, temp_31)).x;
            }
            temp_37 = temp_36;
            if(temp_34) {
                temp_32 = in_attr2.z;
            }
            temp_38 = temp_32;
            if(temp_34) {
                temp_35 = temp_6 * fp_c4.data[26].x;
            }
            temp_39 = intBitsToFloat(undef);
            temp_40 = temp_35;
            if(!temp_34) {
                temp_39 = 1.0;
            }
            temp_41 = temp_39;
            if(temp_34) {
                temp_40 = fma(temp_7, fp_c4.data[26].y, temp_35);
            }
            temp_42 = fma(temp_7, fp_c4.data[42].y, temp_6 * fp_c4.data[42].x);
            temp_43 = temp_40;
            temp_44 = temp_42;
            if(temp_34) {
                temp_43 = fma(temp_8, fp_c4.data[26].z, temp_40);
            }
            temp_45 = temp_43;
            if(temp_34) {
                temp_45 = temp_43 + 1.0;
            }
            temp_46 = temp_45;
            if(temp_34) {
                temp_46 = min(temp_45, 1.0);
            }
            temp_47 = texture(g_textures_3_, vec2(in_attr1.x, in_attr1.y)).yzw;
            temp_48 = temp_47.x;
            temp_49 = temp_47.y;
            temp_50 = temp_47.z;
            temp_51 = temp_46;
            temp_52 = temp_48;
            temp_53 = temp_49;
            temp_54 = temp_48;
            temp_55 = temp_49;
            if(temp_34) {
                temp_51 = temp_46 * temp_46;
            }
            temp_56 = temp_51;
            if(temp_34) {
                temp_56 = temp_51 * temp_51;
            }
            if(temp_34) {
                temp_38 = 0.0 - temp_32 + temp_36;
            }
            temp_57 = temp_38;
            if(temp_34) {
                temp_57 = temp_38 * fp_c4.data[45].x;
            }
            temp_58 = temp_57;
            if(temp_34) {
                temp_58 = temp_57 * fp_c5.data[30].w * 2.5; // Shadow improvement #1
            }
            temp_59 = temp_58;
            if(temp_34) {
                temp_28 = temp_58;
            }
            temp_60 = temp_28;
            if(temp_34) {
                temp_37 = exp2(temp_28);
            }
            temp_61 = temp_37;
            if(temp_34) {
                temp_61 = min(temp_37, 1.0);
            }
            if(temp_34) {
                temp_41 = min(temp_61, temp_56);
            }
            temp_62 = temp_41 == 1.0;
            temp_63 = fma(temp_8, fp_c4.data[42].z, temp_42);
            if(temp_34) {
                temp_59 = temp_41;
            }
            temp_64 = fma(temp_8, fp_c4.data[43].z, fma(temp_7, fp_c4.data[43].y, temp_6 * fp_c4.data[43].x));
            temp_65 = fma(temp_8, fp_c4.data[44].z, fma(temp_7, fp_c4.data[44].y, temp_6 * fp_c4.data[44].x));
            temp_66 = temp_59;
            if(temp_62) {
                temp_44 = max(abs(temp_64), abs(temp_63));
            }
            temp_67 = intBitsToFloat(undef);
            temp_68 = temp_44;
            if(temp_62) {
                temp_67 = max(abs(temp_65), temp_44);
            }
            temp_69 = temp_67;
            if(temp_62) {
                temp_69 = 1.0 / temp_67;
            }
            if(temp_62) {
                temp_68 = temp_63 * temp_69;
            }
            temp_70 = temp_68;
            if(temp_62) {
                temp_60 = temp_64 * temp_69;
            }
            temp_71 = temp_60;
            if(temp_62) {
                temp_27 = temp_65 * temp_69;
            }
            temp_72 = temp_27;
            if(temp_62) {
                temp_73 = textureLod(g_ibl_textures_0_, vec3(temp_68, temp_60, temp_27), 0.0).xyz;
                temp_71 = temp_73.y;
                temp_72 = temp_73.z;
                temp_70 = temp_73.x;
            }
            temp_74 = temp_71;
            temp_75 = fp_c3.data[0].y;
            temp_76 = temp_72;
            temp_77 = temp_71;
            temp_78 = temp_70;
            if(!temp_34) {
                temp_66 = 1.0;
            }
            temp_79 = temp_0 != 1;
            temp_80 = in_attr3.w;
            temp_81 = int(bitfieldExtract(floatBitsToUint(fp_c3.data[0].y), 12, 1)) == 1;
            temp_82 = fma(temp_50 * temp_66, 1.0, 0.0) * in_attr4.w; // Shadow improvement #2
            temp_83 = temp_82;
            temp_84 = temp_82;
            temp_85 = fp_c4.data[14].y;
            if(!temp_62) {
                temp_86 = temp_41 == 0.0;
                temp_87 = max(abs(temp_65), max(abs(temp_64), abs(temp_63)));
                temp_88 = 1.0 / temp_87;
                temp_89 = temp_63 * temp_88;
                temp_90 = temp_64 * temp_88;
                temp_91 = temp_65 * temp_88;
                temp_92 = textureLod(g_ibl_textures_0_, vec3(temp_89, temp_90, temp_91), 1.0).xyz;
                temp_93 = temp_92.x;
                temp_94 = temp_92.y;
                temp_95 = temp_92.z;
                temp_96 = temp_89;
                temp_97 = temp_90;
                temp_98 = temp_91;
                temp_99 = temp_87;
                temp_100 = temp_93;
                if(!temp_86) {
                    temp_101 = textureLod(g_ibl_textures_0_, vec3(temp_89, temp_90, temp_91), 0.0).xyz;
                    temp_96 = temp_101.x;
                    temp_97 = temp_101.y;
                    temp_98 = temp_101.z;
                }
                if(temp_86) {
                    temp_99 = temp_93;
                }
                temp_102 = temp_99;
                if(!temp_86) {
                    temp_74 = temp_96 + 0.0 - temp_93;
                }
                temp_103 = temp_74;
                if(!temp_86) {
                    temp_75 = temp_97 + 0.0 - temp_94;
                }
                temp_104 = intBitsToFloat(undef);
                if(!temp_86) {
                    temp_104 = temp_98 + 0.0 - temp_95;
                }
                if(!temp_86) {
                    temp_83 = temp_93;
                }
                temp_84 = temp_83;
                if(temp_86) {
                    temp_103 = temp_94;
                }
                temp_105 = temp_103;
                if(temp_86) {
                    temp_100 = temp_95;
                }
                temp_106 = temp_100;
                if(!temp_86) {
                    temp_102 = fma(temp_103, temp_41, temp_100);
                }
                temp_78 = temp_102;
                if(!temp_86) {
                    temp_105 = fma(temp_75, temp_41, temp_94);
                }
                temp_77 = temp_105;
                if(!temp_86) {
                    temp_52 = temp_94;
                }
                temp_54 = temp_52;
                if(!temp_86) {
                    temp_53 = temp_95;
                }
                temp_55 = temp_53;
                if(!temp_86) {
                    temp_106 = fma(temp_104, temp_41, temp_95);
                }
                temp_76 = temp_106;
            }

            // restore correctly blended cubemap; supposedly fix red eyes and less dark shadow, by not letting it get junky;
            temp_84 = temp_78;
            temp_54 = temp_77;
            temp_55 = temp_76;

            temp_107 = clamp((fma(fma(temp_8, fp_c4.data[33].z, fma(temp_7, fp_c4.data[33].y, temp_6 * fp_c4.data[33].x)), 0.5, 0.0 - fp_c4.data[36].x) + 0.5) * fp_c4.data[36].y, 0.0, 1.0);
            temp_108 = fp_c4.data[14].x;
            temp_109 = fp_c4.data[34].y;
            temp_110 = temp_54;
            temp_111 = temp_55;
            temp_112 = temp_84;
            if(temp_79) {
                temp_85 = fma(temp_76, fp_c4.data[14].z, fp_c4.data[15].z);
            }
            temp_113 = temp_85;
            if(temp_79) {
                temp_108 = fma(temp_77, fp_c4.data[14].y, fp_c4.data[15].y);
            }
            temp_114 = temp_108;
            if(!temp_79) {
                temp_113 = temp_76;
            }
            if(!temp_79) {
                temp_114 = temp_77;
            }
            temp_115 = floatBitsToInt(temp_114);
            if(temp_79) {
                temp_109 = fma(temp_78, fp_c4.data[14].x, fp_c4.data[15].x);
            }
            temp_116 = temp_109;
            if(!temp_79) {
                temp_116 = temp_78;
            }
            temp_117 = temp_50 > 0.99;
            if(temp_81) {
                temp_110 = fma(fma(0.0 - fp_c4.data[34].y + fp_c4.data[35].y, temp_107, fp_c4.data[34].y), fp_c4.data[36].z, 0.0);
            }
            else {
                temp_110 = 0.0; // green, prevent from glow
            }
            temp_118 = fma(fma(0.0 - fp_c4.data[34].x + fp_c4.data[35].x, temp_107, fp_c4.data[34].x), fp_c4.data[36].z, 0.0);
            temp_119 = floatBitsToInt(temp_118);
            if(temp_81) {
                temp_111 = fma(fma(0.0 - fp_c4.data[34].z + fp_c4.data[35].z, temp_107, fp_c4.data[34].z), fp_c4.data[36].z, 0.0);
            }
            else {
                temp_111 = 0.0; // blue,prevent from glow
            }
            temp_120 = fma(temp_82, fp_c4.data[28].z, temp_113) + temp_80;
            temp_121 = fma(temp_82 * fp_c4.data[28].y, 0.9, temp_114) + temp_80;
            temp_122 = fma(temp_82, fp_c4.data[28].x, temp_116) + temp_80;
            if(temp_1) {
                temp_115 = temp_17;
            }
            temp_123 = temp_115;
            if(temp_81) {
                temp_112 = temp_118;
            }
            else {
                temp_112 = 0.0; // red, prevent from glow
            }
            if(temp_1) {
                temp_119 = temp_18;
            }
            temp_124 = floatBitsToInt(temp_120 + temp_111);
            temp_125 = floatBitsToInt(temp_121 + temp_110);
            temp_126 = temp_119;
            if(!temp_117) {
                temp_124 = floatBitsToInt(temp_120);
            }
            if(!temp_117) {
                temp_125 = floatBitsToInt(temp_121);
            }
            temp_127 = floatBitsToInt(temp_122 + temp_112);
            if(!temp_117) {
                temp_127 = floatBitsToInt(temp_122);
            }
            if(!temp_1) {
                temp_123 = temp_124;
            }
            if(!temp_1) {
                temp_126 = temp_125;
            }
            
            SV_Target0.x = intBitsToFloat(temp_127);
            SV_Target0.y = intBitsToFloat(temp_126);
            SV_Target0.z = intBitsToFloat(temp_123);
            SV_Target0.w = 1.0;
            //return; This causes crash on yuzu;
        }
    }
}