return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({})

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        map("n", "<leader>t", "<cmd>ToggleTerm direction=float<cr>", opts)
        map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal size=30<cr>", opts)
        map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical size=120<cr>", opts)
    end
}
