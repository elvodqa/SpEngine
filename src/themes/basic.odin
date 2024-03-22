package themes

import im "../../odin-imgui"

dark_basic :: proc() {
    im.GetStyle().Colors[im.Col.Text] = { 1.00, 1.00, 1.00, 1.00 }
    im.GetStyle().Colors[im.Col.TextDisabled] = { 0.50, 0.50, 0.50, 1.00 }
    im.GetStyle().Colors[im.Col.WindowBg] = { 0.10, 0.10, 0.10, 1.00 }
    im.GetStyle().Colors[im.Col.ChildBg] = { 0.00, 0.00, 0.00, 0.00 }
    im.GetStyle().Colors[im.Col.PopupBg] = { 0.19, 0.19, 0.19, 0.92 }
    im.GetStyle().Colors[im.Col.Border] = { 0.19, 0.19, 0.19, 0.29 }
    im.GetStyle().Colors[im.Col.BorderShadow] = { 0.00, 0.00, 0.00, 0.24 }
    im.GetStyle().Colors[im.Col.FrameBg] = { 0.05, 0.05, 0.05, 0.54 }
    im.GetStyle().Colors[im.Col.FrameBgHovered] = { 0.19, 0.19, 0.19, 0.54 }
    im.GetStyle().Colors[im.Col.FrameBgActive] = { 0.20, 0.22, 0.23, 1.00 }
    im.GetStyle().Colors[im.Col.TitleBg] = { 0.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.TitleBgActive] = { 0.06, 0.06, 0.06, 1.00 }
    im.GetStyle().Colors[im.Col.TitleBgCollapsed] = { 0.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.MenuBarBg] = { 0.14, 0.14, 0.14, 1.00 }
    im.GetStyle().Colors[im.Col.ScrollbarBg] = { 0.05, 0.05, 0.05, 0.54 }
    im.GetStyle().Colors[im.Col.ScrollbarGrab] = { 0.34, 0.34, 0.34, 0.54 }
    im.GetStyle().Colors[im.Col.ScrollbarGrabHovered] = { 0.40, 0.40, 0.40, 0.54 }
    im.GetStyle().Colors[im.Col.ScrollbarGrabActive] = { 0.56, 0.56, 0.56, 0.54 }
    im.GetStyle().Colors[im.Col.CheckMark] = { 0.33, 0.67, 0.86, 1.00 }
    im.GetStyle().Colors[im.Col.SliderGrab] = { 0.34, 0.34, 0.34, 0.54 }
    im.GetStyle().Colors[im.Col.SliderGrabActive] = { 0.56, 0.56, 0.56, 0.54 }
    im.GetStyle().Colors[im.Col.Button] = { 0.05, 0.05, 0.05, 0.54 }
    im.GetStyle().Colors[im.Col.ButtonHovered] = { 0.19, 0.19, 0.19, 0.54 }
    im.GetStyle().Colors[im.Col.ButtonActive] = { 0.20, 0.22, 0.23, 1.00 }
    im.GetStyle().Colors[im.Col.Header] = { 0.00, 0.00, 0.00, 0.52 }
    im.GetStyle().Colors[im.Col.HeaderHovered] = { 0.00, 0.00, 0.00, 0.36 }
    im.GetStyle().Colors[im.Col.HeaderActive] = { 0.20, 0.22, 0.23, 0.33 }
    im.GetStyle().Colors[im.Col.Separator] = { 0.28, 0.28, 0.28, 0.29 }
    im.GetStyle().Colors[im.Col.SeparatorHovered] = { 0.44, 0.44, 0.44, 0.29 }
    im.GetStyle().Colors[im.Col.SeparatorActive] = { 0.40, 0.44, 0.47, 1.00 }
    im.GetStyle().Colors[im.Col.ResizeGrip] = { 0.28, 0.28, 0.28, 0.29 }
    im.GetStyle().Colors[im.Col.ResizeGripHovered] = { 0.44, 0.44, 0.44, 0.29 }
    im.GetStyle().Colors[im.Col.ResizeGripActive] = { 0.40, 0.44, 0.47, 1.00 }
    im.GetStyle().Colors[im.Col.Tab] = { 0.00, 0.00, 0.00, 0.52 }
    im.GetStyle().Colors[im.Col.TabHovered] = { 0.14, 0.14, 0.14, 1.00 }
    im.GetStyle().Colors[im.Col.TabActive] = { 0.20, 0.20, 0.20, 0.36 }
    im.GetStyle().Colors[im.Col.TabUnfocused] = { 0.00, 0.00, 0.00, 0.52 }
    im.GetStyle().Colors[im.Col.TabUnfocusedActive] = { 0.14, 0.14, 0.14, 1.00 }
    im.GetStyle().Colors[im.Col.DockingPreview] = { 0.33, 0.67, 0.86, 1.00 }
    im.GetStyle().Colors[im.Col.DockingEmptyBg] = { 1.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.PlotLines] = { 1.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.PlotLinesHovered] = { 1.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.PlotHistogram] = { 1.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.PlotHistogramHovered] = { 1.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.TableHeaderBg] = { 0.00, 0.00, 0.00, 0.52 }
    im.GetStyle().Colors[im.Col.TableBorderStrong] = { 0.00, 0.00, 0.00, 0.52 }
    im.GetStyle().Colors[im.Col.TableBorderLight] = { 0.28, 0.28, 0.28, 0.29 }
    im.GetStyle().Colors[im.Col.TableRowBg] = { 0.00, 0.00, 0.00, 0.00 }
    im.GetStyle().Colors[im.Col.TableRowBgAlt] = { 1.00, 1.00, 1.00, 0.06 }
    im.GetStyle().Colors[im.Col.TextSelectedBg] = { 0.20, 0.22, 0.23, 1.00 }
    im.GetStyle().Colors[im.Col.DragDropTarget] = { 0.33, 0.67, 0.86, 1.00 }
    im.GetStyle().Colors[im.Col.NavHighlight] = { 1.00, 0.00, 0.00, 1.00 }
    im.GetStyle().Colors[im.Col.NavWindowingHighlight] = { 1.00, 0.00, 0.00, 0.70 }
    im.GetStyle().Colors[im.Col.NavWindowingDimBg] = { 1.00, 0.00, 0.00, 0.20 }
    im.GetStyle().Colors[im.Col.ModalWindowDimBg] = { 1.00, 0.00, 0.00, 0.35 }

    style := im.GetStyle()
    style.WindowPadding = { 8.00, 8.00 }
    style.FramePadding = { 5.00, 2.00 }
    style.CellPadding = { 6.00, 6.00 }
    style.ItemSpacing = { 6.00, 6.00 }
    style.ItemInnerSpacing = { 6.00, 6.00 }
    style.TouchExtraPadding = { 0.00, 0.00 }
    style.IndentSpacing = 25
    style.ScrollbarSize = 15
    style.GrabMinSize = 10
    style.WindowBorderSize = 1
    style.ChildBorderSize = 1
    style.PopupBorderSize = 1
    style.FrameBorderSize = 1
    style.TabBorderSize = 1
    style.WindowRounding = 7
    style.ChildRounding = 4
    style.FrameRounding = 3
    style.PopupRounding = 4
    style.ScrollbarRounding = 9
    style.GrabRounding = 3
    style.LogSliderDeadzone = 4
    style.TabRounding = 4
}


