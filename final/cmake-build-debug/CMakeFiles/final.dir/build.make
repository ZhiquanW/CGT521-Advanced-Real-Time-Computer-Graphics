# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/zhiquan/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.6911.21/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/zhiquan/.local/share/JetBrains/Toolbox/apps/CLion/ch-0/193.6911.21/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/final.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/final.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/final.dir/flags.make

CMakeFiles/final.dir/imgui/imgui.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/imgui/imgui.cpp.o: ../imgui/imgui.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/final.dir/imgui/imgui.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/imgui/imgui.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui.cpp

CMakeFiles/final.dir/imgui/imgui.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/imgui/imgui.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui.cpp > CMakeFiles/final.dir/imgui/imgui.cpp.i

CMakeFiles/final.dir/imgui/imgui.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/imgui/imgui.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui.cpp -o CMakeFiles/final.dir/imgui/imgui.cpp.s

CMakeFiles/final.dir/imgui/imgui_demo.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/imgui/imgui_demo.cpp.o: ../imgui/imgui_demo.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/final.dir/imgui/imgui_demo.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/imgui/imgui_demo.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_demo.cpp

CMakeFiles/final.dir/imgui/imgui_demo.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/imgui/imgui_demo.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_demo.cpp > CMakeFiles/final.dir/imgui/imgui_demo.cpp.i

CMakeFiles/final.dir/imgui/imgui_demo.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/imgui/imgui_demo.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_demo.cpp -o CMakeFiles/final.dir/imgui/imgui_demo.cpp.s

CMakeFiles/final.dir/imgui/imgui_draw.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/imgui/imgui_draw.cpp.o: ../imgui/imgui_draw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/final.dir/imgui/imgui_draw.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/imgui/imgui_draw.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_draw.cpp

CMakeFiles/final.dir/imgui/imgui_draw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/imgui/imgui_draw.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_draw.cpp > CMakeFiles/final.dir/imgui/imgui_draw.cpp.i

CMakeFiles/final.dir/imgui/imgui_draw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/imgui/imgui_draw.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_draw.cpp -o CMakeFiles/final.dir/imgui/imgui_draw.cpp.s

CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.o: ../imgui/imgui_impl_glfw.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_impl_glfw.cpp

CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_impl_glfw.cpp > CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.i

CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_impl_glfw.cpp -o CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.s

CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.o: ../imgui/imgui_impl_opengl3.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_impl_opengl3.cpp

CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_impl_opengl3.cpp > CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.i

CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_impl_opengl3.cpp -o CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.s

CMakeFiles/final.dir/imgui/imgui_widgets.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/imgui/imgui_widgets.cpp.o: ../imgui/imgui_widgets.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/final.dir/imgui/imgui_widgets.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/imgui/imgui_widgets.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_widgets.cpp

CMakeFiles/final.dir/imgui/imgui_widgets.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/imgui/imgui_widgets.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_widgets.cpp > CMakeFiles/final.dir/imgui/imgui_widgets.cpp.i

CMakeFiles/final.dir/imgui/imgui_widgets.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/imgui/imgui_widgets.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/imgui/imgui_widgets.cpp -o CMakeFiles/final.dir/imgui/imgui_widgets.cpp.s

CMakeFiles/final.dir/src/Camera.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/Camera.cpp.o: ../src/Camera.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/final.dir/src/Camera.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/Camera.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Camera.cpp

CMakeFiles/final.dir/src/Camera.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/Camera.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Camera.cpp > CMakeFiles/final.dir/src/Camera.cpp.i

CMakeFiles/final.dir/src/Camera.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/Camera.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Camera.cpp -o CMakeFiles/final.dir/src/Camera.cpp.s

CMakeFiles/final.dir/src/ElementBufferObject.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/ElementBufferObject.cpp.o: ../src/ElementBufferObject.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/final.dir/src/ElementBufferObject.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/ElementBufferObject.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ElementBufferObject.cpp

CMakeFiles/final.dir/src/ElementBufferObject.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/ElementBufferObject.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ElementBufferObject.cpp > CMakeFiles/final.dir/src/ElementBufferObject.cpp.i

CMakeFiles/final.dir/src/ElementBufferObject.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/ElementBufferObject.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ElementBufferObject.cpp -o CMakeFiles/final.dir/src/ElementBufferObject.cpp.s

