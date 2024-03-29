package log

import "core:time"
import "core:fmt"
import "core:strings"
import im "../../odin-imgui"
import "core:c"
import "base:runtime"
import "vendor:glfw"
import "../global"



console: ^Console


Console :: struct {
    name: cstring,
    buffer: [256]u8,
    autoScroll: bool,
    scrollToBottom: bool,
    timestamps: bool,

    items: [dynamic]cstring,

    windowAlpha: f32,
    filterBar: bool,
}

make_console :: proc() -> (console: Console) {
    console.name = "Console"
    console.buffer = {}
    console.autoScroll = true
    console.scrollToBottom = false
    console.timestamps = false

    console.windowAlpha = 1
    console.filterBar = true

    console.items = {}

    return console
}

render_console :: proc(console: ^Console) {
    im.PushStyleVar(.Alpha, console.windowAlpha)
    if !im.Begin(console.name, nil, {.MenuBar}) {
        im.PopStyleVar()
        im.End()
        return
    }
    im.PopStyleVar()

    menuBar(console)
    if console.filterBar {
        filterBar(console)
    }

    logWindow(console)

    im.Separator()

    inputBar(console)

    im.End()
}

filterBar :: proc(console: ^Console) {
    // todo
}

logWindow :: proc(console: ^Console) {
    footerHeightToReserve := im.GetStyle().ItemSpacing.y + im.GetFrameHeightWithSpacing()
    if im.BeginChild("ScrollRegion##", {0, -footerHeightToReserve}, {}, {}) {
        timestamp_width: f32 = im.CalcTextSize("00:00:00:0000").x
        count: int = 0

        im.PushTextWrapPos()
        for item in console.items {
            im.Text(item)
        }

        im.PopTextWrapPos()

        if console.scrollToBottom && (im.GetScrollY() >= im.GetScrollMaxY() || console.autoScroll) {
            im.SetScrollHereY(1)
        }
        console.scrollToBottom = false

        im.EndChild()
    }
}


inputBar :: proc(console: ^Console) {
    inputTextFlags: im.InputTextFlags = {
        .CallbackHistory,
        .CallbackCharFilter,
        //.CallbackCompletion,
        .EnterReturnsTrue,
        //.CallbackAlways,
    }

    reclaimFocus := false

    im.PushItemWidth(-im.GetStyle().ItemSpacing.x * 7)

    if im.InputText("Input", cstring(raw_data(console.buffer[:])), len(console.buffer), {.EnterReturnsTrue}, input_callback) {
        if console.buffer != {} {
            //fmt.println((string)(console.buffer[:]))
            print_console((string)(console.buffer[:]))
            temp := strings.clone_to_cstring(strings.trim_right_null(cast(string)console.buffer[:])) or_else panic("Console temp buf error fuuuckk")
            append(&console.items, temp)
            console.scrollToBottom = true

            parse_command(temp)
        }
        reclaimFocus = true
        console.buffer = {}
    }

    im.PopItemWidth()

    im.SetItemDefaultFocus()
    if reclaimFocus {
        im.SetKeyboardFocusHere(-1)
    }
}


UserData :: struct {
    str: cstring,
    chainCallback: im.InputTextCallback,
    chainCallbackUserData: rawptr
}

input_callback :: proc "c" (data: ^im.InputTextCallbackData) -> c.int {
    context = runtime.default_context()
    trace(data.Buf)
    return 0
}

menuBar :: proc(console: ^Console) {
    if im.BeginMenuBar() {
        if im.BeginMenu("Settings") {


            im.EndMenu()
        }




        im.EndMenuBar()
    }
}



parse_command :: proc(input: cstring) {
    command := strings.clone_from_cstring(input)

    splited := strings.split(command, " ")
    inputs : [dynamic]string
    
    for split in splited {
        if split != "" {
            append(&inputs, split)
        }
    }

    if len(inputs) == 1 {
        if inputs[0] == "clear" {
            console.items = {}
        }
        if inputs[0] == "exit" {
            glfw.SetWindowShouldClose(global.window_main, true)
        }

    }

}













