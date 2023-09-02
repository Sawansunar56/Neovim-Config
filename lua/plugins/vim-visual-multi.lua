return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    vim.g.VM_maps = nil
    vim.g.VM_maps = {
      ["Find Under"]         = "<C-x>",
      ['Find Subword Under'] = '<C-x>',
      ["Select Cursor Down"] = '<M-d>',
      ["Select Cursor Up"]   = '<M-u>',
    }
  end
}
