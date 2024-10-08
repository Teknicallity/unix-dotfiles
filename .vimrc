set scrolloff=8
set number
set relativenumber
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent

call plug#begin() "~/.vim/plugged)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'ayu-theme/ayu-vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'preservim/nerdtree'
Plug 'rstacruz/vim-closer'
Plug 'rstacruz/vim-hyperstyle'
" Plug 'neoclide/coc.nvim'
call plug#end()

autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" CocInstall coc-json coc-tsserver coc-pyright coc-html coc-css

" let ayucolor="dark"   " for dark version of theme

set termguicolors
colorscheme catppuccin_mocha

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.vimrc<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
