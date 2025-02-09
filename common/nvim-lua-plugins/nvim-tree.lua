-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end


-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  update_focused_file = { enable = true },
  hijack_netrw = false,
  view = {
    width = 35,
    relativenumber = false,
    number = true,
  },
  -- change folder arrow icons
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
        exclude = {
          filetype = {"diff"}
        }
      },
    },
  },
  filters = {
    custom = { ".DS_Store", "^[.]git$", "^target$" },
  },
  git = {
    ignore = false,
  },
})

-- vim: ts=2 sw=2 et
