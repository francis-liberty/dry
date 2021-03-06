set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'vim-scripts/taglist.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/TaskList.vim'
" run terminal inside vim
Bundle 'rson/vim-conque'
" for R language
" for scala
Bundle 'derekwyatt/vim-scala'
Bundle 'ervandew/screen'
Bundle 'jalvesaq/VimCom' 
Bundle 'jcfaria/Vim-R-plugin'
" color themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
" web dev
Bundle 'tpope/vim-surround'
Bundle 'pangloss/vim-javascript'

" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'pyflakes.vim'

" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
" =============================== general settings ===========================
" remove scroll bar
set guioptions-=r  "remove right-hand scroll bar
"set guioptions-=m  "remove menu bar
"set guioptions-=T  "remove toolbar
set autochdir

syntax enable
" cursor difference insert mode 
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;orange\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;green\x7"
  silent !echo -ne "\033]12;green\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

" 256 color
set t_Co=256
"set background=dark
set background=light
colorscheme desert
"colorscheme morning
"colorscheme solarized
"colorscheme molokai
"colorscheme delek

"tabs, indent"
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set smartindent
set autoindent
"
""search" 
set hlsearch
set incsearch
set showmatch

"line number" 
set number
set ruler
set relativenumber
"
""Taglist"
filetype on
filetype plugin on
nnoremap <F8> :!/usr/bin/ctags -R --python-kinds=-i *.py<CR>
nnoremap <F4> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1

"fuzzy finder"
nnoremap <C-f><C-f> :FufFile<CR>

"Nerdtree"
nnoremap <F3> :NERDTree<CR>
nnoremap <F2> :NERDTreeToggle<CR>

"Tasklist"
nnoremap <F1> :TaskList<CR>

"SnipMate"
:filetype plugin on

"Chinese encoding"
set fileencodings=utf-8,gb2312,gbk

"snipMate"
let g:snips_author = "francis chan"
let g:snips_email = "f1ancis621@gmail.com"

"omnicomplete auto close scratch window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"folder
au BufWinLeave * mkview
au BufWinEnter * silent loadview

" ========================== python ===================================
" Highlight end of line chars
" highlight WhitespaceEOL ctermbg=red guibg=red
" match WhitespaceEOL /\s\+$/
