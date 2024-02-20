---@type MappingsTable
local M = {}

M.disabled = {
  i = {
      ["<CR>"] = "",
  }
}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    -- save and quit shortcuts
    ["<leader>qq"] = { "<cmd>qa!<cr>", "quit all" },
    ["<leader>qw"] = { "<cmd>xa!<cr>", "write and quit all" },
    -- save
    ["<leader>s"] = { "<cmd> w <CR>", "Save file" },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

M.tabufline = {
  plugin = true,

  n = {
    -- cycle through buffers
    ["<A-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<A-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
  },
}


return M
