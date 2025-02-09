-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

-- configure telescope
telescope.setup({
  -- configure custom mappings
  defaults = {
    path_display = {"smart"},
    file_ignore_patterns = {"target"},
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-v>"] = actions.select_vertical,
      },
    },
  },
  extensions = {  fzf = {
    fuzzy = true,                    -- false will only do exact matching
    override_generic_sorter = true,  -- override the generic sorter
    override_file_sorter = true,     -- override the file sorter
    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    -- the default case_mode is "smart_case"
  }
}

})

-- vim: ts=2 sw=2 et
