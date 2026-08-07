local function formatBytes(bytes)
    if bytes == 0 then
        return "0b"
    end

    local k = 1024
    local dm = 1
    local sizes = { "b", "kb", "mb", "gb", "tb", "pb", "eb", "zb", "yb" }

    local i = math.floor(math.log(bytes) / math.log(k))

    local value = bytes / (k ^ i)
    if value >= 100 then
        dm = 0
    end
    local formattedValue = string.format("%." .. dm .. "f", value)

    return formattedValue .. " " .. sizes[i + 1]
end

local colors = require("colors")

local netstat_up = sbar.add("item", {
    position = "right",
    padding_left = 2,
    padding_right = 2,
    background = {
        border_width = 0,
        height = 20,
    },
    icon = {
        string = "􀄨",
        color = colors.yellow,
    },
    label = {
        color = colors.yellow,
        width = "dynamic",
    },
})
-- sbar.add("item", {
-- 	position = "right",
-- 	icon = {
-- 		string = "",
-- 		font = "JetBrainsMono Nerd Font:Regular:16.0",
-- 		color = colors.blue,
-- 	},
-- 	label = { drawing = false },
-- })
local netstat_down = sbar.add("item", {
    position = "right",
    padding_left = 2,
    padding_right = 2,
    background = {
        border_width = 0,
        height = 20,
    },
    icon = {
        string = "􀄩",
        color = colors.green,
    },
    label = {
        color = colors.green,
        width = "dynamic",
    },
})
-- sbar.add("item", {
-- 	position = "right",
-- 	icon = {
-- 		string = "",
-- 		font = "JetBrainsMono Nerd Font:Regular:16.0",
-- 		color = colors.red,
-- 	},
-- 	label = { drawing = false },
-- })

sbar.add("event", "netstat_update")

sbar.exec("~/.config/sketchybar/items/plugins/netstat.sh")

netstat_up:subscribe("netstat_update", function(env)
    local download = formatBytes(env.DOWNLOAD)
    local upload = formatBytes(env.UPLOAD)
    netstat_up:set({
        label = { string = upload },
    })
    netstat_down:set({
        label = { string = download },
    })
end)

local network_bracket = sbar.add("bracket", { netstat_up.name, netstat_down.name }, {
    padding_left = 20,
    padding_right = 0,
    background = {
        color = colors.bg1,
        border_color = colors.blue,
    },
})
