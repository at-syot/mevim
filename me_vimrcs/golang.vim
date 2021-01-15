call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'itchyny/lightline.vim'

" from js vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'burntsushi/ripgrep'

" autocomplete
Plug 'neoclide/coc.nvim', { 'tag': 'v0.0.80' }

" color
Plug 'yuqio/vim-darkspace'
Plug 'tomasiser/vim-code-dark'
Plug 'jacoborus/tender.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'mhartington/oceanic-next'

call plug#end()

set hidden

set lsp=3

" colorscheme desert
" colorscheme slate

" set background=dark
" set termguicolors
"
" colorscheme darkspace
" colorscheme codedark

set background=light    " [light, dark]
colorscheme PaperColor

" colorscheme tender 
" let macvim_skip_colorscheme=1

" set termguicolors
" colorscheme OceanicNext

set tabstop=2
set shiftwidth=2
set nu
set autoindent
set cmdheight=2

" lightline
set laststatus=2

" indentLine char
" set list
" set lcs=tab:\┊\ 

let mapleader = ","

map <leader>tt :terminal<cr>
map <leader>sp :split<cr>
map <leader>vsp :vertical split<cr>
map <leader>rr :resize +10<cr>
map <leader>rt :resize -10<cr>
map <leader>vr :vertical resize +10<cr>
map <leader>vrt :vertical resize -10<cr>

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
map <leader>gr :GoReferrers<cr>

" js prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

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
