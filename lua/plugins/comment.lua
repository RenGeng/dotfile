return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")


    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      -- pre_hook = ts_context_commentstring.create_pre_hook(),
    })
  end,
}
