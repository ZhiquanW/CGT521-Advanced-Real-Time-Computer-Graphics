#include <windows.h>

#include <GL/glew.h>

#include <GL/freeglut.h>

#include <GL/gl.h>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <iostream>

#include "InitShader.h"
#include "LoadMesh.h"
#include "LoadTexture.h"
#include "imgui_impl_glut.h"
#include "VideoMux.h"
#include "Surf.h"
//names of the shader files to load
static const std::string vertex_shader("template_vs.glsl");
static const std::string fragment_shader("template_fs.glsl");

GLuint shader_program = -1;
GLuint texture_id = -1; //Texture map for fish

//names of the mesh and texture files to load
static const std::string mesh_name = "Amago0.obj";
static const std::string texture_name = "AmagoT.bmp";

MeshData mesh_data;
float time_sec = 0.0f;
float angle = 0.0f;
bool recording = false;

GLuint tri_vao;

//light model
glm::vec3 light_pos(0.0f, 1.0f, 2.0f);
glm::vec3 light_color(1.0f, 0.9f, 0.1f);
glm::vec4 ambient(0.4f, 0.6f, 0.2f,1.0f);
glm::vec4 diffuse(0.5, 0.6, 0.1f,0.2f);
glm::vec4 specular(0.1f, 0.2f, 0.8f,0.01f);

std::vector<glm::vec2> model_offset;
    //Draw the user interface using ImGui
void draw_gui()
{
   ImGui_ImplGlut_NewFrame();

   const int filename_len = 256;
   static char video_filename[filename_len] = "capture.mp4";

   ImGui::InputText("Video filename", video_filename, filename_len);
   ImGui::SameLine();
   if (recording == false)
   {
      if (ImGui::Button("Start Recording"))
      {
         const int w = glutGet(GLUT_WINDOW_WIDTH);
         const int h = glutGet(GLUT_WINDOW_HEIGHT);
         recording = true;
         start_encoding(video_filename, w, h); //Uses ffmpeg
      }
      
   }
   else
   {
      if (ImGui::Button("Stop Recording"))
      {
         recording = false;
         finish_encoding(); //Uses ffmpeg
      }
   }

   //create a slider to change the angle variables
   ImGui::SliderFloat("View angle", &angle, -3.141592f, +3.141592f);

   ImGui::Image((void*)texture_id, ImVec2(128,128));


   ImGui::ShowDemoWindow();
   ImGui::Render();
 }

// glut display callback function.
// This function gets called every time the scene gets redisplayed 
void display() {
   // clear the screen
   glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
   glUseProgram(shader_program);

   const int w = glutGet(GLUT_WINDOW_WIDTH);
   const int h = glutGet(GLUT_WINDOW_HEIGHT);
   const float aspect_ratio = float(w) / float(h);
   // PVM
   glm::mat4 M = glm::rotate(angle, glm::vec3(0.0f, 1.0f, 0.0f));
   glm::mat4 V =
       glm::lookAt(glm::vec3(1.5f, 1.5f, 6.0f), glm::vec3(1.5f, 1.5f, 0.0f),
                   glm::vec3(0.0f, 1.0f, 0.0f));
   glm::mat4 P = glm::perspective(3.141592f / 4.0f, aspect_ratio, 0.1f, 100.0f);
   glm::mat4 PVM = P * V * M;
   const GLuint PVM_loc = 0;
   glUniformMatrix4fv(PVM_loc, 1, false, glm::value_ptr(PVM));
   //M
   const GLuint M_Loc = 1;
   glUniformMatrix4fv(M_Loc, 1, false, glm::value_ptr(M));
   // eye position
   const GLuint eye_loc = 2;
   glUniform3fv(eye_loc, 1, glm::value_ptr(glm::vec3(0.0f,1.0f,2.0f)));
   //LIGHT MODEL
   const GLuint light_pos_loc = 20;
   const GLuint ambient_loc = 21;
   const GLuint diffuse_loc = 22;
   const GLuint specular_loc = 23;
   const GLuint light_color_loc = 24;
   glUniform4fv(light_pos_loc, 1, glm::value_ptr(light_pos));
   glUniform4fv(ambient_loc, 1, glm::value_ptr(ambient));
   glUniform4fv(diffuse_loc, 1, glm::value_ptr(diffuse));
   glUniform4fv(specular_loc, 1, glm::value_ptr(specular));
   glUniform3fv(light_color_loc, 1, glm::value_ptr(light_color));
   //TEXTURE
   glActiveTexture(GL_TEXTURE0);
   glBindTexture(GL_TEXTURE_2D, texture_id);
   const GLuint tex_loc = 10;
   glUniform1i(tex_loc, 0);  // we bound our texture to texture unit 0

   draw_surf(tri_vao);
   draw_gui();

   if (recording == true) {
     glFinish();

     glReadBuffer(GL_BACK);
     read_frame_to_encode(&rgb, &pixels, w, h);
     encode_frame(rgb);
   }

   glutSwapBuffers();
 }

