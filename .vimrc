execute pathogen#infect()
" File tabs
set tabpagemax=30
" Indents
set tabstop=4
set expandtab
set shiftwidth=2
" Indentation
filetype plugin indent on
"set autoindent

" Syntax
syntax on
syntax enable
set nocompatible
set t_Co=256
set number
set scrolloff=4

" Theme
let g:solarized_termtrans = 1
set background=dark
let g:solarized_termcolors=256
"colorscheme solarized

" Status Line
set statusline+=%2*%y%* " file type (bold)(azure/dark gray)
set statusline+=%1*\ %<%F%* " full path (bold)(white/dark gray)
set statusline+=%4*%m%* " modified flag (bold)(red/dark gray)
set statusline+=%5*%=%5l%* " current line (bold)(cyan/dark gray)
set statusline+=%4*/%L%* " total lines (bold)(red/dark gray)

let mapleader = " "

" Key Mappings
nnoremap <F6> :wa<CR>
nnoremap <C-left> :tabp<CR>
nnoremap <C-right> :tabn<CR>
nnoremap <F9> :noh<CR>
map <C-n> :NERDTreeToggle<CR>

map <Leader>h :tabp<CR>
map <Leader>l :tabn<CR>

" Custom Functions
function Add(template)
    let fname = ":r! cat ~/.templates/" . a:template
    execute fname
endfunction

function Addview(name)
    let fname = ":r! fw add_template " . a:name
    execute fname
    let command = ":tabe templates/" . a:name . ".html"
    execute command
    let command = ":tabe js/" . a:name . ".js"
    execute command
endfunction

command! -nargs=1 Addview call Addview(<f-args>)<CR>
command! -nargs=1 Add call Add(<f-args>)<CR>

if !has("gui_running")
    :source $VIMRUNTIME/menu.vim 
    :set wildmenu                        
    :set cpoptions-=<
    :set wildcharm=<C-Z>
    :map <F4> :emenu <C-Z>
endif

au BufRead,BufNewFile *.hb set filetype=html
au BufRead,BufNewFile *.us set filetype=html

set restorescreen!
autocmd BufWritePre *.rb :%s/\s\+$//e

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


