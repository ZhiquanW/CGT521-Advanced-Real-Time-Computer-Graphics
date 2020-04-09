#version 430 core
layout(location = 4) in vec4 aPos;

// out vec3 oCol;
// out vec2 oTexCoord;
void main() {
//  gl_Position = vec4(1.0f);

      gl_Position = vec4(aPos.xyz, 1.0);
  //    oCol = aCol;
  //    oTexCoord = aTexCoord;
}