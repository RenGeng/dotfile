local colors = {
	-- Base16 Default Dark Theme
	dark = 0xff181818,
	dark_grey = 0xff282828,
	grey = 0xff383838,
	light_grey = 0xff585858,
	dark_silver = 0xffb8b8b8,
	silver = 0xffd8d8d8,
	light_silver = 0xffe8e8e8,
	light = 0xfff8f8f8,
	red = 0xffab4642,
	orange = 0xffdc9656,
	yellow = 0xfff7ca88,
	green = 0xffa1b56c,
	cyan = 0xff86c1b9,
	blue = 0xff7cafc2,
	magenta = 0xffba8baf,
	brown = 0xffa16946,

	-- Special colors
	transparent = 0x00000000,
	black = 0xff000000,
	white = 0xffffffff,
}

colors.fg = colors.silver
colors.fg_highlight = colors.blue
colors.fg_secondary = colors.silver
colors.bg = colors.black
colors.border = colors.dark

return colors
