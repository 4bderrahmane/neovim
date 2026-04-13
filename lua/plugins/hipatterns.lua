return {
  {
    "nvim-mini/mini.hipatterns",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local hipatterns = require("mini.hipatterns")

      return {
        highlighters = {
          -- tags
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MyFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MyHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MyTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MyNote" },

          -- headings
          h1 = { pattern = "^#%s+.*$", group = "MyHeading1" },
          h2 = { pattern = "^##%s+.*$", group = "MyHeading2" },
          h3 = { pattern = "^###%s+.*$", group = "MyHeading3" },
          h4 = { pattern = "^####+%s+.*$", group = "MyHeading4" },

          -- other stuff
          bullet = { pattern = "^%s*()[%-%*+]()%s", group = "MyBullet" },
          arrow = { pattern = "=>", group = "MyOperator" },
          r_arrow = { pattern = "->", group = "MyOperator" },
          l_arrow = { pattern = "<-", group = "MyOperator" },
          checkbox_unchecked = { pattern = "%[ %]", group = "MyCheckboxUnchecked" },
          checkbox_checked = { pattern = "%[x%]", group = "MyCheckboxChecked" },

          -- hex colors
          hex_color = hipatterns.gen_highlighter.hex_color(),
        },
      }
    end,
    config = function(_, opts)
      require("mini.hipatterns").setup(opts)

      local function set_hl()
        local set = vim.api.nvim_set_hl

        -- tag colors
        set(0, "MyFixme", { fg = "#ffffff", bg = "#c93c3c", bold = true })
        set(0, "MyHack", { fg = "#1e1e2e", bg = "#f9e2af", bold = true })
        set(0, "MyTodo", { fg = "#1e1e2e", bg = "#89b4fa", bold = true })
        set(0, "MyNote", { fg = "#1e1e2e", bg = "#94e2d5", bold = true })

        -- heading colors
        set(0, "MyHeading1", { fg = "#ff6b6b", bold = true })
        set(0, "MyHeading2", { fg = "#ffd166", bold = true })
        set(0, "MyHeading3", { fg = "#06d6a0", bold = true })
        set(0, "MyHeading4", { fg = "#4cc9f0", bold = true })

        -- misc
        set(0, "MyBullet", { fg = "#cba6f7", bold = true })
        set(0, "MyOperator", { fg = "#f38ba8", bold = true })
        set(0, "MyCheckboxUnchecked", { fg = "#6c7086" })
        set(0, "MyCheckboxChecked", { fg = "#a6e3a1", bold = true })
      end

      -- apply now
      set_hl()

      -- re-apply after every colorscheme switch
      local group = vim.api.nvim_create_augroup("MyHipatternsColors", { clear = true })
      vim.api.nvim_create_autocmd("ColorScheme", {
        group = group,
        callback = set_hl,
      })
    end,
  },
}
