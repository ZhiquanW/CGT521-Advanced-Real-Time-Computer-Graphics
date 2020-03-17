#version 430

layout(location = 1) uniform int pass;
layout(location = 3) uniform int mode = 0;
layout(location = 6) uniform float time;
layout(location = 7) uniform vec4 slider;
layout(location = 8) uniform int scene = 0;

layout(binding = 0) uniform sampler2D backfaces_tex;

layout(location = 0) out vec4 fragcolor;  
         
in vec3 vpos;  

//forward function declarations
vec4 raytracedcolor(vec3 rayStart, vec3 rayStop);
vec4 clear_color(vec3 rayDir);
vec4 lighting(vec3 pos, vec3 rayDir);
float distToShape(vec3 pos);
float sdLink(in vec3 p, in float le, in float r1, in float r2);
float sdTriPrism(vec3 p, vec2 h);
float sdCross(vec3 p);
float sdCappedTorus(in vec3 p, in vec2 sc, in float ra, in float rb);
vec3 normal(vec3 pos);

const vec3 light_pos = vec3(5.0, 5.0, 5.0);

const vec4 La = vec4(0.75, 0.75, 0.75, 1.0);
const vec4 Ld = vec4(0.74, 0.74, 0.74, 1.0);
const vec4 Ls = vec4(1.0, 1.0, 0.74, 1.0);

const vec4 Ka = vec4(0.4, 0.4, 0.34, 1.0);
const vec4 Kd = vec4(1.0, 1.0, 0.73, 1.0);
const vec4 Ks = vec4(0.1, 0.1, 0.073, 1.0);


void main(void)
{   
	if(pass == 1)
	{
		fragcolor = vec4((vpos), 1.0); //write cube positions to texture
	}
	else if(pass == 2) 
	{
		if(mode == 0) // for debugging: show backface colors
		{
			fragcolor = texelFetch(backfaces_tex, ivec2(gl_FragCoord), 0);
			return;
		}
		else if(mode == 1) // for debugging: show frontface colors
		{
			fragcolor = vec4((vpos), 1.0);
			return;
		}
		else // raycast
		{
			vec3 rayStart = vpos.xyz;
			vec3 rayStop = texelFetch(backfaces_tex, ivec2(gl_FragCoord.xy), 0).xyz;
			fragcolor = raytracedcolor(rayStart, rayStop);
		}
	}
}


// trace rays until they intersect the surface
vec4 raytracedcolor(vec3 rayStart, vec3 rayStop)
{
	const int MaxSamples = 1000; //max number of steps along ray

	vec3 rayDir = normalize(rayStop-rayStart);	//ray direction unit vector
	float travel = distance(rayStop, rayStart);	
	float stepSize = travel/MaxSamples;	//initial raymarch step size
	vec3 pos = rayStart;				//position along the ray
	vec3 step = rayDir*stepSize;		//displacement vector along ray
	
	for (int i=0; i < MaxSamples && travel > 0.0; ++i, pos += step, travel -= stepSize)
	{
		float dist = distToShape(pos); //How far are we from the shape we are raycasting?

		//Distance tells us how far we can safely step along ray without intersecting surface
		stepSize = dist;
		step = rayDir*stepSize;
		
		//Check distance, and if we are close then perform lighting
		const float eps = 1e-4;
		if(dist <= eps)
		{
			return lighting(pos, rayDir);
		}	
	}
	//If the ray never intersects the scene then output clear color
	return clear_color(rayDir);
}

//Compute lighting on the raycast surface using Phong lighting model
vec4 lighting(vec3 pos, vec3 rayDir)
{
	const vec3 light = normalize(light_pos-pos); //light direction from surface
	vec3 n = normal(pos);

	vec4 La = clear_color(n);
	float diff = max(0.0, dot(n, light));

	return La*Ka + Ld*Kd*diff;	
}

vec4 clear_color(vec3 rayDir)
{
	const vec4 color1 = vec4(0.6, 0.8, 0.9, 1.0);
	return color1;
}


