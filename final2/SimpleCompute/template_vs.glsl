#version 430            

layout(location = 0) in vec4 pos_attrib;

layout(location = 0) uniform mat4 PVM;
out vec4 color;

void main(void)
{
	gl_Position = PVM*pos_attrib;
	gl_PointSize = 5000.0;


}