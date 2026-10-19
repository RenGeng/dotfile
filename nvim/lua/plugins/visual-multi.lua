return {

    "mg979/vim-visual-multi",
    branch = "master",
    dependencies = { "kevinhwang91/nvim-hlslens" },
    config = function()
        -- hlslens integration: https://github.com/kevinhwang91/nvim-hlslens#vim-visual-multi
        local function override_lens(render, pos_list, nearest, idx, _)
            local lnum, col = unpack(pos_list[idx])
            local chunks
            if nearest then
                chunks = { { " ", "Ignore" }, { ("[%d/%d]"):format(idx, #pos_list), "VM_Extend" } }
            else
                chunks = { { " ", "Ignore" }, { ("[%d]"):format(idx), "HlSearchLens" } }
            end
            render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
        end

        local lens_bak
        vim.api.nvim_create_autocmd("User", {
            pattern = { "visual_multi_start", "visual_multi_exit" },
            group = vim.api.nvim_create_augroup("VMlens", {}),
            callback = function(ev)
                local config = require("hlslens.config")
                if ev.match == "visual_multi_start" then
                    lens_bak = config.override_lens
                    config.override_lens = override_lens
                else
                    config.override_lens = lens_bak
                end
                require("hlslens").start()
            end,
        })
    end,
}
