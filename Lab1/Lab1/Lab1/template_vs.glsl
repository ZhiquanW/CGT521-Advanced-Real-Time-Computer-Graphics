#version 430            
layout(location=2) uniform mat4 PVM;

layout(location = 10) in vec3 pos_attrib;
layout(location = 11) in vec2 tex_coord_attrib;
layout(location = 12) in vec3 normal_attrib;

out vec2 tex_coord;  

void main(void)
{
   gl_Position = PVM*vec4(pos_attrib, 1.0);
   tex_coord = tex_coord_attrib;
}