CMakeFiles/final.dir/src/Mesh.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/Mesh.cpp.o: ../src/Mesh.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/final.dir/src/Mesh.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/Mesh.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Mesh.cpp

CMakeFiles/final.dir/src/Mesh.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/Mesh.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Mesh.cpp > CMakeFiles/final.dir/src/Mesh.cpp.i

CMakeFiles/final.dir/src/Mesh.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/Mesh.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Mesh.cpp -o CMakeFiles/final.dir/src/Mesh.cpp.s

CMakeFiles/final.dir/src/ShaderProgram.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/ShaderProgram.cpp.o: ../src/ShaderProgram.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/final.dir/src/ShaderProgram.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/ShaderProgram.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ShaderProgram.cpp

CMakeFiles/final.dir/src/ShaderProgram.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/ShaderProgram.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ShaderProgram.cpp > CMakeFiles/final.dir/src/ShaderProgram.cpp.i

CMakeFiles/final.dir/src/ShaderProgram.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/ShaderProgram.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ShaderProgram.cpp -o CMakeFiles/final.dir/src/ShaderProgram.cpp.s

CMakeFiles/final.dir/src/Texture.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/Texture.cpp.o: ../src/Texture.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/final.dir/src/Texture.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/Texture.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Texture.cpp

CMakeFiles/final.dir/src/Texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/Texture.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Texture.cpp > CMakeFiles/final.dir/src/Texture.cpp.i

CMakeFiles/final.dir/src/Texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/Texture.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/Texture.cpp -o CMakeFiles/final.dir/src/Texture.cpp.s

CMakeFiles/final.dir/src/VertexArrayObject.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/VertexArrayObject.cpp.o: ../src/VertexArrayObject.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/final.dir/src/VertexArrayObject.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/VertexArrayObject.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/VertexArrayObject.cpp

CMakeFiles/final.dir/src/VertexArrayObject.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/VertexArrayObject.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/VertexArrayObject.cpp > CMakeFiles/final.dir/src/VertexArrayObject.cpp.i

CMakeFiles/final.dir/src/VertexArrayObject.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/VertexArrayObject.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/VertexArrayObject.cpp -o CMakeFiles/final.dir/src/VertexArrayObject.cpp.s

CMakeFiles/final.dir/src/VertexBufferObject.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/VertexBufferObject.cpp.o: ../src/VertexBufferObject.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/final.dir/src/VertexBufferObject.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/VertexBufferObject.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/VertexBufferObject.cpp

CMakeFiles/final.dir/src/VertexBufferObject.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/VertexBufferObject.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/VertexBufferObject.cpp > CMakeFiles/final.dir/src/VertexBufferObject.cpp.i

CMakeFiles/final.dir/src/VertexBufferObject.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/VertexBufferObject.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/VertexBufferObject.cpp -o CMakeFiles/final.dir/src/VertexBufferObject.cpp.s

CMakeFiles/final.dir/src/ZWEngine.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/ZWEngine.cpp.o: ../src/ZWEngine.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/final.dir/src/ZWEngine.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/ZWEngine.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ZWEngine.cpp

CMakeFiles/final.dir/src/ZWEngine.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/ZWEngine.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ZWEngine.cpp > CMakeFiles/final.dir/src/ZWEngine.cpp.i

CMakeFiles/final.dir/src/ZWEngine.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/ZWEngine.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/ZWEngine.cpp -o CMakeFiles/final.dir/src/ZWEngine.cpp.s

CMakeFiles/final.dir/src/custom_func.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/custom_func.cpp.o: ../src/custom_func.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/final.dir/src/custom_func.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/custom_func.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/custom_func.cpp

CMakeFiles/final.dir/src/custom_func.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/custom_func.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/custom_func.cpp > CMakeFiles/final.dir/src/custom_func.cpp.i

CMakeFiles/final.dir/src/custom_func.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/custom_func.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/custom_func.cpp -o CMakeFiles/final.dir/src/custom_func.cpp.s

CMakeFiles/final.dir/src/glad.c.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/glad.c.o: ../src/glad.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/final.dir/src/glad.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/final.dir/src/glad.c.o   -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/glad.c

CMakeFiles/final.dir/src/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/final.dir/src/glad.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/glad.c > CMakeFiles/final.dir/src/glad.c.i

CMakeFiles/final.dir/src/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/final.dir/src/glad.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/glad.c -o CMakeFiles/final.dir/src/glad.c.s

