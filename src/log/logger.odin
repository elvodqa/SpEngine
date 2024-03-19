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
    
    str_log := fmt.sbprintf(&builder, "[%d:%d:%d][TRACE] %s\n", hour, min, sec, str)
    
    //cstring(raw_data(console.buffer[:]))
    
    strings.builder_reset(&builder)
    /*
    str_bytes := transmute([]u8)str_log
    item := LogItem{
        str_bytes, .Trace,
    }
    append(&console.items, item) */
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

