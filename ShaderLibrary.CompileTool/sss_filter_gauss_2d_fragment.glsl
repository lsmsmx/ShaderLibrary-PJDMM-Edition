#version 450 core
#extension GL_ARB_gpu_shader_int64 : enable
#extension GL_ARB_shader_ballot : enable
#extension GL_ARB_shader_group_vote : enable
#extension GL_EXT_shader_image_load_formatted : enable
#extension GL_EXT_texture_shadow_lod : enable
#extension GL_ARB_fragment_shader_interlock : enable
#extension GL_NV_viewport_array2 : enable

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

layout (binding = 0, std140) uniform _Quad
{
    vec4 data[4096];
} fp_c3;

layout (binding = 1, std140) uniform _GaussianCoef
{
    vec4 data[4096];
} fp_c4;

layout (binding = 0) uniform sampler2D g_texture;
layout (location = 0) in vec4 in_attr0;
layout (location = 0) out vec4 SV_Target0;

void main()
{
    vec2 uv = in_attr0.xy;
    vec4 temp_2 = textureLod(g_texture, uv, 0.0);

    if (temp_2.w < 0.5)
    {
        SV_Target0 = temp_2;
    }
    else
    {
        float blur_rad = 0.5;

        // Coord shift (11x11 orig)
        float temp_12 = fma(fp_c3.data[1].x, fp_c4.data[0].z * blur_rad, uv.x);
        float temp_13 = fma(fp_c3.data[1].x, -fp_c4.data[0].z * blur_rad, uv.x);
        float temp_18 = fma(fp_c3.data[1].x, fp_c4.data[0].z * blur_rad, temp_12);
        float temp_19 = fma(fp_c3.data[1].x, -fp_c4.data[0].z * blur_rad, temp_13);
        float temp_24 = fma(fp_c3.data[1].x, fp_c4.data[0].z * blur_rad, temp_18);
        float temp_25 = fma(fp_c3.data[1].x, -fp_c4.data[0].z * blur_rad, temp_19);
        float temp_30 = fma(fp_c3.data[1].x, fp_c4.data[0].z * blur_rad, temp_24);
        float temp_33 = fma(fp_c3.data[1].x, -fp_c4.data[0].z * blur_rad, temp_25);
        float temp_36 = fma(fp_c3.data[1].x, fp_c4.data[0].z * blur_rad, temp_30);
        float temp_37 = fma(fp_c3.data[1].x, -fp_c4.data[0].z * blur_rad, temp_33);

        float temp_40 = fma(fp_c3.data[1].y, fp_c4.data[0].w * blur_rad, uv.y);
        float temp_43 = fma(fp_c3.data[1].y, -fp_c4.data[0].w * blur_rad, uv.y);
        float temp_86 = fma(fp_c3.data[1].y, fp_c4.data[0].w * blur_rad, temp_40);
        float temp_87 = fma(fp_c3.data[1].y, -fp_c4.data[0].w * blur_rad, temp_43);
        float temp_130 = fma(fp_c3.data[1].y, fp_c4.data[0].w * blur_rad, temp_86);
        float temp_137 = fma(fp_c3.data[1].y, -fp_c4.data[0].w * blur_rad, temp_87);
        float temp_180 = fma(fp_c3.data[1].y, fp_c4.data[0].w * blur_rad, temp_130);
        float temp_183 = fma(fp_c3.data[1].y, -fp_c4.data[0].w * blur_rad, temp_137);
        float temp_224 = fma(fp_c3.data[1].y, fp_c4.data[0].w * blur_rad, temp_180);
        float temp_225 = fma(fp_c3.data[1].y, -fp_c4.data[0].w * blur_rad, temp_183);

        // colors and weights accumulate
        vec3 colorSum = temp_2.xyz * fp_c4.data[1].xyz;
        vec3 weightSum = fp_c4.data[1].xyz;

        #define AccumulateTap(tapUV, weight) { vec4 col = textureLod(g_texture, tapUV, 0.0); colorSum += col.xyz * (col.w * (weight)); weightSum += col.w * (weight); }

        // --- X ---
        AccumulateTap(vec2(temp_12, uv.y), fp_c4.data[2].xyz);
        AccumulateTap(vec2(temp_13, uv.y), fp_c4.data[2].xyz);
        AccumulateTap(vec2(temp_18, uv.y), fp_c4.data[3].xyz);
        AccumulateTap(vec2(temp_19, uv.y), fp_c4.data[3].xyz);
        AccumulateTap(vec2(temp_24, uv.y), fp_c4.data[4].xyz);
        AccumulateTap(vec2(temp_25, uv.y), fp_c4.data[4].xyz);
        AccumulateTap(vec2(temp_30, uv.y), fp_c4.data[5].xyz);
        AccumulateTap(vec2(temp_33, uv.y), fp_c4.data[5].xyz);
        AccumulateTap(vec2(temp_36, uv.y), fp_c4.data[6].xyz);
        AccumulateTap(vec2(temp_37, uv.y), fp_c4.data[6].xyz);

        // --- Y1 (temp_40 & temp_43) ---
        AccumulateTap(vec2(uv.x, temp_40), fp_c4.data[7].xyz);
        AccumulateTap(vec2(uv.x, temp_43), fp_c4.data[7].xyz);
        AccumulateTap(vec2(temp_12, temp_40), fp_c4.data[8].xyz);
        AccumulateTap(vec2(temp_13, temp_40), fp_c4.data[8].xyz);
        AccumulateTap(vec2(temp_12, temp_43), fp_c4.data[8].xyz);
        AccumulateTap(vec2(temp_13, temp_43), fp_c4.data[8].xyz);
        AccumulateTap(vec2(temp_18, temp_40), fp_c4.data[9].xyz);
        AccumulateTap(vec2(temp_19, temp_40), fp_c4.data[9].xyz);
        AccumulateTap(vec2(temp_18, temp_43), fp_c4.data[9].xyz);
        AccumulateTap(vec2(temp_19, temp_43), fp_c4.data[9].xyz);
        AccumulateTap(vec2(temp_24, temp_40), fp_c4.data[10].xyz);
        AccumulateTap(vec2(temp_25, temp_40), fp_c4.data[10].xyz);
        AccumulateTap(vec2(temp_24, temp_43), fp_c4.data[10].xyz);
        AccumulateTap(vec2(temp_25, temp_43), fp_c4.data[10].xyz);
        AccumulateTap(vec2(temp_30, temp_40), fp_c4.data[11].xyz);
        AccumulateTap(vec2(temp_33, temp_40), fp_c4.data[11].xyz);
        AccumulateTap(vec2(temp_30, temp_43), fp_c4.data[11].xyz);
        AccumulateTap(vec2(temp_33, temp_43), fp_c4.data[11].xyz);
        AccumulateTap(vec2(temp_36, temp_40), fp_c4.data[12].xyz);
        AccumulateTap(vec2(temp_37, temp_40), fp_c4.data[12].xyz);
        AccumulateTap(vec2(temp_36, temp_43), fp_c4.data[12].xyz);
        AccumulateTap(vec2(temp_37, temp_43), fp_c4.data[12].xyz);

        // --- Y2 (temp_86 & temp_87) ---
        AccumulateTap(vec2(uv.x, temp_86), fp_c4.data[13].xyz);
        AccumulateTap(vec2(uv.x, temp_87), fp_c4.data[13].xyz);
        AccumulateTap(vec2(temp_12, temp_86), fp_c4.data[14].xyz);
        AccumulateTap(vec2(temp_13, temp_86), fp_c4.data[14].xyz);
        AccumulateTap(vec2(temp_12, temp_87), fp_c4.data[14].xyz);
        AccumulateTap(vec2(temp_13, temp_87), fp_c4.data[14].xyz);
        AccumulateTap(vec2(temp_18, temp_86), fp_c4.data[15].xyz);
        AccumulateTap(vec2(temp_19, temp_86), fp_c4.data[15].xyz);
        AccumulateTap(vec2(temp_18, temp_87), fp_c4.data[15].xyz);
        AccumulateTap(vec2(temp_19, temp_87), fp_c4.data[15].xyz);
        AccumulateTap(vec2(temp_24, temp_86), fp_c4.data[16].xyz);
        AccumulateTap(vec2(temp_25, temp_86), fp_c4.data[16].xyz);
        AccumulateTap(vec2(temp_24, temp_87), fp_c4.data[16].xyz);
        AccumulateTap(vec2(temp_25, temp_87), fp_c4.data[16].xyz);
        AccumulateTap(vec2(temp_30, temp_86), fp_c4.data[17].xyz);
        AccumulateTap(vec2(temp_33, temp_86), fp_c4.data[17].xyz);
        AccumulateTap(vec2(temp_30, temp_87), fp_c4.data[17].xyz);
        AccumulateTap(vec2(temp_33, temp_87), fp_c4.data[17].xyz);
        AccumulateTap(vec2(temp_36, temp_86), fp_c4.data[18].xyz);
        AccumulateTap(vec2(temp_37, temp_86), fp_c4.data[18].xyz);
        AccumulateTap(vec2(temp_36, temp_87), fp_c4.data[18].xyz);
        AccumulateTap(vec2(temp_37, temp_87), fp_c4.data[18].xyz);

        // --- Y3 (temp_130 & temp_137) ---
        AccumulateTap(vec2(uv.x, temp_130), fp_c4.data[19].xyz);
        AccumulateTap(vec2(uv.x, temp_137), fp_c4.data[19].xyz);
        AccumulateTap(vec2(temp_12, temp_130), fp_c4.data[20].xyz);
        AccumulateTap(vec2(temp_13, temp_130), fp_c4.data[20].xyz);
        AccumulateTap(vec2(temp_12, temp_137), fp_c4.data[20].xyz);
        AccumulateTap(vec2(temp_13, temp_137), fp_c4.data[20].xyz);
        AccumulateTap(vec2(temp_18, temp_130), fp_c4.data[21].xyz);
        AccumulateTap(vec2(temp_19, temp_130), fp_c4.data[21].xyz);
        AccumulateTap(vec2(temp_18, temp_137), fp_c4.data[21].xyz);
        AccumulateTap(vec2(temp_19, temp_137), fp_c4.data[21].xyz);
        AccumulateTap(vec2(temp_24, temp_130), fp_c4.data[22].xyz);
        AccumulateTap(vec2(temp_25, temp_130), fp_c4.data[22].xyz);
        AccumulateTap(vec2(temp_24, temp_137), fp_c4.data[22].xyz);
        AccumulateTap(vec2(temp_25, temp_137), fp_c4.data[22].xyz);
        AccumulateTap(vec2(temp_30, temp_130), fp_c4.data[23].xyz);
        AccumulateTap(vec2(temp_33, temp_130), fp_c4.data[23].xyz);
        AccumulateTap(vec2(temp_30, temp_137), fp_c4.data[23].xyz);
        AccumulateTap(vec2(temp_33, temp_137), fp_c4.data[23].xyz);
        AccumulateTap(vec2(temp_36, temp_130), fp_c4.data[24].xyz);
        AccumulateTap(vec2(temp_37, temp_130), fp_c4.data[24].xyz);
        AccumulateTap(vec2(temp_36, temp_137), fp_c4.data[24].xyz);
        AccumulateTap(vec2(temp_37, temp_137), fp_c4.data[24].xyz);

        // --- Y4 (temp_180 & temp_183) ---
        AccumulateTap(vec2(uv.x, temp_180), fp_c4.data[25].xyz);
        AccumulateTap(vec2(uv.x, temp_183), fp_c4.data[25].xyz);
        AccumulateTap(vec2(temp_12, temp_180), fp_c4.data[26].xyz);
        AccumulateTap(vec2(temp_13, temp_180), fp_c4.data[26].xyz);
        AccumulateTap(vec2(temp_12, temp_183), fp_c4.data[26].xyz);
        AccumulateTap(vec2(temp_13, temp_183), fp_c4.data[26].xyz);
        AccumulateTap(vec2(temp_18, temp_180), fp_c4.data[27].xyz);
        AccumulateTap(vec2(temp_19, temp_180), fp_c4.data[27].xyz);
        AccumulateTap(vec2(temp_18, temp_183), fp_c4.data[27].xyz);
        AccumulateTap(vec2(temp_19, temp_183), fp_c4.data[27].xyz);
        AccumulateTap(vec2(temp_24, temp_180), fp_c4.data[28].xyz);
        AccumulateTap(vec2(temp_25, temp_180), fp_c4.data[28].xyz);
        AccumulateTap(vec2(temp_24, temp_183), fp_c4.data[28].xyz);
        AccumulateTap(vec2(temp_25, temp_183), fp_c4.data[28].xyz);
        AccumulateTap(vec2(temp_30, temp_180), fp_c4.data[29].xyz);
        AccumulateTap(vec2(temp_33, temp_180), fp_c4.data[29].xyz);
        AccumulateTap(vec2(temp_30, temp_183), fp_c4.data[29].xyz);
        AccumulateTap(vec2(temp_33, temp_183), fp_c4.data[29].xyz);
        AccumulateTap(vec2(temp_36, temp_180), fp_c4.data[30].xyz);
        AccumulateTap(vec2(temp_37, temp_180), fp_c4.data[30].xyz);
        AccumulateTap(vec2(temp_36, temp_183), fp_c4.data[30].xyz);
        AccumulateTap(vec2(temp_37, temp_183), fp_c4.data[30].xyz);

        // --- Y5 (temp_224 & temp_225) ---
        AccumulateTap(vec2(uv.x, temp_224), fp_c4.data[31].xyz);
        AccumulateTap(vec2(uv.x, temp_225), fp_c4.data[31].xyz);
        AccumulateTap(vec2(temp_12, temp_224), fp_c4.data[32].xyz);
        AccumulateTap(vec2(temp_13, temp_224), fp_c4.data[32].xyz);
        AccumulateTap(vec2(temp_12, temp_225), fp_c4.data[32].xyz);
        AccumulateTap(vec2(temp_13, temp_225), fp_c4.data[32].xyz);
        AccumulateTap(vec2(temp_18, temp_224), fp_c4.data[33].xyz);
        AccumulateTap(vec2(temp_19, temp_224), fp_c4.data[33].xyz);
        AccumulateTap(vec2(temp_18, temp_225), fp_c4.data[33].xyz);
        AccumulateTap(vec2(temp_19, temp_225), fp_c4.data[33].xyz);
        AccumulateTap(vec2(temp_24, temp_224), fp_c4.data[34].xyz);
        AccumulateTap(vec2(temp_25, temp_224), fp_c4.data[34].xyz);
        AccumulateTap(vec2(temp_24, temp_225), fp_c4.data[34].xyz);
        AccumulateTap(vec2(temp_25, temp_225), fp_c4.data[34].xyz);
        AccumulateTap(vec2(temp_30, temp_224), fp_c4.data[35].xyz);
        AccumulateTap(vec2(temp_33, temp_224), fp_c4.data[35].xyz);
        AccumulateTap(vec2(temp_30, temp_225), fp_c4.data[35].xyz);
        AccumulateTap(vec2(temp_33, temp_225), fp_c4.data[35].xyz);
        AccumulateTap(vec2(temp_36, temp_224), fp_c4.data[36].xyz);
        AccumulateTap(vec2(temp_37, temp_224), fp_c4.data[36].xyz);
        AccumulateTap(vec2(temp_36, temp_225), fp_c4.data[36].xyz);
        AccumulateTap(vec2(temp_37, temp_225), fp_c4.data[36].xyz);

        // Normalisation and buffer write
        SV_Target0.xyz = (colorSum / (weightSum + 9.99999975e-6)) * fp_c3.data[2].xyz;
        SV_Target0.w = 1.0;
    }
}

        
