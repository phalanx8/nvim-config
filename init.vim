" Configurations for MacBook Pro 14/local development
let mapleader = ","         " map leader to comma
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
set backupdir=~/.cache/vim " Directory to store backup files.
set encoding=UTF-8          " Encoding for devicons
set relativenumber
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
if !exists('g:syntax_on')
	syntax enable
endif
nnoremap <Leader>o :wincmd p<CR> " move cursor to other window
nnoremap <Leader>ns :nohlsearch<CR> " disable highlighting of search 
nnoremap <Leader>tw :tabnew<Enter> " disable highlighting of search 
nnoremap <Leader>tn :tabnext<Enter> " disable highlighting of search 
nnoremap <Leader>tb :tabprevious<Enter> " disable highlighting of search 
nnoremap <Leader>tc :tabclose<Enter> " disable highlighting of search 

" Telescope mappings
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


let g:ctrlp_custom_ignore = 'node_modules\|\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

call plug#begin('~/.vim/plugged')
 " Plugin Section
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
 Plug 'scrooloose/nerdtree'
 Plug 'ryanoasis/vim-devicons'
 Plug 'hachy/eva01.vim', { 'branch': 'main' }
call plug#end()


" Configuration on plugins
colorscheme eva01

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>

" Lua configuration and init of packer
:lua require('plugins')


