package editor 

import im "../../odin-imgui"
import "core:strings"


CodeEditor :: struct {
    name: string,
    buffer: [256*256]u8,
}


make_code_editor :: proc() -> CodeEditor {
    editor := CodeEditor{}
    editor.name = ""
    return editor
}

render_editor :: proc(editor: ^CodeEditor) {
    editor_name := strings.clone_to_cstring(editor.name)
    if im.Begin("Script Editor") {
        

        if im.InputTextMultiline("##editor", cstring(raw_data(editor.buffer[:])), len(editor.buffer)) {

        }
    
    }
    im.End()

}