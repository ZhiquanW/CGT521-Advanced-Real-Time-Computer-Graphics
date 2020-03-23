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
static ZWEngine *self;

// Opengl functions
void ZWEngine::set_render_info() {
    glEnable(GL_DEPTH_TEST);

    // Set Render
    self = this;
    Camera main_cam;
    main_camera.set_pos(glm::vec3(0, 2, 6));
    this->attach_camera(main_camera);
    glfwSetFramebufferSizeCallback(this->window, framebuffer_size_callback);
    shader_program->use_shader_program();

    std::vector<GLfloat> vertices = {-0.5f, -0.5f, -0.5f,  0.0f,  0.0f, -1.0f,
                                     0.5f, -0.5f, -0.5f,  0.0f,  0.0f, -1.0f,
                                     0.5f,  0.5f, -0.5f,  0.0f,  0.0f, -1.0f,
                                     0.5f,  0.5f, -0.5f,  0.0f,  0.0f, -1.0f,
                                     -0.5f,  0.5f, -0.5f,  0.0f,  0.0f, -1.0f,
                                     -0.5f, -0.5f, -0.5f,  0.0f,  0.0f, -1.0f,

                                     -0.5f, -0.5f,  0.5f,  0.0f,  0.0f,  1.0f,
                                     0.5f, -0.5f,  0.5f,  0.0f,  0.0f,  1.0f,
                                     0.5f,  0.5f,  0.5f,  0.0f,  0.0f,  1.0f,
                                     0.5f,  0.5f,  0.5f,  0.0f,  0.0f,  1.0f,
                                     -0.5f,  0.5f,  0.5f,  0.0f,  0.0f,  1.0f,
                                     -0.5f, -0.5f,  0.5f,  0.0f,  0.0f,  1.0f,

                                     -0.5f,  0.5f,  0.5f, -1.0f,  0.0f,  0.0f,
                                     -0.5f,  0.5f, -0.5f, -1.0f,  0.0f,  0.0f,
                                     -0.5f, -0.5f, -0.5f, -1.0f,  0.0f,  0.0f,
                                     -0.5f, -0.5f, -0.5f, -1.0f,  0.0f,  0.0f,
                                     -0.5f, -0.5f,  0.5f, -1.0f,  0.0f,  0.0f,
                                     -0.5f,  0.5f,  0.5f, -1.0f,  0.0f,  0.0f,

                                     0.5f,  0.5f,  0.5f,  1.0f,  0.0f,  0.0f,
                                     0.5f,  0.5f, -0.5f,  1.0f,  0.0f,  0.0f,
                                     0.5f, -0.5f, -0.5f,  1.0f,  0.0f,  0.0f,
                                     0.5f, -0.5f, -0.5f,  1.0f,  0.0f,  0.0f,
                                     0.5f, -0.5f,  0.5f,  1.0f,  0.0f,  0.0f,
                                     0.5f,  0.5f,  0.5f,  1.0f,  0.0f,  0.0f,

                                     -0.5f, -0.5f, -0.5f,  0.0f, -1.0f,  0.0f,
                                     0.5f, -0.5f, -0.5f,  0.0f, -1.0f,  0.0f,
                                     0.5f, -0.5f,  0.5f,  0.0f, -1.0f,  0.0f,
                                     0.5f, -0.5f,  0.5f,  0.0f, -1.0f,  0.0f,
                                     -0.5f, -0.5f,  0.5f,  0.0f, -1.0f,  0.0f,
                                     -0.5f, -0.5f, -0.5f,  0.0f, -1.0f,  0.0f,

                                     -0.5f,  0.5f, -0.5f,  0.0f,  1.0f,  0.0f,
                                     0.5f,  0.5f, -0.5f,  0.0f,  1.0f,  0.0f,
                                     0.5f,  0.5f,  0.5f,  0.0f,  1.0f,  0.0f,
                                     0.5f,  0.5f,  0.5f,  0.0f,  1.0f,  0.0f,
                                     -0.5f,  0.5f,  0.5f,  0.0f,  1.0f,  0.0f,
                                     -0.5f,  0.5f, -0.5f,  0.0f,  1.0f,  0.0f};

    VertexArrayObject cube_vao(true);
    VertexBufferObject cube_vbo(vertices, GL_STATIC_DRAW);
    //pos
    bind_vertex_attribute(0, 3, GL_FLOAT, GL_FALSE, 6 * sizeof(GLfloat), (void *) nullptr);
    bind_vertex_attribute(1,3,GL_FLOAT,GL_FALSE,6 * sizeof(GLfloat), (void *) (3 * sizeof(GLfloat)));
    cube_vao.attach_vbo(cube_vbo.id());
    this->add_vao("tmp_vao", cube_vao);
    ZWEngine::disable_vao();
    // light vao
//    VertexArrayObject light_vao(true);
//    VertexBufferObject light_vbo(vertices,GL_STATIC_DRAW);
//    ElementBufferObject light_ebo(indices, GL_STATIC_DRAW);
//    cube_vao.attach_ebo(light_ebo.id());
//    bind_vertex_attribute(1,3,GL_FLOAT,GL_FALSE,3*sizeof(GLfloat),(void* )nullptr);
//    light_vao.attach_vbo(light_vbo.id());
//    light_vao.attach_ebo(light_ebo.id())
//    this->add_vao("light_vao",light_vao);
//    ZWEngine::disable_vao();
//    Texture tex_0(0);
//    tex_0.load_image("../resources/test0.jpeg");
//    this->add_texture(tex_0);
//    Texture tex_1(1);
//    tex_1.load_image("../resources/test_image.jpg");
//    this->add_texture(tex_1);
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
    ImGui::SliderFloat2("camera angle", &this->main_camera.get_pitch_yaw()[0], -180, 180);
    ImGui::SliderFloat3("Ka: ",&(*Ka)[0],0,1);
    ImGui::SliderFloat3("Kd: ",&(*Kd)[0],0,1);
    ImGui::SliderFloat3("Ks: ",&(*Ks)[0],0,1);
    ImGui::SliderFloat3("La: ", &(*La)[0],0,1);
    ImGui::SliderFloat3("Ld: ", &(*Ld)[0],0,1);
    ImGui::SliderFloat3("Ls: ", &(*Ls)[0],0,1);
    ImGui::SliderFloat3("F0: ",&(*F0)[0],0,1);
    ImGui::SliderFloat("m: ",&m,0,1);
    ImGui::SliderFloat3("light pos: ",&(*(light_pos_ptr))[0],-2,2);
    ImGui::Checkbox("ambient: ", (bool*)(ambient_effect));
    ImGui::Checkbox("diffuse_effect: ",(bool*)(diffuse_effect));
    ImGui::Checkbox("F_effect: ",(bool*)(F_effect));
    ImGui::Checkbox("D_effect: ",(bool*)(D_effect));
    ImGui::Checkbox("G_effect: ",(bool*)(G_effect));

    ImGui::End();
    ImGui::Render();
}

