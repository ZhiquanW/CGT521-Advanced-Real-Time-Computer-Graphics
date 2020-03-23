#version 430 core
layout(location = 0) in vec3 cube_pos;
layout(location = 1) in vec3 light_pos;
layout(location = 2) uniform mat4 model;
layout(location = 3) uniform mat4 view;
layout(location = 4) uniform mat4 project;
out vec3 oCol;
out vec2 oTexCoord;
void main() {
    gl_Position =  project * view  * model * vec4(cube_pos.xyz, 1.0);
    //    gl_Position = vec4(aPos.xyz, 1.0);
//    oCol = aCol;
//    oTexCoord = aTexCoord;
}