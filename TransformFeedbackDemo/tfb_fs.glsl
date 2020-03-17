#version 430

layout(location = 0) out vec4 fragcolor;           
layout(location = 1) uniform float time;
in vec3 pos_out;

bool is_in_ellipse(float x, float y) {
	return pow(x - 0.5f, 2) / (sin(time)*0.25f) + pow(y - 0.5f, 2) / (cos(time)*0.25f)< 1.0;
}
void main(void)
{  
	if (!is_in_ellipse(gl_PointCoord.x, gl_PointCoord.y)) discard;
	fragcolor = vec4(0.5f * sin(time)+0.1f,pos_out.y*cos(time)+0.01f,0.7f,max(0,0.5-pos_out.y));
}




















