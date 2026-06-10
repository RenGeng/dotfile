local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	icon = {
		font = {
			style = settings.font.style_map["Black"],
			size = 12.0,
		},
	},
	label = {
		width = "dynamic",
		align = "right",
		font = { family = settings.font.style_map["Bold"] },
	},
	position = "right",
	update_freq = 30,
})

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({
		icon = os.date("%a %d %b"),
		label = { string = os.date("%H:%M") },
	})
end)
