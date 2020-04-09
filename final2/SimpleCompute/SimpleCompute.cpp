#include <windows.h>

#include <GL/glew.h>

#include <GL/freeglut.h>

#include <GL/gl.h>
#include <GL/glext.h>

#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/transform.hpp>
#include <glm/gtc/type_ptr.hpp>

#include <iostream>
#include <vector>

#include "InitShader.h"
#include "imgui_impl_glut.h"
#include "VideoMux.h"
#include "DebugCallback.h"

#define PARTICLE_NUM 1000
struct Particle {
	glm::vec4 pos; // positions
	glm::vec4 velocity;
	glm::vec4 acceleration;
	float density =0.0f;
	float pressure = 0.0f;
	float placeholder_0;
	float placeholder_1;
};
//names of the shader files to load
static const std::string vertex_shader("template_vs.glsl");
static const std::string fragment_shader("template_fs.glsl");

static const std::string compute_shader("template_cs.glsl");

GLuint shader_program = -1;
GLuint compute_program = -1;
GLuint vao = -1;
GLuint vbo = -1;

float time_sec = 0.0f;
float angle = 0.0f;
//Draw the user interface using ImGui
void draw_gui() {
	ImGui_ImplGlut_NewFrame();

	//create a slider to change the angle variables
	ImGui::SliderFloat("View angle", &angle, -3.141592f, +3.141592f);

	static glm::vec3 pos(0.0f);
	if (ImGui::SliderFloat3("Position", &pos.x, -1.0f, +1.0f)) {
		glUseProgram(compute_program);
		const int pos_loc = 2;
		glUniform3f(pos_loc, pos.x, pos.y, pos.z);
	}

	ImGui::Render();
}

// glut display callback function.
// This function gets called every time the scene gets redisplayed 
void display() {
	//clear the screen
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	//Render points
	glUseProgram(shader_program);

	const int w = glutGet(GLUT_WINDOW_WIDTH);
	const int h = glutGet(GLUT_WINDOW_HEIGHT);
	const float aspect_ratio = float(w) / float(h);

	glm::mat4 M = glm::rotate(angle, glm::vec3(0.0f, 1.0f, 0.0f)) * glm::scale(glm::vec3(1.0f));
	glm::mat4 V = glm::lookAt(glm::vec3(200.0f, 420.0f, 200.0f), glm::vec3(0.0f, 0.0f, 0.0f), glm::vec3(0.0f, 1.0f, 0.0f));
	glm::mat4 P = glm::perspective(3.141592f / 4.0f, aspect_ratio, 0.1f, 100.0f);

	glm::mat4 PVM = P * V * M;
	glUniformMatrix4fv(0, 1, false, glm::value_ptr(PVM));


	glBindVertexArray(vao);
	glDrawArrays(GL_POINTS, 0, PARTICLE_NUM);

	draw_gui();


	glutSwapBuffers();

	//Run compute shader
	glUseProgram(compute_program);


	int particle_num_loc = 2;
	glUniform1i(particle_num_loc, PARTICLE_NUM);
	int block_size_x = 1024;
	int numBlocks = (PARTICLE_NUM + block_size_x - 1) / block_size_x;
	glDispatchCompute(numBlocks, 1, 1);

	//glBindBuffer(GL_SHADER_STORAGE_BUFFER, vbo);
	//std::vector<Particle> tmp_p(PARTICLE_NUM);
	//void * tmp_ptr = glMapBufferRange(GL_SHADER_STORAGE_BUFFER, 0, PARTICLE_NUM * sizeof(Particle),NULL);
	//memcpy(tmp_ptr, tmp_p.data(), sizeof(tmp_p));
	//for (int i = 0; i < 12; ++i) {
	//	std::cout << tmp_p[i].density << std::endl;
	//}
	//glUnmapBuffer(GL_SHADER_STORAGE_BUFFER);
}
// glut idle callback.
//This function gets called between frames
void idle() {
	glutPostRedisplay();

	const int time_ms = glutGet(GLUT_ELAPSED_TIME);
	time_sec = 0.001f * time_ms;


	const int time_loc = 0;
	glUseProgram(compute_program);
	glUniform1f(time_loc, time_sec);

	//glUseProgram(shader_program);
	//glUniform1f(time_loc, time_sec);
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


	// opengl setup
	{
		//Initialize glew so that new OpenGL function names can be used
		glewInit();
		RegisterCallback();
		glEnable(GL_DEPTH_TEST);
		//Allow setting point size in fragment shader
		glEnable(GL_PROGRAM_POINT_SIZE);
		glClearColor(0.1f, 0.2f, 0.3f, 1.0f);

	}
	// enable shader program
	{
		shader_program = InitShader(vertex_shader.c_str(), fragment_shader.c_str());
		compute_program = InitShader(compute_shader.c_str());
	}

	// init particle info
	{

	}

	const int pos_loc = 0;
	//Put 25 vertices into a VBO
	std::vector<Particle> particles;
	glm::uvec3 cube_size(10, 10, 10);
	GLfloat interval = 16.0f;
	//init 
	for (int i = 0; i < PARTICLE_NUM; ++i) {
		Particle tmp_p;
		tmp_p.pos = glm::vec4((i % cube_size.x) * interval, i / cube_size.x % cube_size.y * interval,( i / cube_size.x / cube_size.y % cube_size.z )* interval,1.0f) ;
		tmp_p.velocity = glm::vec4(0.0f);
		tmp_p.acceleration = glm::vec4(0.0f);
		tmp_p.pressure = 0.0f;
		tmp_p.density = 0.0f;
		particles.push_back(tmp_p);
	}


	glGenVertexArrays(1, &vao);
	glBindVertexArray(vao);
	unsigned int vbo;

	glGenBuffers(1, &vbo);
	glBindBuffer(GL_ARRAY_BUFFER, vbo);
	glBufferData(GL_ARRAY_BUFFER, particles.size() * sizeof(Particle), particles.data(), GL_STATIC_DRAW);
	glEnableVertexAttribArray(pos_loc);
	glVertexAttribPointer(pos_loc, 4, GL_FLOAT, GL_FALSE, sizeof(Particle), 0);
	glBindVertexArray(0);

	//Bind VBO as SSBO so we can modify it in shader
	glBindBuffer(GL_SHADER_STORAGE_BUFFER, vbo);
	glBindBufferBase(GL_SHADER_STORAGE_BUFFER, 0, vbo); //buffer is declared with binding=0 in shader
}
// glut callbacks need to send keyboard and mouse events to imgui
void keyboard(unsigned char key, int x, int y)
{
   ImGui_ImplGlut_KeyCallback(key);
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


int main(int argc, char** argv) {
#if _DEBUG
	glutInitContextFlags(GLUT_DEBUG);
#endif
	glutInitContextVersion(4, 3);

	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH);
	glutInitWindowPosition(5, 5);
	glutInitWindowSize(1280, 720);
	int win = glutCreateWindow("Simple Compute");

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