void ZWEngine::render_world() {
    // clear buffers
    glClearColor(0.8f, 0.8f, 0.8f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glm::mat4 model = glm::rotate(glm::radians(this->obj_angle), glm::vec3(0.0f, 1.0f, 0.0f));
    if (!shader_program->set_uniform_mat4fv(2, model)) {
        this->uniform_failed_id = 2;
    }
    glm::mat4 view = this->main_camera.get_view_mat();
    if (!shader_program->set_uniform_mat4fv(3, view)) {
        this->uniform_failed_id = 3;
    }
    glm::mat4 proj = this->main_camera.get_projection_mat();
    if (!shader_program->set_uniform_mat4fv(4, proj)) {
        this->uniform_failed_id = 4;
    }
//scene parameter
    if(!shader_program->set_uniform_vec3(5,(glm::vec3 &)*light_color_ptr)){
        this->uniform_failed_id = 5;
    }
    std::shared_ptr<glm::vec3 > obj_color_ptr = std::make_shared<glm::vec3>(1.0f,1.0f,1.0f);
    if(!shader_program->set_uniform_vec3(6, (glm::vec3 &)*obj_color_ptr)){
        this->uniform_failed_id = 6;
    }
    glm::vec3 eye_pos = this->main_camera.get_pos();
    if(!shader_program->set_uniform_vec3(7,eye_pos)){
        this->uniform_failed_id = 7;
    }

    // material parameters
//    glm::vec3  albedo(0.4,0.2,0.1);
//    if(!shader_program->set_uniform_vec3(8,albedo)){
//        this->uniform_failed_id = 8;
//    }
//    GLfloat metallic = 0.1f;
//    if(!shader_program->set_uniform_float(9,metallic)) {
//        this->uniform_failed_id = 9;
//    }
//    GLfloat roughness = 0.8f;
//    if(!shader_program->set_uniform_float(10,roughness)) {
//        this->uniform_failed_id = 10;
//    }
//    GLfloat ao = 0.2f;
//    if(!shader_program->set_uniform_float(11,ao)) {
//        this->uniform_failed_id = 11;
//    }
//    glm::vec3 light_pos(0.0f,0.0f,2.0f);
    if(!shader_program->set_uniform_vec3(8, (glm::vec3 &)*light_pos_ptr)){
        this->uniform_failed_id = 8;
    }
//    std::cout << Ka->x << std::endl;
//    glm::vec3 tmp_Ka = (*Ka)/255.0f;
//    glm::vec3 tmp_Kd = *Kd/255.0f;
//    glm::vec3 tmp_Ks = *Ks/255.0f;
//    glm::vec3 tmp_La = *La/255.0f;
//    glm::vec3 tmp_Ld = *Ld/255.0f;
//    glm::vec3 tmp_Ls = *Ls/255.0f;
    if(!shader_program->set_uniform_vec3(9,*Ka)) {
        this->uniform_failed_id = 9;
    }
    if(!shader_program->set_uniform_vec3(10,*Kd)) {
        this->uniform_failed_id = 10;
    }
    if(!shader_program->set_uniform_vec3(11,*Ks)) {
        this->uniform_failed_id = 11;
    }
    if(!shader_program->set_uniform_vec3(12,*La)) {
        this->uniform_failed_id = 12;
    }
    if(!shader_program->set_uniform_vec3(13,*Ld)) {
        this->uniform_failed_id = 13;
    }
    if(!shader_program->set_uniform_vec3(14,*Ls)) {
        this->uniform_failed_id = 14;
    }
    glm::vec3 F0_normalized = *this->F0;
//    std::cout << F0->x << std::endl;
    if(!shader_program->set_uniform_vec3(15,F0_normalized)) {
        this->uniform_failed_id = 15;
    }
    if(!shader_program->set_uniform_float(16,m)) {
        this->uniform_failed_id = 16;
    }
    if(!shader_program->set_uniform_bool(17,  *ambient_effect)) {
        this->uniform_failed_id = 17;
    }

    if(!shader_program->set_uniform_bool(18,*diffuse_effect)) {
        this->uniform_failed_id = 18;
    }if(!shader_program->set_uniform_bool(19,*F_effect)) {
        this->uniform_failed_id = 19;
    }if(!shader_program->set_uniform_bool(20,*D_effect)) {
        this->uniform_failed_id = 20;
    }if(!shader_program->set_uniform_bool(21,*G_effect)) {
        this->uniform_failed_id = 21;
    }
//    this->activate_texture();
    this->activate_vao("tmp_vao");
    glDrawArrays(GL_TRIANGLES, 0,36);
    glBindVertexArray(0);
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


void ZWEngine::keycode_callback(GLFWwindow *window, int key, int scancode, int action, int mode) {
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

void ZWEngine::scroll_callback(GLFWwindow *window, double xoffset, double yoffset) {
    self->main_camera.process_mouse_scroll(yoffset);
}





