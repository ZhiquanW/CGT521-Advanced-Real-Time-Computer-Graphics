#version 430
uniform sampler2D texture;
uniform int pass;
uniform int blur;
uniform int picked;
out vec4 fragcolor;
in vec2 tex_coord;
uniform bool edge;
layout(location = 1)out vec4 data;

flat in int id;
void main(void) {

	if (pass == 1) {
		fragcolor = texture2D(texture, tex_coord);
		if (picked==id) fragcolor *= 5.0f;
	} else if (pass == 2) {
		if (edge) {
			vec4 above = texelFetch(texture, ivec2(gl_FragCoord.xy + vec2(0.0f, 1.0f)), 0);
			vec4 below = texelFetch(texture, ivec2(gl_FragCoord.xy - vec2(0.0f, 1.0f)), 0);
			vec4 right = texelFetch(texture, ivec2(gl_FragCoord.xy + vec2(1.0f, 0.0f)), 0);
			vec4 left = texelFetch(texture, ivec2(gl_FragCoord.xy - vec2(1.0f, 0.0f)), 0);
			fragcolor = (left - right) * (left - right) + (above - below) * (above - below);
		} else {
			fragcolor = texture2D(texture, tex_coord);
		}
	} else {
		fragcolor = vec4(vec3(id/12.0f), 1.0f);
		//fragcolor = vec4(vec3(1.0f), 1.0f);
	}
}