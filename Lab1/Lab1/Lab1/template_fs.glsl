#version 430

layout(location=5) uniform sampler2D diffuse_color;
layout(location=1) uniform float timestep;
out vec4 fragcolor;           
in vec2 tex_coord;
      
void main(void)
{   
	fragcolor = texture(diffuse_color, tex_coord);
    //fragcolor = vec4(0.0, sin(timestep), 0.0, 1.0);
}




