// glut idle callback.
//This function gets called between frames
void idle()
{
	glutPostRedisplay();

   const int time_ms = glutGet(GLUT_ELAPSED_TIME);
   time_sec = 0.001f*time_ms;
}

void reload_shader()
{
   GLuint new_shader = InitShader(vertex_shader.c_str(), fragment_shader.c_str());

   if(new_shader == -1) // loading failed
   {
      glClearColor(1.0f, 0.0f, 1.0f, 0.0f);
   }
   else
   {
      glClearColor(0.35f, 0.35f, 0.35f, 0.0f);

      if(shader_program != -1)
      {
         glDeleteProgram(shader_program);
      }
      shader_program = new_shader;

   }
}

// Display info about the OpenGL implementation provided by the graphics driver.
// Your version should be > 4.0 for CGT 521 
void printGlInfo()
{
   std::cout << "Vendor: "       << glGetString(GL_VENDOR)                    << std::endl;
   std::cout << "Renderer: "     << glGetString(GL_RENDERER)                  << std::endl;
   std::cout << "Version: "      << glGetString(GL_VERSION)                   << std::endl;
   std::cout << "GLSL Version: " << glGetString(GL_SHADING_LANGUAGE_VERSION)  << std::endl;
}

void initOpenGl() {
  // Initialize glew so that new OpenGL function names can be used
  glewInit();

  glEnable(GL_DEPTH_TEST);

  reload_shader();

  // Load a mesh and a texture
  mesh_data =
      LoadMesh(mesh_name);  // Helper function: Uses Open Asset Import library.
  texture_id = LoadTexture(
      texture_name.c_str());  // Helper function: Uses FreeImage library
  //
  tri_vao = create_surf_vao();
}

// glut callbacks need to send keyboard and mouse events to imgui
void keyboard(unsigned char key, int x, int y)
{
   ImGui_ImplGlut_KeyCallback(key);
   std::cout << "key : " << key << ", x: " << x << ", y: " << y << std::endl;

   switch(key)
   {
      case 'r':
      case 'R':
         reload_shader();     
      break;
   }
}

void keyboard_up(unsigned char key, int x, int y)
{
   ImGui_ImplGlut_KeyUpCallback(key);
}

void special_up(int key, int x, int y)
{
   ImGui_ImplGlut_SpecialUpCallback(key);
}

void passive(int x, int y)
{
   ImGui_ImplGlut_PassiveMouseMotionCallback(x,y);
}

void special(int key, int x, int y)
{
   ImGui_ImplGlut_SpecialCallback(key);
}

void motion(int x, int y)
{
   ImGui_ImplGlut_MouseMotionCallback(x, y);
}

void mouse(int button, int state, int x, int y)
{
   ImGui_ImplGlut_MouseButtonCallback(button, state);
}


int main (int argc, char **argv)
{
   //Configure initial window state using freeglut
   glutInit(&argc, argv); 
   glutInitDisplayMode (GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH);
   glutInitWindowPosition (5, 5);
   glutInitWindowSize (1280, 720);
   int win = glutCreateWindow ("zhiquan wang");

   printGlInfo();

   //Register callback functions with glut. 
   glutDisplayFunc(display); 
   glutKeyboardFunc(keyboard);
   glutSpecialFunc(special);
   glutKeyboardUpFunc(keyboard_up);
   glutSpecialUpFunc(special_up);
   glutMouseFunc(mouse);
   glutMotionFunc(motion);
   glutPassiveMotionFunc(motion);

   glutIdleFunc(idle);

   initOpenGl();
   ImGui_ImplGlut_Init(); // initialize the imgui system

   //Enter the glut event loop.
   glutMainLoop();
   glutDestroyWindow(win);
   return 0;		
}


