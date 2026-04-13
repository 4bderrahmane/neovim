return {
  -- Useful for clangd/LSP features, not for compilation
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      inlay_hints = {
        inline = false,
      },
    },
  },

  -- Terminal used by code_runner
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = false, -- important: keep output visible
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    },
  },

  -- Compile + run current C++ file inside ToggleTerm
  {
    "CRAG666/code_runner.nvim",
    keys = {
      { "<leader>r", "<cmd>RunCode<CR>", desc = "Compile and run current file" },
      { "<leader>rc", "<cmd>RunClose<CR>", desc = "Close runner" },
      { "<leader>rt", "<cmd>ToggleTerm<CR>", desc = "Toggle terminal" },
    },
    opts = {
      mode = "toggleterm",
      focus = true,
      startinsert = true,
      filetype = {
        cpp = "cd $dir && g++ -std=c++20 -Wall -Wextra -O2 $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    opts = {
      smear_between_buffers = true,
      smear_between_neighbor_lines = true,
      smear_insert_mode = true,
      cursor_color = "#d3cdc3",
      legacy_computing_symbols_support = false,
      time_interval = 17,
      stiffness = 0.6,
      trailing_stiffness = 0.45,
      damping = 0.85,
      distance_stop_animating = 0.1,
      stiffness_insert_mode = 0.5,
      trailing_stiffness_insert_mode = 0.5,
      damping_insert_mode = 0.9,
    },
  },
}
