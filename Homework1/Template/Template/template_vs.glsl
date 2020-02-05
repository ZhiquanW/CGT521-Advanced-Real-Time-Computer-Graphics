#version 430            
layout(location=0) uniform mat4 PVM;
layout(location = 1) uniform mat4 M;
layout(location = 2) uniform vec3 eye_pos;
layout(location = 20) uniform vec3 light_pos;

layout(location = 0) in vec3 pos_attrib;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec3 uv;
layout(location = 3) in vec4 color;
layout(location = 4) in mat4 tm;
    in vec2 tex_coord_attrib;
out vec2 tex_coord;  
out float dis;
out vec3 l;
out vec3 n;
out vec3 v;
out vec4 fs_color;
vec4 model_pos;
void main(void) {
  gl_Position = PVM *tm*vec4(pos_attrib, 1.0);
  model_pos = M * vec4(pos_attrib, 1.0);
  vec3 tmp_dis = light_pos - vec3(model_pos);
  l = normalize(tmp_dis);
  dis = length(tmp_dis);
  n = normal;
  v = normalize(eye_pos - vec3(model_pos));
  tex_coord = vec2(uv);
  fs_color = color;
}
