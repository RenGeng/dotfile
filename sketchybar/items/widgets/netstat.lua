local colors = require("colors")

-- Execute the event provider binary which provides the event "network_update"
-- for the network interface "en0", which is fired every 2.0 seconds.
sbar.exec(
    "killall network_load >/dev/null; $CONFIG_DIR/helpers/event_providers/network_load/bin/network_load en0 network_update 2.0"
)

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

netstat_up:subscribe("network_update", function(env)
    netstat_up:set({ label = { string = env.upload } })
    netstat_down:set({ label = { string = env.download } })
end)

sbar.add("bracket", { netstat_up.name, netstat_down.name }, {
    padding_left = 20,
    padding_right = 0,
    background = { border_color = colors.blue },
})
