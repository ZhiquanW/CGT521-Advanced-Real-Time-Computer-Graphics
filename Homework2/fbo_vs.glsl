#version 400            
uniform mat4 PVM;
uniform int pass;

in vec3 pos_attrib;
in vec2 tex_coord_attrib;
in vec3 normal_attrib;
out vec2 tex_coord;  
flat out int id;
void main(void)
{
	if(pass == 1)
	{
		/*vec3 pos = pos_attrib + gl_InstanceID % 3 * vec3(0.5f, 0.0f, 0.0f);
		pos += gl_InstanceID / 3 * vec3(0.0f, -0.5f, 0.0f);*/
		gl_Position = PVM*vec4(pos_attrib + vec3((gl_InstanceID % 4) * 0.5f,-0.5f* gl_InstanceID/4.0f, 0.0),1.0f);
		tex_coord = tex_coord_attrib;
	}	else if(pass == 2){
		gl_Position = vec4(pos_attrib, 1.0);
		tex_coord = 0.5*pos_attrib.xy + vec2(0.5);
	} else {
		gl_Position = PVM * vec4(pos_attrib + vec3((gl_InstanceID % 4) * 0.5f, -0.5f * gl_InstanceID / 4.0f, 0.0), 1.0f);
		tex_coord = tex_coord_attrib;
		id = gl_InstanceID;
	}
}