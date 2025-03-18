return {
    "ryanmsnyder/toggleterm-manager.nvim",
     dependencies = {
       "akinsho/nvim-toggleterm.lua",
       "nvim-telescope/telescope.nvim",
       "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
     },
     config = function()
        local toggleterm_manager = require("toggleterm-manager")
        local actions = toggleterm_manager.actions

        toggleterm_manager.setup({
            mappings = { -- key mappings bound inside the telescope window
                i = {
                    ["<C-n>"] = { action = actions.create_and_name_term, exit_on_action = true },
                    ["<CR>"] = { action = actions.toggle_term, exit_on_action = true },
                },
            },
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", "t", "<cmd>Telescope toggleterm_manager<cr>", opts)
     end
}
