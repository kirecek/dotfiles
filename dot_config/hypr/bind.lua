local function bind(keys, dispatcher, flags)
    hl.bind(keys, dispatcher, flags)
end

local function exec(keys, command)
    bind(keys, hl.dsp.exec_cmd(command))
end

bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("alacritty"))
bind("SUPER + Q", hl.dsp.window.close())
bind("SUPER + SHIFT + ALT + E", hl.dsp.exit())
bind("SUPER + SPACE", hl.dsp.window.float({ action = "toggle" }))
bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

bind("SUPER + RETURN", hl.dsp.layout("swapwithmaster master"))
bind("SUPER + comma", hl.dsp.workspace.move({ monitor = "l" }))
bind("SUPER + period", hl.dsp.workspace.move({ monitor = "r" }))
bind("SUPER + J", hl.dsp.layout("cyclenext"))
bind("SUPER + K", hl.dsp.layout("cycleprev"))
bind("SUPER + H", hl.dsp.layout("mfact -0.1"))
bind("SUPER + L", hl.dsp.layout("mfact 0.1"))

for i = 1, 9 do
    bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
    bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

exec("SUPER + P", "wofi --show drun")
exec("SUPER + V", "cliphist list | wofi --dmenu | cliphist decode | wl-copy")
exec("SUPER + SHIFT + D", "cliphist list | wofi --dmenu | cliphist delete")
exec("SUPER + PRINT", "hyprshot -m window")
exec("Print", "hyprshot -m output")
exec("SHIFT + PRINT", "hyprshot -m region")

local brightness = "sudo brillo -q -%s 1 && dunstify -h int:value:\"$(( ($(cat /sys/class/backlight/*/brightness) * 100) / $(cat /sys/class/backlight/*/max_brightness) ))\" -i ~/.config/dunst/assets/brightness.svg -t 500 -r 2593 \"Brightness: $(( ($(cat /sys/class/backlight/*/brightness) * 100) / $(cat /sys/class/backlight/*/max_brightness) ))%%\""
exec("XF86MonBrightnessDown", string.format(brightness, "U"))
exec("XF86MonBrightnessUp", string.format(brightness, "A"))

exec("XF86AudioRaiseVolume", "pamixer -i 5 && dunstify -h int:value:\"$(pamixer --get-volume)\" -i ~/.config/dunst/assets/volume.svg -t 500 -r 2593 \"Volume: $(pamixer --get-volume) %%\"")
exec("XF86AudioLowerVolume", "pamixer -d 5 && dunstify -h int:value:\"$(pamixer --get-volume)\" -i ~/.config/dunst/assets/volume.svg -t 500 -r 2593 \"Volume: $(pamixer --get-volume) %%\"")
exec("XF86AudioMute", "pamixer -t && dunstify -i ~/.config/dunst/assets/$(pamixer --get-mute | grep -q \"true\" && echo \"volume-mute.svg\" || echo \"volume.svg\") -t 500 -r 2593 \"Toggle Mute\"")
exec("XF86AudioPlay", "playerctl play-pause")
exec("XF86AudioNext", "playerctl next")
exec("XF86AudioPrev", "playerctl previous")
exec("XF86AudioStop", "playerctl stop")
