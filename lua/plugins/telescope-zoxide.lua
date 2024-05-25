return {
    'jvgrootveld/telescope-zoxide',
    keys = {
        { "<leader>zd", "<cmd>Telescope zoxide list<cr>", desc = "Telescope Zoxide" },
    },
    config = function()
        -- Useful for easily creating commands
        local z_utils = require("telescope._extensions.zoxide.utils")

        require('telescope').setup {
            -- (other Telescope configuration...)
            extensions = {
                zoxide = {
                    prompt_title = "[ Walking on the shoulders of TJ ]",
                    mappings = {
                        default = {
                            after_action = function(selection)
                                print("Update to (" .. selection.z_score .. ") " .. selection.path)
                            end
                        },
                        ["<C-s>"] = {
                            before_action = function(selection) print("before C-s") end,
                            action = function(selection)
                                vim.cmd.edit(selection.path)
                            end
                        },
                        -- Opens the selected entry in a new split
                        ["<C-q>"] = { action = z_utils.create_basic_command("split") },
                    },
                }
            }
        }
        require("telescope").load_extension('zoxide')
    end,
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    }
}
