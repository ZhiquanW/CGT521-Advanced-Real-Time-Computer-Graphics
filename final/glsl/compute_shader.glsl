//
// @Author: Zhiquan Wang
// @Date: 2/16/20.
// @Email: zhiquan.wzq@gmail.com
// Copyright (c) 2020 Zhiquan Wang. All rights reserved.
//
#version 430 compatibility
#extension GL_ARB_compute_shader : enable
#extension GL_ARB_shader_storage_buffer_object : enable
//
layout(std430, binding = 0) buffer Part {
  float ps[]; // array of structures
};

layout(local_size_x = 1, local_size_y = 1, local_size_z = 1) in;

void main() {
  uint gid = gl_GlobalInvocationID.x; // the .y and .z are both 1 in this
  ps[gid] = 1.0f;
}
