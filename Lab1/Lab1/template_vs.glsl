#version 430            
layout(location=2) uniform mat4 PVM;

//in vec3 pos_attrib;
//in vec2 tex_coord_attrib;
//in vec3 normal_attrib;
in vec3 pos_attribute;
//out vec2 tex_coord;  

void main(void){
  gl_Position = PVM*vec4(pos_attribute, 1.0);
  ////gl_PointSize = 10;
   //tex_coord = tex_coord_attrib;
}
