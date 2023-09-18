return {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  dependencies = {
    ('RRethy/nvim-treesitter-textsubjects'),
    ('nvim-treesitter/nvim-treesitter-textobjects'),
    ('nvim-treesitter/nvim-treesitter-context'),
    {
      'nvim-treesitter/playground',
    },
  },
  config = function()
    require 'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the four listed parsers should always be installed)
      ensure_installed = { "c", "javascript", "typescript", "java", "cpp", "rust", "lua", "vim", "go", "vimdoc" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      highlight = {
        -- `false` will disable the whole extension
        enable = true,

        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-w>",     -- maps in normal mode to init the node/scope selection
          node_incremental = "<M-w>",   -- increment to the upper named parent
          node_decremental = "<M-C-w>", -- decrement to the previous node
          scope_incremental = "<M-e>",  -- increment to the upper scope (as defined in locals.scm)
        }
      },
      textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
          ['.'] = 'textsubjects-smart',
          [';'] = 'textsubjects-container-outer',
          ['i;'] = 'textsubjects-container-inner',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["as"] = "@statement.outer",
            -- ["is"] = "@scopename.inner",
            --["ak"] = "@comment.outer",
          }
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]p"] = "@parameter.inner",
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[p"] = "@parameter.inner",
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
      },
    }
  end
}
