//
// @Author: Zhiquan Wang
// @Date: 2/16/20.
// @Email: zhiquan.wzq@gmail.com
// Copyright (c) 2020 Zhiquan Wang. All rights reserved.
//


#ifndef HELLO_WORLD_ZWENGINE_H
#define HELLO_WORLD_ZWENGINE_H


#include <glad/glad.h>

#include "imgui.h"
#include "imgui_impl_glfw.h"
#include "imgui_impl_opengl3.h"
//

#include <GLFW/glfw3.h>

#define GLM_ENABLE_EXPERIMENTAL

#include <glm/gtx/transform.hpp>
//
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <memory>
#include "assimp/scene.h"
#include "ShaderProgram.h"

#include "VertexArrayObject.h"
#include "VertexBufferObject.h"
#include "ElementBufferObject.h"
#include "Texture.h"
#include "Camera.h"

class ZWEngine {
public:
    ZWEngine();

    bool init_shader_program(const GLchar *, const GLchar *);

    bool init_engine(int, int);

    void run();

    bool attach_camera(Camera);

    Camera &get_camera();



private:
    GLFWwindow *window;
    glm::vec2 window_size{};
    ShaderProgram *shader_program;
    std::map<std::string, VertexArrayObject> vao_map;
    std::vector<Texture> texture_list;
    Camera main_camera;
    GLfloat delta_time;
    GLfloat last_time;
    // custom varibles
    GLuint uniform_failed_id = -1;
    GLfloat obj_angle = 0.0f;
    std::shared_ptr<glm::vec3 > light_color_ptr = std::make_shared<glm::vec3>(1.0f,1.0f,1.0f);
    std::shared_ptr<glm::vec3 > light_pos_ptr = std::make_shared<glm::vec3>(1.0f,1.0f,1.0f);

    std::shared_ptr<glm::vec3>  Ka = std::make_shared<glm::vec3>(1.0f);
    std::shared_ptr<glm::vec3>  Kd = std::make_shared<glm::vec3>(1.0f);
    std::shared_ptr<glm::vec3>  Ks = std::make_shared<glm::vec3>(1.0f);

    std::shared_ptr<glm::vec3>  La = std::make_shared<glm::vec3>(1.0f);
    std::shared_ptr<glm::vec3>  Ld = std::make_shared<glm::vec3>(1.0f);
    std::shared_ptr<glm::vec3>  Ls = std::make_shared<glm::vec3>(1.0f);
    std::shared_ptr<glm::vec3> F0 = std::make_shared<glm::vec3>(0.56,0.57,0.58);
    GLfloat m = 0.5f;
    bool* ambient_effect = new bool(true);
    bool* diffuse_effect = new bool(true);
    bool* F_effect= new bool(true);
    bool* D_effect = new bool(true);
    bool* G_effect = new bool(true);
    //functions
    bool init_window(int, int);

    static bool init_glad();

    bool init_imgui();

    void main_loop();

    void cleanup();

    // custom functions
    void set_render_info();

    void render_ui();

    void render_world();

    //utilities functions
    void process_input();

    void add_vao(const std::string &, VertexArrayObject &);

    void activate_vao(const std::string &);

    static void disable_vao();

    void add_texture(Texture);

    void activate_texture(GLint= -1);

    static void mouse_callback(GLFWwindow *window, double xpos, double ypos);

    static void scroll_callback(GLFWwindow *window, double xoffset, double yoffset);

    static void keycode_callback(GLFWwindow *, int, int, int, int);
};

void bind_vertex_buffer_object(const std::vector<GLfloat> &data, GLenum data_type = GL_STATIC_DRAW);

void
bind_vertex_attribute(GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);

void framebuffer_size_callback(GLFWwindow *window, int w, int h);

#endif //HELLO_WORLD_ZWENGINE_H
