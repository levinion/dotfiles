hs.logger.setGlobalLogLevel("error")

require("hs.ipc")

require("app")

hs.hotkey.bind({ "ctrl", "cmd", "alt", "shift" }, "r", function()
  hs.reload()
end)
