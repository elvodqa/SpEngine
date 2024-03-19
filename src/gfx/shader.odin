package gfx

import gl "vendor:OpenGL"
import glm "core:math/linalg/glsl"
import "../log"

Shader :: struct {
    program: u32,
    uniforms: gl.Uniforms
}

make_shader :: proc(vert_path, frag_path: string) -> (shader: Shader) {
    program, ok := gl.load_shaders_file(vert_path, frag_path)
    if !ok {
        log.error("Error loading shader: ", vert_path, frag_path)
    }
    shader.program = program
    shader.uniforms = gl.get_uniforms_from_program(shader.program)
    return shader
}

set_shader_int :: proc(shader: Shader, name: string, value: i32) {
    gl.Uniform1i(shader.uniforms[name].location, value)
}

set_shader_float :: proc(shader: Shader, name: string, value: f32) {
    gl.Uniform1f(shader.uniforms[name].location, value)
}

set_shader_vec2 :: proc(shader: Shader, name: string, x: f32, y: f32) {
    gl.Uniform2f(shader.uniforms[name].location, x, y)
}

set_shader_vec3 :: proc(shader: Shader, name: string, x: f32, y: f32, z: f32) {
    gl.Uniform3f(shader.uniforms[name].location, x, y, z)
}

set_shader_vec4 :: proc(shader: Shader, name: string, x: f32, y: f32, z: f32, w: f32) {
    gl.Uniform4f(shader.uniforms[name].location, x, y, z, w)
}

set_shader_mat4 :: proc(shader: Shader, name: string, mat: glm.mat4x4) {
    mata := mat
    gl.UniformMatrix4fv(shader.uniforms[name].location, 1, false, &mata[0, 0])
}
