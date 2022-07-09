"===================== GENERAL =============================
:set number
:set relativenumber
:set hidden
:set noerrorbells
:set tabstop=4 softtabstop=4
:set shiftwidth=4
:set expandtab
:set smartindent
:set nowrap
:set mouse=a
:set noswapfile
:set nobackup
:set incsearch
:set scrolloff=8
:set splitright
:set splitbelow

" ===================== PLUGINS =============================
call plug#begin()

Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status barg
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/jiangmiao/auto-pairs.git' 
Plug 'https://github.com/vim-airline/vim-airline-themes.git'
Plug 'https://github.com/tpope/vim-surround.git'

" LSP
Plug 'neovim/nvim-lspconfig'

" NEOVIM-CMP
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" Snips
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

<<<<<<< HEAD
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

=======
>>>>>>> dbd204d1e7939255dadf576b5db78f43b10ed060
call plug#end()

" ===================== CONFIGURATIONS =============================

" Remap NERDTree Toggle
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-f> :NERDTreeToggle<CR>

" Bind TagbarToggle to F8
nnoremap <F8> :TagbarToggle<CR>

" Remap Vim Split Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Bind jk to exit insert mode 
inoremap jk <ESC>

" Set space as mapleader
let mapleader = " "

" space+o to insert empty line below
" space+O to inser empty line above
nnoremap <Leader>o o<Esc>0"_D
nnoremap <Leader>O O<Esc>0"_D

:set completeopt-=preview " For No Previews

" Set colorscheme
:colorscheme deus

" Air-line
let g:airline_theme="deus"
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Lua configurations 
lua require("fzarco")

" leader ff to find files - Telescope
nnoremap <leader>fd <cmd>lua require("telescope-config").curr_buff()<CR>
nnoremap <leader>ff <cmd>lua require("telescope-config").files()<CR>
