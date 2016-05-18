"---------------- Vundle --------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"git interface
Plugin 'tpope/vim-fugitive'

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'

"html
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
Plugin 'ervandew/supertab'

"code folding
Plugin 'tmhedberg/SimpylFold'

" Color theme
Plugin 'morhetz/gruvbox'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
"--------------- End Vundle ----------------


syntax on
"autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1
filetype plugin indent on

" Set colorscheme
if !has("gui_running")
   let g:gruvbox_italic=0
endif
set background=dark
colorscheme gruvbox

set exrc
set secure
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                   " convert tabs to spaces
"set noexpandtab
set visualbell                  " do not beep
set noerrorbells
set ignorecase                  " Ignore case of searches
set hlsearch                    " Highlight searches
set incsearch                   " Highlight dynamically as pattern is typed
set showmatch

" Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Enable the color column
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray

" Enable folding
set foldmethod=indent
set foldlevel=99
"set foldclose=all
let g:SimpylFold_docstring_preview=1

" Enable folding with the spacebar
nnoremap <space> za

" Enable tabline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Enable powerline fonts
let g:airline_powerline_fonts = 1
set guifont=Source\ Code\ Pro\ for\ Powerline

" Insert an extra line between delimiters after <CR>
let delimitMate_expand_cr = 1

" Vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_char = '│'

" Set the default YCM config file
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"

" Let Eclim and YCM play nice together
"let g:EclimCompletionMethod = 'omnifunc'

" Default g++ to compile simple C++ source files
"set makeprg=g++\ -o\ %<\ %

" Set clang options
let g:clang_c_options = '-std=gnu11'
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'

" Ruby debugging
let g:ruby_debugger_progname = 'mvim'

" Define mappings to build and execute C++ files
nnoremap <F4> :make!<CR>
nnoremap <F5> :!./%< <CR>

" Close VIM if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Map key to toggle NERDTree
map <leader>k :NERDTreeToggle<CR>

" Open NERDTree to current doc folder
autocmd BufEnter * lcd %:p:h

" Use space to jump down a page (like browsers do)...
nnoremap <Space> <PageDown>

" Delete current file and buffer
nnoremap <leader>r :call delete(expand('%'))<bar>bp<bar>sp<bar>bn<bar>bd<CR>

" Close current buffer without closing VIM
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Make tabs, trailing whitespace, and non-breaking spaces visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list"

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
nnoremap <space> za
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
