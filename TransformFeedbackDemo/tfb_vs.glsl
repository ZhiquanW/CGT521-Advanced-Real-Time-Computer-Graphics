#version 440            

layout(location = 0) uniform mat4 PVM;
layout(location = 1) uniform float time;
layout(location = 2) uniform float slider = 0.5;
layout(location = 3) uniform float p_size;

layout(location = 0) in vec3 pos_attrib;
layout(location = 1) in vec3 vel_attrib;
layout(location = 2) in float age_attrib;

layout(xfb_buffer = 0) out;

layout(xfb_offset = 0, xfb_stride = 28) out vec3 pos_out; 
layout(xfb_offset = 12, xfb_stride = 28) out vec3 vel_out; 
layout(xfb_offset = 24, xfb_stride = 28) out float age_out;


//Basic velocity field
vec3 v0(vec3 p,vec3 v);

//pseudorandom number
float rand(vec2 co);

void main(void)
{
	//Draw current particles
	gl_Position = PVM*vec4(pos_attrib, 1.0);
	gl_PointSize = p_size * abs(gl_Position.x-5.0f)+0.1f;

	//Compute particle attributes for next frame
	vel_out = v0(pos_attrib, vel_attrib);
	pos_out = pos_attrib + 0.000001*vel_out;
	age_out = age_attrib - 1.0;

	//Reinitialize particles as needed
	if(age_out <= 0.0 || pow(length(pos_out),2) > time*6.0f)
	{
		vec2 seed = vec2(float(gl_VertexID), time); //seed for the random number generator

		age_out = 700.0 + sin(time)*200.0*rand(seed);
		//Pseudorandom position
		float tmp_x = rand(seed.xx);
		float tmp_y = rand(seed.yy);
		float tmp_z = sqrt(6 - tmp_x * tmp_x - tmp_y * tmp_y);
		pos_out = pos_attrib *0.002f+ sin(time)*vec3(tmp_x, tmp_y, tmp_z);
		//pos_out = + vec3(tmp_x, tmp_y, tmp_z);
	}
}

vec3 v0(vec3 p,vec3 v)
{
	if (p.y > 0) {
		return v + vec3(0.0f,-0.98f,0.0f);
	} else {
		return -v*0.5f;
	}
	//return vec3(sin(p.y*10.0+time-10.0), -sin(p.x*10.0+9.0*time+10.0), +cos(2.4*p.z+2.0*time));
}

float rand(vec2 co)
{
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

