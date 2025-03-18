return {    
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            enabled = true
        }, 
        {
            "nvim-telescope/telescope-file-browser.nvim", 
            enabled = true
        },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            version = "^1.0.0",
            enabled = true
        },
    },

    config = function()
        local telescope = require("telescope")
        local fb_actions = require("telescope._extensions.file_browser.actions")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            defaults = {
                theme = "center",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.5,
                    },
                },
            },
            extensions = {
                file_browser = {
                    path = "%:p:h", -- open from within the folder of the current buffer
                    display_stat = false,
                    hidden = true,
                    hijack_netrw = true,
                    use_fd = true,
                    mappings = {
                        ["i"] = {
                            ["<C-h>"] = fb_actions.goto_home_dir,
                            ["<C-n>"] = fb_actions.create,
                        },
                    },
                },
                live_grep_args = {
                    auto_quoting = true,
                    mappings = {
                        i = {
                            ["<C-k>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            ["<C-space>"] = lga_actions.to_fuzzy_refine,
                        },
                    },
                },
            },
        })

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("live_grep_args")

        local builtin = require("telescope.builtin")
        local lga_shortcuts = require("telescope-live-grep-args.shortcuts")
        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }

        map("n", "<leader>f", "<cmd>Telescope file_browser<cr>", opts)
        map("n", "<C-b>", "<cmd>Telescope buffers<cr>", opts)
        map("n", "<C-f>", builtin.find_files, opts)
        map("n", "<leader>rg", "<cmd>Telescope live_grep_args<cr>")
        map("n", "<leader>s", lga_shortcuts.grep_word_under_cursor, opts)
    end
}
