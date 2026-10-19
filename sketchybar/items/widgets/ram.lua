local colors = require("colors")

sbar.add("item", "widgets.ram", {
	position = "right",
	update_freq = 2,
	icon = { string = "􀫦", color = colors.fg },
	script = "$CONFIG_DIR/items/plugins/ram.sh",
})
