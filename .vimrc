set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'

Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" color
Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord

set nu
set autoindent
set cmdheight=2

" cursor
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" for js 
let b:ale_fixers=['prettier', 'eslint']
let g:ale_fix_on_save = 1

let g:ale_sign_error = '🥵'
let g:ale_sign_warning = '😏'
