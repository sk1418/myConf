local setup, ibl = pcall(require, "ibl")
if not setup then
  return
end

ibl.setup{
  indent = { char = "▏" },
  exclude = { filetypes = {"help"} },
}
