#version 430 core
out vec4 FragColor;
in vec3 oCol;
in vec2 oTexCoord;
layout(location = 0) uniform sampler2D oTex0;
layout(location = 1) uniform sampler2D oTex1;
layout(location = 5) uniform vec3 light_color;
layout(location = 6) uniform vec3 obj_color;
layout(location = 7) uniform vec3 eye_pos;
layout(location = 8) uniform vec3 light_pos;
layout(location = 9) uniform float Ka;
layout(location = 10) uniform float Kd;
layout(location = 11) uniform float Ks;
layout(location = 12) uniform vec3 La;
layout(location = 13) uniform vec3 Ld;
layout(location = 14) uniform vec3 Ls;
layout(location = 15) uniform vec3 F0;
layout(location = 16) uniform float m;
float PI = 3.14159265f;
in vec3 v_world_pos;
in vec3 v_world_normal;

float  roughness_term(vec3 n,vec3 h);
vec3 fresnel_schlick_approximation(float cos_theta, vec3 F0);
float geometrical_attenuation(vec3 n,vec3 h, vec3 v, vec3 l);
void main() {
    vec3 n = normalize(v_world_normal);
    vec3 l = normalize(light_pos - v_world_pos);
    vec3 h = normalize(l+n);
    vec3 v = normalize(eye_pos-v_world_pos);
    float cos_theta = max(dot(n,v),0);
    vec3 F = fresnel_schlick_approximation(cos_theta,F0);
    float D = roughness_term(n,h);
    float G = geometrical_attenuation(n,h,v,l);
    vec3 ambient = Ka * La;
    vec3 diffuse = Kd * Ld * max(dot(n,l),0.0f);
    vec3 specular = Ks * Ls * F /(PI*cos_theta+0.0001f);
    FragColor = vec4(specular, 1.0);

}




vec3 fresnel_schlick_approximation(float cos_theta, vec3 F0){
    return F0 + (1.0 - F0) * pow(1.0 - cos_theta, 5.0);
}

float  roughness_term(vec3 n,vec3 h){
    float n_dot_h_square = pow(max(dot(n,h),0),2);
    float tan_alpha_square =  (1-n_dot_h_square)/n_dot_h_square;
    float m_square = m * m;
    return exp(-1* tan_alpha_square/m_square)/(4 * m_square *pow(n_dot_h_square,2)+0.0001f);

}
float geometrical_attenuation(vec3 n,vec3 h, vec3 v, vec3 l){
    float n_dot_h = max(dot(n,h),0);
    float n_dot_v = max(dot(n,v),0);
    float n_dot_l = max(dot(n,l),0);
    float v_dot_h = max(dot(v,h),0);
    float no_attenuation = 1.0f;
    float mask_term = 2 * n_dot_h * n_dot_v / (v_dot_h + 0.0001f);
    float shadow_term = 2 * n_dot_h * n_dot_l / (v_dot_h + 0.0001f);
    return min(min(1,mask_term),shadow_term);
}
