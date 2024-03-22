package main

import "core:fmt"
import "core:strings"
import "core:c"
import "base:runtime"
import "vendor:glfw"
import gl "vendor:OpenGL"

import "global"
import "log"
import "gfx"
import im "../odin-imgui"
import "../odin-imgui/imgui_impl_glfw"
import "../odin-imgui/imgui_impl_opengl3"
import "themes"

// Viewport
FBO : u32
RBO : u32
TEXTURE_SCREEN : u32

clearColor : [3]f32 = {203.0/255.0, 105.0/255.0, 50.0/255.0}


main :: proc() {
    console := log.make_console()

    log.init(&console)
    log.trace("Log initialized")

    log.trace("OS: ", ODIN_OS)
    log.trace("ARCH: ", ODIN_ARCH)

    if glfw.Init() != true {
        log.error("Error initializing GLFW")
    }

    when ODIN_OS == .Darwin {
        glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 4)
        glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 1)
        log.trace("Hinted OpenGL 4.1")
    } else {
        glfw.WindowHint(glfw.CONTEXT_VERSION_MAJOR, 4)
        glfw.WindowHint(glfw.CONTEXT_VERSION_MINOR, 6)
        log.trace("Hinted OpenGL 4.6")
    }
    glfw.WindowHint(glfw.OPENGL_FORWARD_COMPAT, glfw.TRUE)
    glfw.WindowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE)

    global.window_main = glfw.CreateWindow(800, 600, "GuiKit", nil, nil)
    if (global.window_main == nil) {
        log.error("Error initializing main window")
    } else {
       log.trace("Initialized window");
    }
    
    
    glfw.MakeContextCurrent(global.window_main)


    glfw.SetErrorCallback(error_callback)
    glfw.SetFramebufferSizeCallback(global.window_main, resize_callback)

    when ODIN_OS == .Darwin {
        gl.load_up_to(int(4), 1, glfw.gl_set_proc_address) 
        log.trace("Loaded OpenGL 4.1")
    } else {
        gl.load_up_to(int(4), 6, glfw.gl_set_proc_address) 
        log.trace("Loaded OpenGL 4.6")
    }

    glfw.MaximizeWindow(global.window_main)

    im.CHECKVERSION()
    im.CreateContext()
	defer im.DestroyContext()
	io := im.GetIO()
	io.ConfigFlags += {.NavEnableKeyboard, .NavEnableGamepad}
	when im.IMGUI_BRANCH == "docking" {
		io.ConfigFlags += {.DockingEnable}
		io.ConfigFlags += {.ViewportsEnable}

		style := im.GetStyle()
		style.WindowRounding = 0
		style.Colors[im.Col.WindowBg].w = 1

	}

    im.StyleColorsDark()
    imgui_impl_glfw.InitForOpenGL(global.window_main, true)
    defer imgui_impl_glfw.Shutdown()
    imgui_impl_opengl3.Init("#version 150")
    defer imgui_impl_opengl3.Shutdown()

    create_framebuffer()

    themes.dark_basic()

    for !glfw.WindowShouldClose(global.window_main) {
        glfw.PollEvents()
        
          
        gl.ClearColor(0.3, 0.3, 0.3, 1)
        gl.Clear(gl.COLOR_BUFFER_BIT)


        imgui_impl_opengl3.NewFrame()
	      imgui_impl_glfw.NewFrame()
            
        
        im.NewFrame()
        im.DockSpaceOverViewport()

        if im.BeginMainMenuBar() {
            if im.BeginMenu("File") {
                if im.MenuItem("Exit", "Alt+F4") {
                    glfw.SetWindowShouldClose(global.window_main, true)
                }
                im.EndMenu()
            }
            if im.BeginMenu("View") {
                // themes
                if im.BeginMenu("Themes") {
                    if im.MenuItem("Dark") {
                        themes.dark_basic()
                    }
                    if im.MenuItem("Light") {
                        themes.light_basic()
                    }
                    im.Separator()
                    if im.MenuItem("Valve") {
                        themes.valve()
                    }

                    im.EndMenu()
                }

                im.EndMenu()
            }
            
            im.EndMainMenuBar()
        }   

        
        if im.Begin("Viewport Output") {
            ww := im.GetContentRegionAvail().x
            wh := im.GetContentRegionAvail().y

            rescale_framebuffer(ww, wh)
            pos := im.GetCursorScreenPos()
            draw_list := im.GetWindowDrawList()
            im.DrawList_AddImage(draw_list, rawptr(uintptr(TEXTURE_SCREEN)), {pos.x, pos.y}, {pos.x+ww, pos.y+wh}, {0, 1}, {1, 0})
        } 
        im.End()

        if im.Begin("DebugConfig") {
            im.GetIO().DeltaTime = 1 / 60

            im.ColorEdit3("ClearColor", &clearColor)
            im.Text("average %.3f", 1000.0 / io.Framerate)
            im.Text("ms/frame (%.1f FPS)", io.Framerate)

            im.Text("Console size: ")
            im.SameLine()
            str := fmt.ctprintf("%v", len(console.items))
            im.Text(str)
        }
        im.End()

        if im.Begin("Entities") {
           
        }
        im.End()

        if im.Begin("Properties") {
          
        }
        im.End()

        
        log.render_console(&console)

        im.Render()
    
        display_w, display_h := glfw.GetFramebufferSize(global.window_main)
        gl.Viewport(0, 0, display_w, display_h)


        bind_framebuffer()
        
        gl.ClearColor(clearColor[0], clearColor[1], clearColor[2], 1)
        gl.Clear(gl.COLOR_BUFFER_BIT)
        

        unbind_framebuffer()

        imgui_impl_opengl3.RenderDrawData(im.GetDrawData())


    	when im.IMGUI_BRANCH == "docking" {
            backup_current_window := glfw.GetCurrentContext()
            im.UpdatePlatformWindows()
            im.RenderPlatformWindowsDefault()
            glfw.MakeContextCurrent(backup_current_window)
    	}


        glfw.SwapBuffers(global.window_main)
    }

    glfw.Terminate()
}

