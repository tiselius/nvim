require("mini.files").setup({
        cwd_update  = false,
    mappings = {
        close       = '<esc>',
        go_in       = 'l',
        go_in_plus  = '<enter>',
        go_out      = 'h',
        go_out_plus = 'H',
        mark_goto   = "'",
        mark_set    = 'm',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
    },
    windows = {
        preview = true,
        width_focus = 30,
        width_preview = 80,
    },
})
