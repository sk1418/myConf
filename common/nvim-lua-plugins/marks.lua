-- this plugin is a fork from the original author, with telescope support
local setup, marks = pcall(require, "marks")
if not setup then
  return
end

marks.setup{
  default_mappings = false, -- whether to map keybinds or not. default true
  builtin_marks = {}, -- which builtin marks to show. default {}
  cyclic = true, -- whether movements cycle back to the beginning/end of buffer. default true
  force_write_shada = false, -- whether the shada file is updated after modifying uppercase marks. default false
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 500,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  excluded_filetypes = {}, -- disables mark tracking for specific filetypes. default {}
  excluded_buftypes = {}, -- disables mark tracking for specific buftypes. default {}
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "bookmark group 0",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.load_extension("marks_nvim")
--require('telescope').extensions.marks_nvim.marks_list_all() [> List all marks <]

-- vim: ts=2 sw=2 et
