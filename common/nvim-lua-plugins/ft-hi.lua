-- Markdown
-- Level 1 Heading (e.g., # Header)
vim.api.nvim_set_hl(0, "markdownH1", { fg = "#eeeeee", bold = true })

---- Level 2 Heading (e.g., ## Header)
vim.api.nvim_set_hl(0, "markdownH2", { fg = "#cccccc", bold = true })
---- Level 3 Heading (e.g., ## Header)
vim.api.nvim_set_hl(0, "markdownH3", { fg = "#aaaaaa", bold = true })

---- Markdown Links
vim.api.nvim_set_hl(0, "markdownLinkText", { fg = "#58c379", underline = true })

-- Inline Code backticks (e.g., `code`)
vim.api.nvim_set_hl(0, "markdownCode", { fg = "#268bd2" })
vim.api.nvim_set_hl(0, "markdownUrl", { fg = "#5f87ff" })
--vim.api.nvim_set_hl(0, "markdownCode", { fg = "#5f87ff" })
--vim.api.nvim_set_hl(0, "@markup.link.url.markdown_inline", { fg = "#5f87ff" })
--vim.api.nvim_set_hl(0, "Underlined", { fg = "#8be9fd", bg = "#2c323c", underline = true })
--
-- XML
vim.api.nvim_set_hl(0, "xmlTag", { fg = "#666666" })
vim.api.nvim_set_hl(0, "xmlTagName", { fg = "#268bd2" })
vim.api.nvim_set_hl(0, "xmlAttrib", { fg = "#859900" })
