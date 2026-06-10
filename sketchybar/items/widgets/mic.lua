local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local mic = sbar.add("item", "widgets.mic", {
	position = "right",
	update_freq = 3,
	script = "~/.config/sketchybar/items/plugins/mic.sh",
	click_script = "~/.config/sketchybar/items/plugins/mic_click.sh",
})
