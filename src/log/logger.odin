package log

import "core:time"
import "core:fmt"
import "core:strings"



builder: strings.Builder

init :: proc(_console: ^Console) {
    strings.builder_init(&builder)
    console = _console
}

deinit :: proc() {
    strings.builder_destroy(&builder)
}

trace :: proc(args: ..any) {
    now := time.now()
    hour, min, sec := time.clock_from_time(now)

    str := fmt.sbprint(&builder, ..args)

    fmt.printf("[%d:%d:%d][TRACE] %s\n", hour, min, sec, str)
    
    //str_log := fmt.sbprintf(&builder, "[%d:%d:%d][TRACE] %s\n", hour, min, sec, str)
    
    strings.builder_reset(&builder)

    temp := strings.clone_to_cstring(strings.trim_right_null(cast(string)str)) or_else panic("Console temp buf error fuuuckk")
    
    append(&console.items, temp)
}

error :: proc(args: ..any) {
    now := time.now()
    hour, min, sec := time.clock_from_time(now)

    str := fmt.sbprint(&builder, ..args)

    fmt.printf("[%d:%d:%d][ERROR] %s\n", hour, min, sec, str)

    strings.builder_reset(&builder)
}

print_console :: proc(args: ..any) {
    now := time.now()
    hour, min, sec := time.clock_from_time(now)

    str := fmt.sbprint(&builder, ..args)

    fmt.printf("[%d:%d:%d][CONSOLE] %s\n", hour, min, sec, str)

    strings.builder_reset(&builder)
}

