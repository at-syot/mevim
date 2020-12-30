" set runtimepath+=~/.vim_runtime
" source ~/.vim_runtime/vimrcs/basic.vim
" 
" try
" source ~/.vim_runtime/my_configs.vim
" catch
" endtry

call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-surround'
Plug 'burntsushi/ripgrep'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" color
Plug 'yuqio/vim-darkspace'

call plug#end()

" colorscheme desert
" colorscheme slate

set hidden

set lsp=3

set background=dark
set termguicolors
colorscheme darkspace

set nu
set autoindent
set cmdheight=2

let mapleader = ","

map <leader>h :bprevious<cr>
map <leader>l :bnext<cr>

map <leader>tw :tabnext<cr>
map <leader>te :tabp<cr>
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>

map <leader>ff :GFiles<cr>
map <leader>fg :Rg<cr>
map <leader>ss :e .<cr>

map <leader>cf :<C-S-w><cr>

" golang
map <leader>gd :GoDoc<cr>
map <leader>gi :GoImports<cr>
map <leader>gr :GoRun<cr>

" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" for js 
let b:ale_fixers=['prettier', 'eslint']
let g:ale_fix_on_save = 1

let g:ale_sign_error = '🥵'
let g:ale_sign_warning = '😏'

" from this blog
" https://www.chrisatmachine.com/Neovim/08-fzf

" RG
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" cursor
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


