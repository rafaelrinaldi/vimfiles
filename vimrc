"###############################################################################
"# Bootstrap
"###############################################################################

" Vim doesn't like fish
set shell=/bin/bash

" be iMproved, required
set nocompatible

" Remove automatic plugin identation (required by Vundle)
filetype off

"###############################################################################
"# Vundle
"###############################################################################

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Startup Vundle
call vundle#begin()

"###############################################################################
"# Plugins
"###############################################################################

" Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Emmet
Plugin 'mattn/emmet-vim'

" Editor config
Plugin 'editorconfig/editorconfig-vim'

" Solarized color scheme
Plugin 'altercation/vim-colors-solarized'

" Better status bar (similar to airline but lighter)
Plugin 'itchyny/lightline.vim'

" Easy way to wrap/unwrap words
Plugin 'tpope/vim-surround'

" Fuzzy search
Plugin 'kien/ctrlp.vim'

" Better and faster grep
Plugin 'rking/ag.vim'

" Indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" Syntax highlight
Plugin 'sheerun/vim-polyglot'

" Syntax highlight for esnext
Plugin 'othree/yajs.vim'

" Code snippets
Plugin 'sirver/ultisnips'

" Real time color preview for CSS
Plugin 'ap/vim-css-color'

"###############################################################################
"# General settings
"###############################################################################

" Close Vundle
call vundle#end()

" UTF-8 all the things
set encoding=utf-8

" Show line numbers
set number

" Enable tree folding
set foldenable
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Set the title at top of tab to be the filename
set title

" Automatic syntax
syntax enable

" Tab
set tabstop=2
set shiftwidth=2

" Use spaces instead of tabs
set expandtab

" Whitespace
set linespace=2

" Backspace
set backspace=2

" Display hidden whitespace
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·

" Display hidden characters by default
set list

" Highlight current line
set cursorline

" Highlight column 80
set colorcolumn=80

" Highlight search results
set hls

" Give one virtual space at end of line
set virtualedit=onemore

" Complete files like a shell
set wildmenu wildmode=list:longest,list:full

" Specify files to ignore on wildmenu
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.sw?
set wildignore+=.DS_Store
set wildignore+=node_modules,bower_components

" Set highlight for search
set hlsearch

" Case-insensitive searching
set ignorecase

" But case-sensitive if expression contains a capital letter
set smartcase

" Set no wrap for big lines
set nowrap

" Display status bar
set laststatus=2

" Backups are annoying, let file versioning handles this
set nobackup
set nowritebackup

" Stop being bothered by Vim swap files (without leaving them)
set noswapfile

" Enable mouse in all modes
set mouse=a

"###############################################################################
"# Theming
"###############################################################################

" Define color scheme
"{{colorscheme}}

" Set hidden characters colors to light gray
highlight NonText ctermfg=lightgray ctermbg=white
highlight SpecialKey ctermfg=lightgray ctermbg=white

"###############################################################################
"# Emmet
"###############################################################################

" Disable Emmet for any file type
let g:user_emmet_install_global = 0

" Specifies file types for Emmet
autocmd FileType html,erb,css,scss EmmetInstall

"###############################################################################
"# Lightline
"###############################################################################

let g:lightline = {'colorscheme': 'wombat'}

"###############################################################################
"# CtrlP
"###############################################################################

" Use the_silver_searcher instead of CtrlP's own fuzzy search algorithm (for faster results)
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

"###############################################################################
"# Indent guides
"###############################################################################

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Disable automatic colors and specify custom ones
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightgray

"###############################################################################
"# Polyglot
"###############################################################################

" Disable JavaScript on Polyglot due to conflicts with yajs
let g:polyglot_disabled = ['javascript']

"###############################################################################
"# UltiSnips
"###############################################################################

" When editing snippets, open a new vertical panel
let g:UltiSnipsEditSplit='vertical'
