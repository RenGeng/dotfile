local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local vpn = sbar.add("item", "widgets.vpn", {
	position = "right",
	update_freq = 3,
	script = "~/.config/sketchybar/items/plugins/vpn.sh",
	icon = "",
})
