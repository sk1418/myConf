-- Markdown
-- Level 1 Heading (e.g., # Header)
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#eeeeee", bold = true })

---- Level 2 Heading (e.g., ## Header)
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#cccccc", bold = true })
---- Level 3 Heading (e.g., ## Header)
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#aaaaaa", bold = true })

---- Markdown Links
vim.api.nvim_set_hl(0, "@markup.link.label.markdown", { fg = "#58c379", underline = true })

-- Inline Code backticks (e.g., `code`)
vim.api.nvim_set_hl(0, "@markup.raw.markdown", { fg = "#8be9fd", bg = "#2c323c" })
vim.api.nvim_set_hl(0, "@markup.link.markdown_inline", { fg = "lightblue" })
vim.api.nvim_set_hl(0, "@markup.link.url.markdown_inline", { fg = "#5f87ff" })
--vim.api.nvim_set_hl(0, "Underlined", { fg = "#8be9fd", bg = "#2c323c", underline = true })
