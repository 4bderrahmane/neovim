-- ~/.config/nvim/lua/plugins/ui.lua
return {
  -- SNACKS
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        enabled = true,
        timeout = 2500,
      },
      scroll = {
        enabled = false, -- disable if you don't like animated scrolling
      },
      words = {
        enabled = false, -- disable word reference highlighting if it annoys you
      },
      dashboard = {
        preset = {
          header = [[
██╗   ██╗██╗
██║   ██║██║
██║   ██║██║
╚██╗ ██╔╝██║
 ╚████╔╝ ██║
  ╚═══╝  ╚═╝
          ]],
        },
      },
    },
  },

  -- LUALINE
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "auto"
      opts.options.globalstatus = true
      opts.options.component_separators = { left = "│", right = "│" }
      opts.options.section_separators = { left = "", right = "" }

      -- keep it cleaner
      opts.sections.lualine_a = { "mode" }
      opts.sections.lualine_b = { "branch" }
      opts.sections.lualine_y = {
        { "progress", separator = " ", padding = { left = 1, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }
      opts.sections.lualine_z = {}

      return opts
    end,
  },

  -- DROPBAR
  {
    "Bekaboo/dropbar.nvim",
    keys = {
      {
        "<leader>;",
        function()
          require("dropbar.api").pick()
        end,
        desc = "Pick symbols in winbar",
      },
      {
        "[;",
        function()
          require("dropbar.api").goto_context_start()
        end,
        desc = "Go to start of current context",
      },
      {
        "];",
        function()
          require("dropbar.api").select_next_context()
        end,
        desc = "Select next context",
      },
    },
    opts = {
      bar = {
        padding = {
          left = 0,
          right = 1,
        },
        truncate = true,
      },
      icons = {
        ui = {
          bar = {
            separator = " > ",
            extends = "…",
          },
          menu = {
            indicator = " > ",
          },
        },
      },
    },
  },
}