create_framebuffer :: proc() {
    gl.GenFramebuffers(1, &FBO)
    gl.BindFramebuffer(gl.FRAMEBUFFER, FBO)

    gl.GenTextures(1, &TEXTURE_SCREEN)
    gl.BindTexture(gl.TEXTURE_2D, TEXTURE_SCREEN)
    w, h := glfw.GetWindowSize(global.window_main)
    gl.TexImage2D(gl.TEXTURE_2D, 0, gl.RGB, auto_cast w, auto_cast h, 0, gl.RGB, gl.UNSIGNED_BYTE, nil)
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR)
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR)
    gl.FramebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, TEXTURE_SCREEN, 0)

    gl.GenRenderbuffers(1, &RBO)
    gl.BindRenderbuffer(gl.RENDERBUFFER, RBO)
    gl.RenderbufferStorage(gl.RENDERBUFFER, gl.DEPTH24_STENCIL8, auto_cast w, auto_cast h)
    gl.FramebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, gl.RENDERBUFFER, RBO)


    if gl.CheckFramebufferStatus(gl.FRAMEBUFFER) != gl.FRAMEBUFFER_COMPLETE {
        log.error("ERROR::FRAMEBUFFER:: Framebuffer is not complete!")
    }

    gl.BindFramebuffer(gl.FRAMEBUFFER, 0)
    gl.BindTexture(gl.TEXTURE_2D, 0)
    gl.BindRenderbuffer(gl.RENDERBUFFER, 0)

}

bind_framebuffer :: proc() {
    gl.BindFramebuffer(gl.FRAMEBUFFER, FBO)
}

unbind_framebuffer :: proc() {
    gl.BindFramebuffer(gl.FRAMEBUFFER, 0)
}

rescale_framebuffer :: proc(width, height: f32) {
    gl.BindTexture(gl.TEXTURE_2D, TEXTURE_SCREEN) 
    gl.TexImage2D(gl.TEXTURE_2D, 0, gl.RGB, auto_cast width, auto_cast height, 0, gl.RGB, gl.UNSIGNED_BYTE, nil)
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR)
    gl.TexParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR)
    gl.FramebufferTexture2D(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, TEXTURE_SCREEN, 0)

    gl.BindRenderbuffer(gl.RENDERBUFFER, RBO)
    gl.RenderbufferStorage(gl.RENDERBUFFER, gl.DEPTH24_STENCIL8, auto_cast width, auto_cast height)
    gl.FramebufferRenderbuffer(gl.FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, gl.RENDERBUFFER, RBO)
}


resize_callback :: proc "c" (window: glfw.WindowHandle, width, height: c.int) {
    context = runtime.default_context()

    //log.trace("Main window resized: ", width, "x", height)
}

error_callback :: proc "c" (code: i32, description: cstring) {
    context = runtime.default_context()
    // Related to ImGui but I have no clue so let's ignore it for now
    if code == 65539 {
       return 
    }

    builder: strings.Builder
    strings.builder_init(&builder)

    res := fmt.sbprintf(&builder, "glfw: %i: %s", code, description)
    log.error(res)
    strings.builder_destroy(&builder)
}
