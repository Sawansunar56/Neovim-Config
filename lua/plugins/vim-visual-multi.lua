return {
  "mg979/vim-visual-multi",
  event = "VeryLazy",
  init = function()
    vim.g.VM_default_mappings = 0
    vim.g.VM_maps = {
      ['Find Under'] = '<leader>vn',
      ['Find Subword Under'] = '<leader>vn',
    }
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
  end,

  config = function()
    -- local function visual_cursors_with_delay()
    --   -- Execute the vm-visual-cursors command.
    --   vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
    --   -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
    --   vim.cmd('sleep 200m')
    --   -- Press 'A' in normal mode after the delay.
    --   vim.cmd('silent! execute "normal! A"')
    -- end

    vim.keymap.set("n", "<leader>vj", "<Plug>(VM-Select-All)<Tab>", { desc = "Vim Multi Select All - vn is for search next" })
    vim.keymap.set("n", "<leader>vk", "<Plug>(VM-Start-Regex-Search)", { desc = "Vim multi start regex search" })
    vim.keymap.set("n", "<leader>vl", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "vim multi add cursor at pos" })
    vim.keymap.set("n", "<leader>vh", "<Plug>(VM-Toggle-Mappings)", { desc = "vim multi toggle mapping" })
    -- a = { "<Plug>(VM-Select-All)<Tab>", "Select All", mode = { "n" } },
    -- r = { "<Plug>(VM-Start-Regex-Search)", "Start Regex Search", mode = { "n" } },
    -- p = { "<Plug>(VM-Add-Cursor-At-Pos)", "Add Cursor At Pos", mode = { "n" } },
    -- v = { visual_cursors_with_delay, "Visual Cursors", mode = { "v" } },
    -- o = { "<Plug>(VM-Toggle-Mappings)", "Toggle Mapping", mode = { "n" } },
  end,
}
