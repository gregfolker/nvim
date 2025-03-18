return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local bufferline = require("bufferline")
        vim.opt.termguicolors = true
        bufferline.setup({
            options = {
                style_preset = bufferline.style_preset.minimal,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = true,
                    }
                },
            },
        })
    end
}
