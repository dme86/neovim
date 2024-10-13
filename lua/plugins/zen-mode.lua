return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      backdrop = 0.95,
      width = 120,       -- Set width to 120 characters
      height = 0.9,      -- Set height to 80% of the screen for centered text
    },
    plugins = {
      tmux = { enabled = true },  -- Disables the tmux statusline when in Zen Mode
    },
    -- Other options can go here
  }
}

