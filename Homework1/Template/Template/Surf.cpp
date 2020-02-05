#include "Surf.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <vector>
#include <iostream>
static const int N = 50;
static const int NUM_VERTICES = N * N;
static const GLuint RESTART_INDEX = 999999999999;
    // The sinc surface
static glm::vec3 surf(int i, int j) {
  const float center = 0.5f * N;
  const float xy_scale = 20.0f / N;
  const float z_scale = 10.0f;

  float x = xy_scale * (i - center);
  float y = xy_scale * (j - center);

  float r = sqrt(x * x + y * y);
  float z = 1.0f;

  if (r != 0.0f) {
    z = sin(r) / r;
  }
  z = z * z_scale;

  return 0.05f * glm::vec3(x, y, z);
}

// Sinc surface normals
static glm::vec3 normal(int i, int j) {
  glm::vec3 du = surf(i + 1, j) - surf(i - 1, j);
  glm::vec3 dv = surf(i, j + 1) - surf(i, j - 1);
  return glm::normalize(glm::cross(du, dv));
}

GLuint create_transform_mat() {
  std::vector<glm::mat4> transform_mats;
  for (int i = 0; i < 3; ++i) {
    for (int j = 0; j < 3; ++j) {
      transform_mats.push_back(glm::translate(glm::mat4(1.0) , glm::vec3(i,j,0)));
      //transform_mats.push_back(glm::mat4(1.0));
    }
  }
  GLuint transform_mat_buffer;
  glGenBuffers(1, &transform_mat_buffer);
  glBindBuffer(GL_ARRAY_BUFFER, transform_mat_buffer);
  glBufferData(GL_ARRAY_BUFFER, sizeof(glm::mat4) * transform_mats.size(),
               transform_mats.data(), GL_STATIC_DRAW);
  return transform_mat_buffer;
}

GLuint create_colors() {
  // model colors
  glm::vec4 colors[9] = {
      glm::vec4(0.1f, 0.2f, 0.9f, 1.0f), glm::vec4(0.9f, 0.1f, 0.8f, 1.0f),
      glm::vec4(0.4f, 0.9f, 0.6f, 1.0f), glm::vec4(0.2f, 0.2f, 0.3f, 1.0f),
      glm::vec4(0.7f, 0.8f, 0.7f, 1.0f), glm::vec4(0.5f, 0.7f, 0.5f, 1.0f),
      glm::vec4(0.8f, 0.2f, 0.4f, 1.0f), glm::vec4(0.2f, 0.3f, 0.3f, 1.0f),
      glm::vec4(0.1f, 0.6f, 0.1f, 1.0f),
  };
  GLuint color_vbo;
  glGenBuffers(1, &color_vbo);
  glBindBuffer(GL_ARRAY_BUFFER, color_vbo);
  // Upload from main memory to gpu memory.
  glBufferData(GL_ARRAY_BUFFER, sizeof(glm::vec4) * 9,
               &colors[0], GL_STATIC_DRAW);
  return color_vbo;
}
GLuint create_surf_vbo() {
  // Declare a vector to hold N*N vertices
  std::vector<glm::vec3> surf_verts;
  surf_verts.reserve(NUM_VERTICES);

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      surf_verts.push_back(surf(i, j));
      surf_verts.push_back(normal(i, j));
      surf_verts.push_back(glm::vec3((float)i / N, (float)j / N, 0.0f));
    }
  }

  GLuint vbo;
  glGenBuffers(1, &vbo);  // Generate vbo to hold vertex attributes for
                          // triangle.

  // Specify the buffer where vertex attribute data is stored.
  glBindBuffer(GL_ARRAY_BUFFER, vbo);

  // Upload from main memory to gpu memory.
  glBufferData(GL_ARRAY_BUFFER, sizeof(glm::vec3) * surf_verts.size(),
               surf_verts.data(), GL_STATIC_DRAW);

  return vbo;
}

GLuint create_surf_ebo() {
  std::vector<GLuint> indices_verts;
  for (int i = 0; i < (N-1); ++i) {
    for (int j = 0; j < N*2; ++j) {
      indices_verts.push_back((i + j % 2) * N + (j - j % 2) / 2);
    }
      indices_verts.push_back(RESTART_INDEX);
  }
  unsigned int ebo;
  glGenBuffers(1, &ebo);
  glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, ebo);
  glBufferData(GL_ELEMENT_ARRAY_BUFFER,
               sizeof(GLuint) * indices_verts.size(), indices_verts.data(),
               GL_STATIC_DRAW);
  return ebo;
}

GLuint create_surf_vao() {
  GLuint vao;
  // Generate vao id to hold the mapping from attrib variables in shader to
  // memory locations in vbo
  glGenVertexArrays(1, &vao);
  // Binding vao means that bindbuffer, enablevertexattribarray and
  // vertexattribpointer state will be remembered by vao
  glBindVertexArray(vao);
  GLuint vbo = create_surf_vbo();
  GLuint ebo = create_surf_ebo();
  const GLuint pos_loc = 0;
  const GLuint normal_loc = 1;
  const GLuint uv_loc = 2;
  glEnableVertexAttribArray(pos_loc);  // Enable the position attribute.
  glEnableVertexAttribArray(normal_loc);
  glEnableVertexAttribArray(uv_loc);

  // Tell opengl how to get the attribute values out of the vbo (stride and
  // offset). In this case, the vertices are at the beginning of the VBO and are
  // tightly packed.
  glVertexAttribPointer(pos_loc, 3, GL_FLOAT, false, 3 * sizeof(glm::vec3), 0);
  glVertexAttribPointer(normal_loc, 3, GL_FLOAT, false, 3 * sizeof(glm::vec3),
                        (void*)sizeof(glm::vec3));
  glVertexAttribPointer(uv_loc, 3, GL_FLOAT, false, 3 * sizeof(glm::vec3),
                        (void*)(2 * sizeof(glm::vec3)));

   GLuint color_vbo = create_colors();
  const GLuint colors_loc = 3;
   glEnableVertexAttribArray(colors_loc);
  glVertexAttribPointer(colors_loc, 4, GL_FLOAT, GL_FALSE, sizeof(glm::vec4),
                        0);
   glVertexAttribDivisor(colors_loc, 1);
  GLuint transform_mat_buffer = create_transform_mat();
  const GLuint tm_loc = 4;
  glEnableVertexAttribArray(tm_loc);
  for (int i = 0; i < 4; ++i) {
    glEnableVertexAttribArray(tm_loc + i);    glVertexAttribPointer(tm_loc+i,4, GL_FLOAT, GL_FALSE, sizeof(glm::mat4), (void*)(i*sizeof(glm::vec4)));
    glVertexAttribDivisor(tm_loc+i, 1);  }  glBindVertexArray(0);  // unbind the vao

  return vao;
}


// Draw the set of points on the surface
void draw_surf(GLuint vao) {
  glBindVertexArray(vao);
  // glDrawArrays(GL_TRIANGLES, 0, NUM_VERTICES);
  //glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
  //glDrawElements(GL_TRIANGLE_STRIP, N*N*N*N, GL_UNSIGNED_INT, 0);
  glPrimitiveRestartIndex(RESTART_INDEX);
  glEnable(GL_PRIMITIVE_RESTART);
  glDrawElementsInstanced(GL_TRIANGLE_STRIP, N*N*2, GL_UNSIGNED_INT, 0,9);
  glDisable(GL_PRIMITIVE_RESTART);

  //glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
}
