#version 430

//layout(location=5) uniform sampler2D diffuse_color;
//layout(location=1) iform float timestep;
out vec4 fragcolor;           
//in vec2 tex_coord;
      
void main(void)
{   
	//fragcolor = texture(diffuse_color, tex_coord);
    fragcolor = vec4(0.5, 0.5, 0.2, 1.0);
    
}




















