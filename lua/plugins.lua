-- This file can be loaded by calling `lua require('plugins')` from your init.vim

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
    "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          -- some settings
        })
        end,
      requires = {
         "MunifTanjim/nui.nvim",
         "nvim-lua/plenary.nvim",
         "nvim-telescope/telescope.nvim"
      }
   })

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

-- install telescope file browser
    use 'nvim-telescope/telescope-file-browser.nvim'

  use {
    'chipsenkbeil/distant.nvim', branch = 'v0.2',
    config = function()
        require('distant').setup{
            ['*'] = {
                dir = {
                  mappings = {
                    ['<Return>']  = actions.edit,
                    ['-']         = actions.up,
                    ['K']         = actions.mkdir,
                    ['N']         = actions.newfile,
                    ['R']         = actions.rename,
                    ['D']         = actions.remove,
                  }
                },
            }
        }
        end
  }

  use 'fannheyward/telescope-coc.nvim'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
end)
