#version 450 core
#extension GL_ARB_gpu_shader_int64 : enable
#extension GL_ARB_shader_ballot : enable
#extension GL_ARB_shader_group_vote : enable
#extension GL_EXT_shader_image_load_formatted : enable
#extension GL_EXT_texture_shadow_lod : enable
#extension GL_ARB_shader_draw_parameters : enable
#extension GL_ARB_shader_viewport_layer_array : enable
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

layout (binding = 0, std140) uniform _Quad
{
    precise vec4 data[4096];
} vp_c3;

layout (location = 0) out vec4 out_attr0;


void main()
{
    precise float temp_0;
    precise float temp_1;
    precise float temp_2;
    gl_Position.x = 0.0;
    gl_Position.y = 0.0;
    gl_Position.z = 0.0;
    gl_Position.w = 1.0;
    temp_0 = intBitsToFloat(gl_VertexID);
    temp_1 = fma(float(floatBitsToUint(temp_0) >> 1), 2.0, -1.0);
    temp_2 = fma(float(uint(floatBitsToInt(temp_0) & 1)), 2.0, -1.0);
    gl_Position.x = temp_1;
    gl_Position.y = temp_2;
    out_attr0.x = fma(temp_1, vp_c3.data[0].x, vp_c3.data[0].z);
    out_attr0.y = fma(temp_2, 0.0 - vp_c3.data[0].y, vp_c3.data[0].w);
    return;
}
