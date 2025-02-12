-- import nvim-tree plugin safely
local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then
  return
end


treesitter.setup({
  highlight = { enable = true, },
  -- enable indentation
  indent = { enable = true },
  -- ensure these language parsers are installed
  ensure_installed = {
    "python",
    "json",
    "java",
    "kotlin",
    "javascript",
    "typescript",
    "sql",
    "yaml",
    "html",
    "xml",
    "css",
    "markdown",
    "markdown_inline",
    "bash",
    "lua",
    "vim",
    "dockerfile",
    "gitignore",
    "vimdoc",
    "tmux",
    "toml",
  },
  --incremental_selection = {
    --enable = true,
    --keymaps = {
      --init_selection = "<C-space>",
      --node_incremental = "<C-space>",
      --scope_incremental = false,
      --node_decremental = "<bs>",
    --},
  --},
})



-- vim: ts=2 sw=2 et
