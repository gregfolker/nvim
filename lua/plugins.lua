local packer_config = {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local function packer_install()
  local fn = vim.fn
  local data_dir = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(data_dir)) > 0 then
    packer_bootstrap = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      data_dir,
    }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = packer_install()

require('packer').init(packer_config)

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'junegunn/fzf', run = ":call fzf#install()" }
  use 'junegunn/fzf.vim'

  use 'preservim/nerdtree'

  use 'sheerun/vim-polyglot'

  use 'tpope/vim-fugitive'
  use 'tpope/vim-unimpaired'

  use 'junegunn/gv.vim'

  use 'cohama/lexima.vim'

  use 'christoomey/vim-tmux-navigator'

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  use 'nvim-lualine/lualine.nvim'
  use 'ryanoasis/vim-devicons'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
