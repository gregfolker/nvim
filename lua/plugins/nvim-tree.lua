return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({})

        local opts = {noremap = true, silent = true}

        vim.api.nvim_set_keymap("n", "|", "<cmd>NvimTreeFindFileToggle<cr>", opts)
    end
}
