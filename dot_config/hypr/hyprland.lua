-- Hyprland Lua configuration (0.55+)

hl.env("XCURSOR_SIZE", "24")

hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("dunst -conf ~/.config/dunst/dunstrc")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    general = {
        gaps_in = 5,
        gaps_out = 20,
        border_size = 2,
        col = {
            active_border = "rgba(83a598ff)",
            inactive_border = "rgba(1D2021ff)",
        },
        layout = "master",
    },

    decoration = {
        rounding = 0,
        blur = {
            enabled = false,
            size = 3,
            passes = 1,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("myBezier", {
    type = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({ leaf = "windows", speed = 7, bezier = "myBezier", enabled = true })
hl.animation({ leaf = "windowsOut", speed = 7, bezier = "default", style = "popin 80%", enabled = true })
hl.animation({ leaf = "border", speed = 10, bezier = "default", enabled = true })
hl.animation({ leaf = "borderangle", speed = 8, bezier = "default", enabled = true })
hl.animation({ leaf = "fade", speed = 7, bezier = "default", enabled = true })
hl.animation({ leaf = "workspaces", speed = 6, bezier = "default", enabled = true })

hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })

for _, workspace in ipairs({ "w[tv1]", "f[1]" }) do
    hl.window_rule({ match = { float = false, workspace = workspace }, border_size = 0 })
    hl.window_rule({ match = { float = false, workspace = workspace }, rounding = 0 })
end

require("bind")
