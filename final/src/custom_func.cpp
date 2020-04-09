//
// @Author: Zhiquan Wang
// @Date: 2/16/20.
// @Email: zhiquan.wzq@gmail.com
// Copyright (c) 2020 Zhiquan Wang. All rights reserved.
//
#include "ZWEngine.h"

//#define STB_IMAGE_IMPLEMENTATION
//
//#include "stb_image.h"
#define NUM_PARTICLES 3   // total number of particles to move
#define WORK_GROUP_SIZE 1 // # work-items per work-group
struct Particle {
    glm::vec4 pos; // positions
};
struct vel {
    float vx, vy, vz, vw; // velocities
};
struct color {
    float r, g, b, a; // colors
};
// need to do the following for both position, velocity, and colors of the
// particles:

static ZWEngine *self;

// Opengl functions
void ZWEngine::set_render_info() {
    {
        const unsigned char*  version = glGetString(GL_VERSION);
        std::cout << version << std::endl;
        // show gpu information
        int work_grp_size[3];

        glGetIntegeri_v(GL_MAX_COMPUTE_WORK_GROUP_SIZE, 0, &work_grp_size[0]);
        glGetIntegeri_v(GL_MAX_COMPUTE_WORK_GROUP_SIZE, 1, &work_grp_size[1]);
        glGetIntegeri_v(GL_MAX_COMPUTE_WORK_GROUP_SIZE, 2, &work_grp_size[2]);

        printf("max local (in one shader) work group sizes x:%i y:%i z:%i\n",
               work_grp_size[0], work_grp_size[1], work_grp_size[2]); //
        int work_grp_inv;
        glGetIntegerv(GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS, &work_grp_inv);
        printf("max local work group invocations %i\n", work_grp_inv);
    }

    glEnable(GL_DEPTH_TEST);
    glfwSetFramebufferSizeCallback(this->window, framebuffer_size_callback);
    // set compute shader
    //   auto *points = new Particle[NUM_PARTICLES];
    //   for (int i = 0; i < NUM_PARTICLES; ++i) {
    //     points[i].pos = glm::vec4(i % 3, i % 2, 0, 1.0f);
    //   }
    //   points[0].pos = glm::vec4(-0.5, -0.5, 0, 1.0f);
    //   points[1].pos = glm::vec4(-0.5, 0.5, 0, 1.0f);
    //   points[2].pos = glm::vec4(0.5, 0.5, 0, 1.0f);

    float points[] = {-0.5, -0.5, 0, 1.0f, -0.5, 0.5, 0, 1.0f, 0.5, 0.5, 0, 1.0f};
    glGenBuffers(1, &posSSbo);
    glBindBuffer(GL_SHADER_STORAGE_BUFFER, posSSbo);
    glBufferData(GL_SHADER_STORAGE_BUFFER, NUM_PARTICLES * sizeof(float) * 4,
                 points, GL_STATIC_DRAW);
    glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, posSSbo);
    glEnableVertexAttribArray(0);

//    GLint bufMask =
//            GL_MAP_WRITE_BIT | GL_MAP_INVALIDATE_BUFFER_BIT;
//    float *point = static_cast<float *>(glMapBufferRange(GL_SHADER_STORAGE_BUFFER, 0, NUM_PARTICLES * sizeof(float) * 4,
//            NULL));
//    for (int i= 0;i < 12; ++i){
//        std::cout << point[i] << std::endl;
//    }
//        glUnmapBuffer(GL_SHADER_STORAGE_BUFFER);
    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);
    // Set Render
    glBindBuffer(GL_ARRAY_BUFFER, posSSbo);
    glVertexAttribPointer(4, 4, GL_FLOAT, GL_FALSE, 4 * sizeof(GLfloat),
                          (void *) nullptr);

    glEnableVertexAttribArray(4);

    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindVertexArray(0);
    //    float vertices[] = {
    //            0.5f,  0.5f, 0.0f,  // top right
    //            0.5f, -0.5f, 0.0f,  // bottom right
    //            -0.5f, -0.5f, 0.0f,  // bottom left
    //            -0.5f,  0.5f, 0.0f   // top left
    //    };
    //    glGenBuffers(1, &VBO);
    //    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    //    glBufferData(GL_ARRAY_BUFFER, sizeof(points), points, GL_STATIC_DRAW);
    //    glVertexAttribPointer(4, 3, GL_FLOAT, GL_FALSE, 3 * sizeof(float),
    //    (void*)0);

    self = this;
}

