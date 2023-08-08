return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require "telescope.actions"
    return {
      defaults = {
        layout_strategy = "bottom_pane",
        layout_config = {
          height = 25,
        },
        -- layout_config = {
        --   -- horizontal = { prompt_position = "top", preview_width = 0.55 },
        --   -- vertical = { mirror = false },
        --   -- width = 0.87,
        --   -- height = 0.80,
        --   horizontal = { prompt_position = "top", preview_width = 0.55 },
        --   vertical = { mirror = false },
        --   width = 0.98,
        --   height = 0.50,
        --   preview_cutoff = 120,
        -- },
        mappings = {
          i = {
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
          },
        },
      },
    }
  end,
}
