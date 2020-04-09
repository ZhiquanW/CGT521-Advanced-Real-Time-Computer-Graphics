#version 430
#define M_PI 3.1415927410125732421875f
#define RESTING_DENSITY -1000
#define MASS 65
#define CORE_RADIUS 16
#define GAS_CONSTANT 2000
#define VISCOSITY_COEFFICIENT 250.f
#define BOUNDARY_DAMPING 0.8f;
struct Particle {
	vec4 pos; // positions
	vec4 velocity;
	vec4 acceleration;
	float density;
	float pressure;
	float placeholder_0;
	float placeholder_1;
};
//Vertex positions from the VBO, bound as SSBO
layout(std430, binding=0) buffer particles
{
	Particle ps[];
};
layout(location = 0) uniform float time_step;
layout(location = 2) uniform int particle_num;
layout (local_size_x = 1024, local_size_y = 1, local_size_z = 1) in;

float compute_kernel_poly6(float tmp_dis, float _core_radius) {
	if (tmp_dis >= _core_radius) {
		return 0.0;
	}
	return 315.0f / (64.0f * M_PI * pow(_core_radius, 9)) *pow(pow(_core_radius, 2) - tmp_dis*tmp_dis, 3);
}

vec3 compute_kernel_spiky_hamiltonian(vec3 _offset_vec,  float _core_radius) {
	float tmp_dis = length(_offset_vec);
    if (tmp_dis >= _core_radius) {
        return vec3(0.0f);
    }
	return -45.0 / (M_PI * pow(_core_radius, 6)) * pow(_core_radius - tmp_dis, 2) * normalize(_offset_vec);
}
float compute_kernel_viscosity_laplacian(vec3 _offset_vec, float _core_radius) {
	float tmp_dis = length(_offset_vec);
	if (tmp_dis >= _core_radius) {
		return 0.0;
	}
	return 45.0 / (M_PI * pow(_core_radius, 6)) * (_core_radius - tmp_dis);
}

void main() {
	uint index = gl_GlobalInvocationID.x; //uint index = gl_WorkGroupID.x * gl_WorkGroupSize.x + gl_LocalInvocationID.x;
	uint stride = gl_NumWorkGroups.x * gl_WorkGroupSize.x;
	// calculate prerequisite parameters

	for (uint i = index; i < particle_num; i += stride) {
		//vec4 p0 = ps[i].pos;
		float density = 0.0f; 
		for (uint p_id = 0; p_id < particle_num; ++p_id) {
			if (p_id != i) {
				float tmp_distance = length(ps[i].pos.xyz - ps[p_id].pos.xyz);
				//compute density
				density += MASS * compute_kernel_poly6(tmp_distance, CORE_RADIUS);
			}
		}
		ps[i].density = density;
		ps[i].pressure =  max(GAS_CONSTANT * (density - RESTING_DENSITY),0.0f);
		//ps[i].pos = p0 + vec4(0.001f * sin(vec3(ps[i].pressure)), 0.0);

	}
	barrier();
	// calculate forces
	for (uint i = index; i < particle_num; i += stride) {
		//ps[i].pos = p0 + vec4(0.001f * vec3(sin(1.0f)), 0.0);
		//float density = 0.0f;
		vec3 tmp_pressure_force= vec3(0.0f);
		vec3 tmp_viscosity_force = vec3(0.0f);
		for (uint p_id = 0; p_id < particle_num; ++p_id) {
			if (p_id != i) {
				vec3 offset_vec = ps[i].pos.xyz - ps[p_id].pos.xyz;
				float tmp_distance = length(offset_vec);
				//compute density
				tmp_pressure_force += -MASS * (ps[i].pressure + ps[p_id].pressure) / (2*ps[p_id].density) * compute_kernel_spiky_hamiltonian(offset_vec, CORE_RADIUS);
				tmp_viscosity_force += MASS * VISCOSITY_COEFFICIENT * (ps[p_id].velocity.xyz - ps[i].velocity.xyz) / ps[p_id].density * compute_kernel_viscosity_laplacian(offset_vec, CORE_RADIUS);
			}
		}
		vec3 pressure_acceleration =tmp_pressure_force / ps[i].density;
		vec3 viscosity_acceleration = tmp_viscosity_force / ps[i].density;
		//ps[i].acceleration = vec4(0, -ps[i].pressure, 0,0.0f);// +viscosity_acceleration + vec3(0, -9.8f *1200.0f, 0.0), 0.0f);
		ps[i].acceleration = vec4(0, -9.8f, 0.0, 0.0f);

	}
	//update velocity && position
	barrier();
	for (uint i = index; i < particle_num; i += stride) {
		vec3 new_vel = ps[i].velocity.xyz + ps[i].acceleration.xyz * time_step/100.0f ;
		vec3 new_pos = ps[i].pos.xyz + new_vel * time_step/100.0f;

		//// boundary conditions
		if (new_pos.y < -1) {
			new_pos.y = -1;
			new_vel.y *=  -0.9f;
		} else if (new_pos.y > 450) {
			new_pos.y = 450;
			new_vel.y *= -1 * BOUNDARY_DAMPING;
		}
		if (new_pos.x < -1) {
			new_pos.x = -0.9;
			new_vel.x *= -1 * BOUNDARY_DAMPING;
		} else if (new_pos.x > 200) {
			new_pos.x = 200;
			new_vel.x *= -1 * BOUNDARY_DAMPING;
		}
		if (new_pos.z < -1) {
			new_pos.z = -0.9;
			new_vel.z *= -1 * BOUNDARY_DAMPING;
		} else if (new_pos.z > 200) {
			new_pos.z = 200;
			new_vel.z *= -1 * BOUNDARY_DAMPING;
		}
		ps[i].velocity = vec4(new_vel,0.0f);
		//ps[i].pos = vec4(new_pos,1.0f);
		//vec4 p0 = ps[i].pos;
		//ps[i].pos = p0 + vec4(0.001f * vec3(sin(1.0f)), 0.0);

	}
}