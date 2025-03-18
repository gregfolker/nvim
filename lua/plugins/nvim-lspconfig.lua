return {
    "neovim/nvim-lspconfig",
    enabled = false, -- further configuration required
    event = "BufReadPre",
    dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- if you use nvim-cmp
    config = function() 
        require'lspconfig'.clangd.setup{}  
    end
}
