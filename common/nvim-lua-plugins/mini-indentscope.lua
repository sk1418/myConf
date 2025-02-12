local setup, indentscope = pcall(require, "mini.indentscope")
if not setup then
  return
end
indentscope.setup({
  draw = {
    delay = 3,
    animation = indentscope.gen_animation.quadratic({ easing = 'out', duration = 150, unit = 'total' }),
    priority = 10
  },
  options = { n_lines = 2000 },
  symbol = '▏'
})


-- vim: ts=2 sw=2 et
