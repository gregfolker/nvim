return {
    "catppuccin/nvim",
    enabled = true,
    priority = 1000,

    config = function()
        local catppuccin = require("catppuccin")

        vim.opt.termguicolors = true
        
        catppuccin.setup({
            flavour = "macchiato",
            term_colors = true,
            styles = {
                conditionals = {},
                functions = { "italic" },
                types = { "bold" }
            },
            color_overrides = {
                mocha = {
                    base = "#171717", -- background
                    surface2 = "#9A9A9A", -- comments
                    text = "#F6F6F6"
                }
            },
            integrations = {
                telescope = true,
                treesitter = true,
                treesitter_context = true
            }
        })

        vim.cmd.colorscheme("catppuccin")
    end
}
