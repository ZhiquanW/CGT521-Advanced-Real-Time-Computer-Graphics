#pragma once
#ifndef __SURF_H__
#define __SURF_H__

#include <GL/glew.h>
#include <windows.h>

// Call this in initOpenGl()
GLuint create_surf_vao();

// Call this in display()
void draw_surf(GLuint vao);

#endif
