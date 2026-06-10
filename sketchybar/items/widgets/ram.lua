local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local mic = sbar.add("item", "widgets.ram", {
	position = "right",
	update_freq = 2,
	icon = { string = "􀫦", color = colors.fg },
	script = "~/.config/sketchybar/items/plugins/ram.sh",
})
