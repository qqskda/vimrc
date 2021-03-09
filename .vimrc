"""""""""""""""""""""
" Settings General"
execute pathogen#infect()

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Xcode theme
Plug 'arzg/vim-colors-xcode'

" NERD Tree
Plug 'preservim/nerdtree'

" Python Folding
Plug 'tmhedberg/SimpylFold'

" Python Indentation
Plug 'vim-scripts/indentpython.vim'

" AutoComplete
Plug 'valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Syntax Highlight
Plug 'vim-syntastic/syntastic'

" PEP8
Plug 'nvie/vim-flake8'

" Powerline
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""
" UTF-8 Support
set encoding=utf-8

" AutoComplete
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1

"theme setting
colorscheme xcodedark

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERD Tree settings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Vim Basic settings
set number
set autoindent
syntax on
set title
set clipboard=unnamed
let python_highlight_all=1

" CPP
nnoremap <C-c> :!g++ $(pkg-config --cflags --libs opencv) -o  %:r.out % -std=c++11<Enter>
nnoremap <C-x> :!./%:r.out

" Split Navigation
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Code Folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" Docstring View enable in fold
let g:SimpylFold_docstring_preview=1

" WhiteSpace Flagging
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" AutoComplete Goaway
let g:ycm_autoclose_preview_window_after_completion=1

" Python Indentation Setup
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" FrontEnd
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" ycm blacklist setup for autocomplete
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}
