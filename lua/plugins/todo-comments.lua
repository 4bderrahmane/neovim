return {
  "folke/todo-comments.nvim",
  opts = {
    keywords = {
      IMPORTANT = { icon = "!", color = "error", alt = { "!", "URGENT" } },
      QUESTION = { icon = "?", color = "hint", alt = { "Q" } },
      SECTION = { icon = "*", color = "info", alt = { "----" } },
    },
    highlight = {
      -- default expects ":"; you can loosen it if you want TODO without colon
      -- (be careful: looser patterns can create false positives)
      pattern = [[.*<(KEYWORDS)\s*:\?]], -- derived from the default pattern :contentReference[oaicite:14]{index=14}
    },
  },
}