light_basic :: proc() {
    im.GetStyle().WindowPadding = { 8.00, 8.00 }
    im.GetStyle().FramePadding = { 5.00, 2.00 }
    im.GetStyle().CellPadding = { 6.00, 6.00 }
    im.GetStyle().ItemSpacing = { 6.00, 6.00 }
    im.GetStyle().ItemInnerSpacing = { 6.00, 6.00 }
    im.GetStyle().TouchExtraPadding = { 0.00, 0.00 }
    im.GetStyle().IndentSpacing = 25
    im.GetStyle().ScrollbarSize = 15
    im.GetStyle().GrabMinSize = 10
    im.GetStyle().WindowBorderSize = 1
    im.GetStyle().ChildBorderSize = 1
    im.GetStyle().PopupBorderSize = 1
    im.GetStyle().FrameBorderSize = 1
    im.GetStyle().TabBorderSize = 1
    im.GetStyle().WindowRounding = 7
    im.GetStyle().ChildRounding = 4
    im.GetStyle().FrameRounding = 3
    im.GetStyle().PopupRounding = 4
    im.GetStyle().ScrollbarRounding = 9
    im.GetStyle().GrabRounding = 3
    im.GetStyle().LogSliderDeadzone = 4
    im.GetStyle().TabRounding = 4
    im.GetStyle().ButtonTextAlign = { 0.5, 0.5 }
    im.GetStyle().SelectableTextAlign = { 0.0, 0.0 }

    im.GetStyle().Colors[im.Col.Text] = { 0.0, 0.0, 0.0, 1.0 }
    im.GetStyle().Colors[im.Col.TextDisabled] = { 0.6, 0.6, 0.6, 1.0 }
    im.GetStyle().Colors[im.Col.WindowBg] = { 0.937, 0.937, 0.937, 1.0 }
    im.GetStyle().Colors[im.Col.ChildBg] = { 0.0, 0.0, 0.0, 0.0 }
    im.GetStyle().Colors[im.Col.PopupBg] = { 1.0, 1.0, 1.0, 0.98 }
    im.GetStyle().Colors[im.Col.Border] = { 0.0, 0.0, 0.0, 0.3 }
    im.GetStyle().Colors[im.Col.BorderShadow] = { 0.0, 0.0, 0.0, 0.0 }
    im.GetStyle().Colors[im.Col.FrameBg] = { 1.0, 1.0, 1.0, 1.0 }
    im.GetStyle().Colors[im.Col.FrameBgHovered] = { 0.258, 0.588, 0.976, 0.4 }
    im.GetStyle().Colors[im.Col.FrameBgActive] = { 0.258, 0.588, 0.976, 0.67 }
    im.GetStyle().Colors[im.Col.TitleBg] = { 0.956, 0.956, 0.956, 1.0 }
    im.GetStyle().Colors[im.Col.TitleBgActive] = { 0.819, 0.819, 0.819, 1.0 }
    im.GetStyle().Colors[im.Col.TitleBgCollapsed] = { 1.0, 1.0, 1.0, 0.51 }
    im.GetStyle().Colors[im.Col.MenuBarBg] = { 0.858, 0.858, 0.858, 1.0 }
    im.GetStyle().Colors[im.Col.ScrollbarBg] = { 0.976, 0.976, 0.976, 0.53 }
    im.GetStyle().Colors[im.Col.ScrollbarGrab] = { 0.686, 0.686, 0.686, 0.8 }
    im.GetStyle().Colors[im.Col.ScrollbarGrabHovered] = { 0.486, 0.486, 0.486, 0.8 }
    im.GetStyle().Colors[im.Col.ScrollbarGrabActive] = { 0.486, 0.486, 0.486, 1.0 }
    im.GetStyle().Colors[im.Col.CheckMark] = { 0.258, 0.588, 0.976, 1.0 }
    im.GetStyle().Colors[im.Col.SliderGrab] = { 0.258, 0.588, 0.976, 0.78 }
    im.GetStyle().Colors[im.Col.SliderGrabActive] = { 0.458, 0.537, 0.8, 0.6 }
    im.GetStyle().Colors[im.Col.Button] = { 0.258, 0.588, 0.976, 0.4 }
    im.GetStyle().Colors[im.Col.ButtonHovered] = { 0.258, 0.588, 0.976, 1.0 }
    im.GetStyle().Colors[im.Col.ButtonActive] = { 0.0588, 0.529, 0.976, 1.0 }
    im.GetStyle().Colors[im.Col.Header] = { 0.258, 0.588, 0.976, 0.31 }
    im.GetStyle().Colors[im.Col.HeaderHovered] = { 0.258, 0.588, 0.976, 0.8 }
    im.GetStyle().Colors[im.Col.HeaderActive] = { 0.258, 0.588, 0.976, 1.0 }
    im.GetStyle().Colors[im.Col.Separator] = { 0.388, 0.388, 0.388, 0.62 }
    im.GetStyle().Colors[im.Col.SeparatorHovered] = { 0.137, 0.439, 0.8, 0.78 }
    im.GetStyle().Colors[im.Col.SeparatorActive] = { 0.137, 0.439, 0.8, 1.0 }
    im.GetStyle().Colors[im.Col.ResizeGrip] = { 0.349, 0.349, 0.349, 0.17 }
    im.GetStyle().Colors[im.Col.ResizeGripHovered] = { 0.258, 0.588, 0.976, 0.67 }
    im.GetStyle().Colors[im.Col.ResizeGripActive] = { 0.258, 0.588, 0.976, 0.95 }
    im.GetStyle().Colors[im.Col.Tab] = { 0.761, 0.796, 0.835, 0.931 }
    im.GetStyle().Colors[im.Col.TabHovered] = { 0.258, 0.588, 0.976, 0.8 }
    im.GetStyle().Colors[im.Col.TabActive] = { 0.592, 0.725, 0.882, 1.0 }
    im.GetStyle().Colors[im.Col.TabUnfocused] = { 0.918, 0.925, 0.933, 0.986 }
    im.GetStyle().Colors[im.Col.TabUnfocusedActive] = { 0.741, 0.82, 0.914, 1.0 }
    im.GetStyle().Colors[im.Col.PlotLines] = { 0.388, 0.388, 0.388, 1.0 }
    im.GetStyle().Colors[im.Col.PlotLinesHovered] = { 1.0, 0.427, 0.349, 1.0 }
    im.GetStyle().Colors[im.Col.PlotHistogram] = { 0.898, 0.698, 0.0, 1.0 }
    im.GetStyle().Colors[im.Col.PlotHistogramHovered] = { 1.0, 0.447, 0.0, 1.0 }
    im.GetStyle().Colors[im.Col.TableHeaderBg] = { 0.776, 0.867, 0.976, 1.0 }
    im.GetStyle().Colors[im.Col.TableBorderStrong] = { 0.569, 0.569, 0.639, 1.0 }
    im.GetStyle().Colors[im.Col.TableBorderLight] = { 0.678, 0.678, 0.737, 1.0 }
    im.GetStyle().Colors[im.Col.TableRowBg] = { 0.0, 0.0, 0.0, 0.0 }
    im.GetStyle().Colors[im.Col.TableRowBgAlt] = { 0.298, 0.298, 0.298, 0.09 }
    im.GetStyle().Colors[im.Col.TextSelectedBg] = { 0.258, 0.588, 0.976, 0.35 }
    im.GetStyle().Colors[im.Col.DragDropTarget] = { 0.258, 0.588, 0.976, 0.95 }
    im.GetStyle().Colors[im.Col.NavHighlight] = { 0.258, 0.588, 0.976, 0.8 }
    im.GetStyle().Colors[im.Col.NavWindowingHighlight] = { 0.698, 0.698, 0.698, 0.7 }
    im.GetStyle().Colors[im.Col.NavWindowingDimBg] = { 0.2, 0.2, 0.2, 0.2 }
    im.GetStyle().Colors[im.Col.ModalWindowDimBg] = { 0.2, 0.2, 0.2, 0.35 }
}