void ZWEngine::render_ui() {
    // feed inputs to dear imgui, start new frame
    ImGui_ImplOpenGL3_NewFrame();
    ImGui_ImplGlfw_NewFrame();
    ImGui::NewFrame();
    // Create a window called "Hello, world!" and append into it.
    ImGui::Begin("Hello, world!");
    if (this->uniform_failed_id != -1) {
        std::string tmp = "uniform variable ";
        tmp += std::to_string(uniform_failed_id);
        tmp += " declare failed";
        ImGui::Text("%s", tmp.c_str());
    }

    ImGui::SliderFloat("obj angle: ", &obj_angle, -180.0f, 180.0f);
    ImGui::SliderFloat2("camera angle", &this->main_camera.get_pitch_yaw()[0],
                        -180, 180);
    ImGui::End();
    ImGui::Render();
}

void ZWEngine::render_world() {
    //   glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, posSSbo);

//    this->compute_shader_program->use_shader_program();
//    glDispatchCompute(1, 1, 1);
//    glMemoryBarrier(GL_SHADER_STORAGE_BARRIER_BIT);

    //     clear buffers
    glClearColor(0.8f, 0.8f, 0.8f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glBindVertexArray(VAO);

    this->shader_program->use_shader_program();

    glDrawArrays(GL_TRIANGLES, 0, NUM_PARTICLES);

    ImGui_ImplOpenGL3_RenderDrawData(ImGui::GetDrawData());
}

void ZWEngine::process_input() {
    // check 'ESC' is pressed
    if (glfwGetKey(this->window, GLFW_KEY_ESCAPE) == GLFW_PRESS) {
        glfwSetWindowShouldClose(this->window, true);
    }
}

void framebuffer_size_callback(GLFWwindow *window, int w, int h) {
    glViewport(0, 0, w, h);
    self->get_camera().set_aspect((GLfloat) w / (GLfloat) h);
}

bool first_in = true;
glm::vec2 pre_mouse_pos;
// callback function

void ZWEngine::keycode_callback(GLFWwindow *window, int key, int scancode,
                                int action, int mode) {
    if (glfwGetKey(window, GLFW_KEY_ESCAPE) == GLFW_PRESS) {
        glfwSetWindowShouldClose(window, true);
    }
    if (glfwGetKey(window, GLFW_KEY_W) == GLFW_PRESS)
        self->main_camera.process_keyboard(FORWARD, self->delta_time);
    if (glfwGetKey(window, GLFW_KEY_S) == GLFW_PRESS)
        self->main_camera.process_keyboard(BACKWARD, self->delta_time);
    if (glfwGetKey(window, GLFW_KEY_A) == GLFW_PRESS)
        self->main_camera.process_keyboard(LEFT, self->delta_time);
    if (glfwGetKey(window, GLFW_KEY_D) == GLFW_PRESS)
        self->main_camera.process_keyboard(RIGHT, self->delta_time);
}

void ZWEngine::mouse_callback(GLFWwindow *window, double xpos, double ypos) {
    if (first_in) {
        pre_mouse_pos = glm::vec2(xpos, ypos);
        first_in = false;
    }
    glm::vec2 offset(xpos - pre_mouse_pos.x, pre_mouse_pos.y - ypos);
    pre_mouse_pos = glm::vec2(xpos, ypos);
    self->main_camera.process_mouse_movement(offset);
}

void ZWEngine::scroll_callback(GLFWwindow *window, double xoffset,
                               double yoffset) {
    self->main_camera.process_mouse_scroll(yoffset);
}
