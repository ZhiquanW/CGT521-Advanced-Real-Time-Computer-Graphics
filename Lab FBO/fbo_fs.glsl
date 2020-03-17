#version 400
uniform sampler2D texture;
uniform int pass;
uniform int blur;
out vec4 fragcolor;
in vec2 tex_coord;
void main(void) {
	
	if (pass == 1) {
		fragcolor = texture2D(texture, tex_coord);
	} else if (pass == 2) {
		//// Lab assignment: Use texelFetch function and gl_FragCoord instead of using
		//// texture coordinates when reading from texture.
		//fragcolor = vec4(1.0, 1.0, 1.0, 1.0); // error
		//// fragcolor = texture2D(texture, tex_coord);
		//vec3 sampleTex[9];
		//for (int i = 0; i < 9; i++) {
		//	sampleTex[i] = vec3(texture2D(texture, tex_coord.xy + offsets[i]));
		//}
		//vec3 col = vec3(0.0f);
		//for (int i = 0; i < 9; i++)
		//	col += sampleTex[i] * kernel[i];
		//fragcolor = vec4(col , 1.0);
	} else {
		fragcolor = vec4(1.0, 0.0, 1.0, 1.0); // error
	}
}