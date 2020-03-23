#version 430 core
out vec4 FragColor;
in vec3 oCol;
in vec2 oTexCoord;
layout(location = 0) uniform sampler2D oTex0;
layout(location = 1) uniform sampler2D oTex1;
layout(location = 5) uniform vec3 light_color;
layout(location = 6) uniform vec3 obj_color;

void main() {
//    FragColor = mix(texture(oTex0, oTexCoord), texture(oTex1, oTexCoord), 1.0f);
            FragColor =vec4(obj_color*light_color,1.0f);
}