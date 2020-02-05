#version 430
out vec4 fragcolor;
in vec2 tex_coord;
in vec3 l;
in vec3 n;
in vec3 v;
in float dis;
in vec4 fs_color;
layout(location = 10) uniform sampler2D diffuse_color;

layout(location = 20) uniform vec3 light_pos;
layout(location = 21) uniform vec4 ambient;
layout(location = 22) uniform vec4 diffuse;
layout(location = 23) uniform vec4 specular;
layout(location = 24) uniform vec3 light_color;
      
void main(void) {
  vec4 obj_diffuse_color = texture(diffuse_color, tex_coord);
  float shiness = 0.2f;
  vec3 r = normalize(reflect(l, n));
  vec3 tmp_fragcolor = ambient.w * ambient.xyz * light_color +
                       1 / pow(dis, 2) * diffuse.w * diffuse.xyz * light_color *
                           max(dot(n, l), 0) +
                       1 / pow(dis, 2) * specular.w * specular.xyz *
                           light_color * pow(max(0, dot(r, v)), shiness);
   fragcolor = fragcolor * obj_diffuse_color;
  fragcolor = vec4(tmp_fragcolor, 1.0f) * obj_diffuse_color*fs_color;

  // fragcolor = vec4(0.2, 0.4, 0.7, 1.0);
}



