//shape function declarations
float sdSphere( vec3 p, float s );
float sdBox( vec3 p, vec3 b );

// For more distance functions see
// http://iquilezles.org/www/articles/distfunctions/distfunctions.htm

// Soft shadows
// http://www.iquilezles.org/www/articles/rmshadows/rmshadows.htm

// WebGL example and a simple ambient occlusion approximation
// https://www.shadertoy.com/view/Xds3zN


//distance to the shape we are drawing
float distToShape(vec3 pos)
{
	if(scene == 0)
	{
		/*const float radius = 0.4;
		vec3 offset = 2.0*slider.xyz;
		float d0 = sdSphere(pos+offset, radius);
		return d0;*/
		const float le = 0.2f;
		const float r1 = 0.2;
		const float r2 = 0.09;
		float d0 =  sdLink(pos, abs(cos(time) + 0.01), r1, r2);
		const float h = 0.2f;
		float d1 = sdTriPrism(pos, vec2(abs(sin(time)+0.01)*0.4,0.6));
		return min(d0, d1);
	} else if(scene == 1) {
		float an = 2.5 * (0.5 + 0.5 * sin(slider.z * 1.1 + 3.0));
		vec2 c = vec2(sin(an), cos(an));
		return sdCappedTorus(pos, c, slider.x, slider.y);
	} else if(scene == 2) {
		float d2 = sdBox(pos+vec3(0.0, 0.0, 0.0), vec3(0.4, 0.4, 0.4));
		return d2;
	}
}

float sdTriPrism(vec3 p, vec2 h) {
	const float k = sqrt(3.0);
	h.x *= 0.5 * k;
	p.xy /= h.x;
	p.x = abs(p.x) - 1.0;
	p.y = p.y + 1.0 / k;
	if (p.x + k * p.y > 0.0) p.xy = vec2(p.x - k * p.y, -k * p.x - p.y) / 2.0;
	p.x -= clamp(p.x, -2.0, 0.0);
	float d1 = length(p.xy) * sign(-p.y) * h.x;
	float d2 = abs(p.z) - h.y;
	return length(max(vec2(d1, d2), 0.0)) + min(max(d1, d2), 0.);
}
// shape function definitions            
float sdSphere( vec3 p, float s )
{
	return length(p)-s;
}

float sdBox( vec3 p, vec3 b )
{
  vec3 d = abs(p) - b;
  return min(max(d.x,max(d.y,d.z)),0.0) + length(max(d,0.0));
}

float sdLink(vec3 p, float le, float r1, float r2) {
	vec3 q = vec3(p.x, max(abs(p.y) - le, 0.0), p.z);
	return length(vec2(length(q.xy) - r1, q.z)) - r2;
}
float sdCross(vec3 p) {
	float da = sdBox(p.xyz, vec3(1.0, slider.y, slider.z));
	float db = sdBox(p.yzx, vec3(slider.x, 1.0, slider.z));
	float dc = sdBox(p.zxy, vec3(slider.x, slider.y, 1.0));
	return min(da, min(db, dc));
}
float sdCappedTorus(in vec3 p, in vec2 sc, in float ra, in float rb) {
	p.x = abs(p.x);
	float k = (sc.y * p.x > sc.x * p.y) ? dot(p.xy, sc) : length(p.xy);
	return sqrt(dot(p, p) + ra * ra - 2.0 * ra * k) - rb;
}

//normal vector of the shape we are drawing.
//Estimated as the gradient of the signed distance function.
vec3 normal(vec3 pos)
{
	const float h = 0.001;
	const vec3 Xh = vec3(h, 0.0, 0.0);	
	const vec3 Yh = vec3(0.0, h, 0.0);	
	const vec3 Zh = vec3(0.0, 0.0, h);	

	return normalize(vec3(distToShape(pos+Xh)-distToShape(pos-Xh), distToShape(pos+Yh)-distToShape(pos-Yh), distToShape(pos+Zh)-distToShape(pos-Zh)));
}


