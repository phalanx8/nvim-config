" Universal Config file 
:lua require('patch')
let mapleader = ","         " map leader to comma
set splitright
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
"set autoindent              " indent a new line the same amount as the line just typed
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
nnoremap <Leader>o :wincmd p<Enter> " move cursor to other window
nnoremap <Leader>w :write %<Enter> 
nnoremap <Leader>so :source %<Enter>
nnoremap <Leader>ns :nohlsearch<Enter> " disable highlighting of search 
nnoremap <Leader>tw :tabnew<Enter> " disable highlighting of search 
nnoremap <Leader>tn :tabnext<Enter> " disable highlighting of search 
nnoremap <Leader>tp :tabprevious<Enter> " disable highlighting of search 
nnoremap <Leader>tc :tabclose<Enter> " disable highlighting of search 
nnoremap <Leader>vs :split<bar> :wincmd p <bar> :resize 8 <bar> :terminal<Enter>
nnoremap <Leader>bd :b#<Enter> " delete current buffer and replace it with previous buffer
nnoremap <Leader>lu :m .-1<CR>==
nnoremap <Leader>ld :m .+1<CR>==
nnoremap <leader>sw ddkP<CR>
nnoremap <leader>sc Lzt<CR>
" Haskell config
" formatting on save
autocmd FileType haskell autocmd BufWritePre <buffer> call CocAction('format')


" Map switching windows to <M-h> and <M-l> and <M-j> and <M-k>
nnoremap <M-h> <C-w>h
nnoremap <M-l> <C-w>l
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k

let g:editorconfig = v:true

let g:ctrlp_custom_ignore = 'node_modules\|\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" set colorscheme to night owl
"colorscheme night-owl
"let g:night_owl_terminal_colors = 1
"let g:night_owl_italic_comments = 1
"let g:night_owl_italic_keywords = 1
"let g:night_owl_italic_functions = 1
"let g:night_owl_italic_variables = 1
"let g:night_owl_contrast = "hard"
"let g:night_owl_borders = 1
"let g:night_owl_disable_background = 1
"let g:night_owl_terminal_italics = 1
"let g:night_owl_terminal_bold = 1




"colorscheme night-owl
colorscheme catppuccin-latte " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

":lua require('noirbuddy').setup({ preset = 'miami-nights'})

call plug#begin('~/.vim/plugged')
 " Plugin Section
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'scrooloose/nerdtree'
 Plug 'hachy/eva01.vim', { 'branch': 'main' }
 Plug 'itchyny/lightline.vim'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'tpope/vim-fugitive',
 Plug 'github/copilot.vim',
 Plug 'yaegassy/coc-volar-tools', {'do': 'yarn install --frozen-lockfile'},
 Plug 'MunifTanjim/nui.nvim',
 Plug 'ThePrimeagen/vim-be-good',
 Plug 'ryanoasis/vim-devicons',
 Plug 'ray-x/aurora',
 Plug 'goerz/jupytext.vim',
 Plug 'mattn/emmet-vim',
 Plug 'alvan/vim-closetag',
 Plug 'oxfist/night-owl.nvim'
 Plug 'chrisbra/csv.vim',
 Plug 'catppuccin/nvim', { 'as': 'catppuccin' },
call plug#end()


" Configuration on plugins
"set background=dark

"\ 'colorscheme': 'darcula',
let g:lightline = {
\ 'colorscheme': 'selenized_light',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ] 
\ },
\ 'component_function': {
\   'cocstatus': 'coc#status',
\   'cocprogress': 'coc#progress',
\   'gitbranch': 'FugitiveHead',
\ },
\ }


" Neovim terminal configuration
if has('nvim')
    tnoremap <leader><Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowBookmarks=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
nnoremap <Leader>nt :NERDTreeToggle<Enter>
nnoremap <Leader>nf :NERDTreeFind<Enter>
nnoremap <Leader>bs gg 2j<Enter>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fc <cmd>Telescope coc<cr>
nnoremap <leader>fw <cmd>Telescope file_browser<cr>
nnoremap <leader>ft <cmd>Telescope<cr>


" Listchars configuration
set listchars=eol:↓,space:·,trail:●,tab:→⇥⇥,extends:>,precedes:<

" Sourcing configurations of plugins in vimscript
source ~/.config/nvim/vim/jupytext.vim


" Lua configuration and init of packer
" Uncomment when packer is configured and installed
:lua require('plugins')

" Coc Configuration 
:lua require('coc-config')

" Treesitter configuration
:lua require('treesitter')

" Telescope helper
 :lua require('helpers/helpers')

" Telescope configuration
 :lua require('telescopeconfig')

" Iron configuration
:lua require('ironconfig')

" Gitsigns configuration
:lua require('gitsignsconfig')
