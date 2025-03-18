return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects", -- Syntax aware text-objects
        {
            "nvim-treesitter/nvim-treesitter-context", -- Show code context
            opts = {
                enable = false, -- further configuration required
                mode = "topline",
                line_numbers = true
            }
        }
    },

    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            ensure_installed = { "c", "python", "lua" },
            highlight = { enable = true },
            auto_install = true,
            sync_install = true,
            additional_vim_regex_highlighting = false,
        })
    end
}
