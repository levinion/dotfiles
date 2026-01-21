require("builtin.layout.tiling").setup({ type = "master&stack" })
require("builtin.layout.fullscreen").setup()
require("builtin.layout.floating").setup()
local ironbar = require("ironbar")

ura.hook.set("prepare", function()
	ura.api.set_env("XDG_CURRENT_DESKTOP", "ura")
	ura.api.set_env("XDG_SESSION_TYPE", "wayland")
	ura.api.set_env("WLR_RENDERER", "gles2")
	ura.api.set_env("WLR_NO_HARDWARE_CURSORS", "0")
	ura.api.set_env("LIBVA_DRIVER_NAME", "nvidia")
	ura.api.set_env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
end)

ura.hook.set("ready", function()
	ura.api.spawn("wlr-randr --output DP-5 --mode 3840x2160@119.879997Hz --scale 2")
	ura.api.set_env("DISPLAY", ":0")
	ura.api.spawn("xwayland-satellite")
	ura.api.spawn("swaybg -i ~/.config/ura/assets/bg.jpg")
	ironbar.spawn()
	ura.api.spawn("mako")
	ura.api.spawn("otd-daemon")
	ura.api.spawn("fcitx5 -rd")
	ura.api.spawn("wl-clip-persist -c both --reconnect-tries 3")
	-- ura.api.spawn([[joystickwake --command 'uracil -c "ura.api.notify_idle_activity()"']])
	ura.api.spawn(
		[[swayidle -w timeout 10 'ura-shell ~/.config/ura/scripts/hide_cursor.lua' resume 'ura-shell -- ~/.config/ura/scripts/hide_cursor.lua -t']]
	)
	ura.api.spawn("ddcmod --init")
	ura.api.set_keyboard_repeat(40, 300)
	ura.api.set_pointer_accel_profile("flat", "*")
	ura.api.set_cursor_theme("default", 18)
end)

ura.hook.set("reload", function() end)

ura.hook.set("focus-change", function()
	ironbar.reload("app_id")
	ironbar.reload("title")
end)

ura.hook.set("workspace-change", function()
	ironbar.reload("workspace")
end)

ura.hook.set("window-app_id-change", function()
	ironbar.reload("app_id")
end)

ura.hook.set("window-title-change", function()
	ironbar.reload("title")
end)

ura.hook.set("window-new", function(e)
	local app_id = ura.api.get_window_app_id(e.id)
	assert(app_id)
	if string.match(app_id, "fzfmenu") then
		ura.layout.set(e.id, "floating")
		ura.api.resize_window(e.id, 1000, 600)
		ura.win.center(e.id)
	elseif string.match(app_id, "XEyes") then
		ura.layout.set(e.id, "floating")
		ura.win.center(e.id)
	elseif string.match(app_id, "scrcpy") then
		ura.layout.set(e.id, "floating")
		ura.api.resize_window(e.id, 640, 360)
		ura.win.center(e.id)
	elseif string.match(app_id, "mpv") then
		ura.layout.set(e.id, "floating")
		ura.api.resize_window(e.id, 1280, 720)
		ura.win.center(e.id)
	elseif string.match(app_id, "xdg%-desktop%-portal%-gtk") then
		ura.layout.set(e.id, "floating")
		ura.api.resize_window(e.id, 1280, 720)
		ura.win.center(e.id)
	elseif string.match(app_id, "com.gabm.satty") then
		ura.layout.set(e.id, "fullscreen")
		ura.api.set_window_z_index(e.id, 320)
	end
end)
