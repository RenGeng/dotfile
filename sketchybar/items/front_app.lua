local app_icons = require("helpers.app_icons")

local front_app = sbar.add("item", "front_app", {
	display = "active",
	icon = {
		font = "sketchybar-app-font:Regular:16.0",
	},
	updates = true,
})

front_app:subscribe("front_app_switched", function(env)
	front_app:set({
		icon = app_icons[env.INFO] or app_icons["default"],
		label = { string = env.INFO },
	})
end)