CMakeFiles/final.dir/src/main.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object CMakeFiles/final.dir/src/main.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/main.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/main.cpp

CMakeFiles/final.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/main.cpp > CMakeFiles/final.dir/src/main.cpp.i

CMakeFiles/final.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/main.cpp -o CMakeFiles/final.dir/src/main.cpp.s

CMakeFiles/final.dir/src/stb_image.cpp.o: CMakeFiles/final.dir/flags.make
CMakeFiles/final.dir/src/stb_image.cpp.o: ../src/stb_image.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Building CXX object CMakeFiles/final.dir/src/stb_image.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/final.dir/src/stb_image.cpp.o -c /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/stb_image.cpp

CMakeFiles/final.dir/src/stb_image.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/final.dir/src/stb_image.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/stb_image.cpp > CMakeFiles/final.dir/src/stb_image.cpp.i

CMakeFiles/final.dir/src/stb_image.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/final.dir/src/stb_image.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/src/stb_image.cpp -o CMakeFiles/final.dir/src/stb_image.cpp.s

# Object files for target final
final_OBJECTS = \
"CMakeFiles/final.dir/imgui/imgui.cpp.o" \
"CMakeFiles/final.dir/imgui/imgui_demo.cpp.o" \
"CMakeFiles/final.dir/imgui/imgui_draw.cpp.o" \
"CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.o" \
"CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.o" \
"CMakeFiles/final.dir/imgui/imgui_widgets.cpp.o" \
"CMakeFiles/final.dir/src/Camera.cpp.o" \
"CMakeFiles/final.dir/src/ElementBufferObject.cpp.o" \
"CMakeFiles/final.dir/src/Mesh.cpp.o" \
"CMakeFiles/final.dir/src/ShaderProgram.cpp.o" \
"CMakeFiles/final.dir/src/Texture.cpp.o" \
"CMakeFiles/final.dir/src/VertexArrayObject.cpp.o" \
"CMakeFiles/final.dir/src/VertexBufferObject.cpp.o" \
"CMakeFiles/final.dir/src/ZWEngine.cpp.o" \
"CMakeFiles/final.dir/src/custom_func.cpp.o" \
"CMakeFiles/final.dir/src/glad.c.o" \
"CMakeFiles/final.dir/src/main.cpp.o" \
"CMakeFiles/final.dir/src/stb_image.cpp.o"

# External object files for target final
final_EXTERNAL_OBJECTS =

final: CMakeFiles/final.dir/imgui/imgui.cpp.o
final: CMakeFiles/final.dir/imgui/imgui_demo.cpp.o
final: CMakeFiles/final.dir/imgui/imgui_draw.cpp.o
final: CMakeFiles/final.dir/imgui/imgui_impl_glfw.cpp.o
final: CMakeFiles/final.dir/imgui/imgui_impl_opengl3.cpp.o
final: CMakeFiles/final.dir/imgui/imgui_widgets.cpp.o
final: CMakeFiles/final.dir/src/Camera.cpp.o
final: CMakeFiles/final.dir/src/ElementBufferObject.cpp.o
final: CMakeFiles/final.dir/src/Mesh.cpp.o
final: CMakeFiles/final.dir/src/ShaderProgram.cpp.o
final: CMakeFiles/final.dir/src/Texture.cpp.o
final: CMakeFiles/final.dir/src/VertexArrayObject.cpp.o
final: CMakeFiles/final.dir/src/VertexBufferObject.cpp.o
final: CMakeFiles/final.dir/src/ZWEngine.cpp.o
final: CMakeFiles/final.dir/src/custom_func.cpp.o
final: CMakeFiles/final.dir/src/glad.c.o
final: CMakeFiles/final.dir/src/main.cpp.o
final: CMakeFiles/final.dir/src/stb_image.cpp.o
final: CMakeFiles/final.dir/build.make
final: CMakeFiles/final.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_19) "Linking CXX executable final"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/final.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/final.dir/build: final

.PHONY : CMakeFiles/final.dir/build

CMakeFiles/final.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/final.dir/cmake_clean.cmake
.PHONY : CMakeFiles/final.dir/clean

CMakeFiles/final.dir/depend:
	cd /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug /home/zhiquan/Git-Repositories/CGT521-Advanced-Real-Time-Computer-Graphics/final/cmake-build-debug/CMakeFiles/final.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/final.dir/depend
