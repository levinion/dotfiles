require("builtin.layout.tiling").setup({ type = "horizontal" })
require("builtin.layout.fullscreen").setup()
require("builtin.layout.floating").setup()
local ironbar = require("ironbar")

ura.hook.set("prepare", function()
	ura.api.set_env("XDG_CURRENT_DESKTOP", "ura")
	ura.api.set_env("XDG_SESSION_TYPE", "wayland")
	ura.api.set_env("WLR_RENDERER", "vulkan")
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
	ura.api.set_pointer_accel_profile("flat", "Ninjutso*")
	ura.api.set_cursor_theme("default", 18)
end)

ura.hook.set("output-resume", function()
	ura.api.spawn("wlr-randr --output DP-5 --mode 3840x2160@119.879997Hz --scale 2")
	ura.api.set_pointer_accel_profile("flat", "Ninjutso*")
end)

ura.hook.set("reload", function() end)

ironbar.setup_hooks()

ura.hook.set("window-new", function(e)
	local win = ura.class.UraWindow:new(e.id)
	local app_id = win:app_id()
	assert(app_id)
	if string.match(app_id, "fzfmenu") then
		win:set_layout("floating")
		win:resize(1000, 600)
		win:center()
	elseif string.match(app_id, "XEyes") then
		win:set_layout("floating")
		win:center()
	elseif string.match(app_id, "scrcpy") then
		win:set_layout("floating")
		win:resize(640, 360)
		win:center()
	elseif string.match(app_id, "mpv") then
		win:set_layout("floating")
		win:resize(1280, 720)
		win:center()
	elseif string.match(app_id, "xdg%-desktop%-portal%-gtk") then
		win:set_layout("floating")
		win:resize(1280, 720)
		win:center()
	elseif string.match(app_id, "yazi") then
		win:set_layout("floating")
		win:resize(1280, 720)
		win:center()
	elseif string.match(app_id, "com.gabm.satty") then
		win:set_layout("fullscreen")
		win:set_z_index(320)
	elseif string.match(app_id, "zenity") then
		win:set_layout("floating")
		win:center()
	end
end)
