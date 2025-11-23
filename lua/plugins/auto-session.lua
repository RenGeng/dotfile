return {
    "rmagatti/auto-session",
    config = function()
      local auto_session = require("auto-session")
  
      auto_session.setup({
          
          enabled = true, -- Enables/disables auto creating, saving and restoring
          root_dir = vim.fn.stdpath "data" .. "/sessions/", -- Root dir where sessions will be stored
          auto_save = true, -- Enables/disables auto saving session on exit
          auto_restore = true, -- Enables/disables auto restoring session on start
          auto_create = true, -- Enables/disables auto creating new session files. Can take a function that should return true/false if a new session file should be created or not
          auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    })
  
    end,
  }