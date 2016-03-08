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

" Syntax highlight for ES2015
Plugin 'othree/yajs.vim'

" Syntaxt highlighting for CSSNext
Plugin 'hail2u/vim-css3-syntax'

" Code snippets
Plugin 'sirver/ultisnips'

" Real time color preview for CSS
Plugin 'ap/vim-css-color'

" Code comments helper
Plugin 'tpope/vim-commentary'

" Git wrapper
Plugin 'tpope/vim-fugitive'

" Automatically closes brackets, parens and quotes
Plugin 'Raimondi/delimitMate'

" Unix commands wrapper
Plugin 'tpope/vim-eunuch'

" Elm language
Plugin 'elmcast/elm-vim'

" Buffer navigation improved
Plugin 'tpope/vim-unimpaired'

" Easy string coercion
Plugin 'tpope/vim-abolish'

"###############################################################################
"# General settings
"###############################################################################

" Close Vundle
call vundle#end()

" UTF-8 all the things
set encoding=utf-8

" Automatic plugin indent
filetype plugin indent on

" Show line numbers
set number

" Enable tree folding
set foldenable
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Remap the space key to toggle current fold
nnoremap <Space> za

" Set the title at top of tab to be the filename
set title

" Automatic syntax
syntax enable

" Tab
set tabstop=2 shiftwidth=2 noexpandtab

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
set wildmenu wildmode=full

" Specify files to ignore on wildmenu
set wildignore+=.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.sw?
set wildignore+=.DS_Store
set wildignore+=node_modules,bower_components,elm-stuff

" Set highlight for search
set hlsearch

" Case-insensitive searching
set ignorecase

" But case-sensitive if expression contains a capital letter
set smartcase

" Remove automatic text wrapping
set nowrap

" Display status bar
set laststatus=2

" Backups are annoying, let file versioning handles this
set nobackup
set nowritebackup

" Stop being bothered by Vim swap files
set noswapfile

" Enable mouse in all modes because why not
set mouse=a

" Change the position where panes are opened
set splitbelow
set splitright

" Limits the body of Git commit messages to 72 characters
autocmd Filetype gitcommit setlocal spell textwidth=72

" Enable spell checking on certain file types
autocmd BufRead,BufNewFile *.md,gitcommit setlocal spell complete+=kspell

"###############################################################################
"# Theming
"###############################################################################

" Define color scheme
"{{colorscheme}}

" Enable italic text
highlight Comment cterm=italic

" Display current line number in bold text
highlight CursorLineNr cterm=bold

" Set hidden characters colors to light gray
highlight NonText ctermfg=lightgray ctermbg=white
highlight SpecialKey ctermfg=lightgray ctermbg=white

"###############################################################################
"# Emmet
"###############################################################################

" Disable Emmet for all file types
let g:user_emmet_install_global = 0

" Specifies file types for Emmet
autocmd FileType html,erb,css,scss EmmetInstall

"###############################################################################
"# Lightline
"###############################################################################

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename'
      \ }
      \ }

function! LightLineModified()
  if &filetype == 'help'
    return ''
  elseif &modified
    return '*'
  elseif &modifiable
    return ''
  else
    return ''
  endif
endfunction

function! LightLineReadonly()
  if &filetype == 'help'
    return ''
  elseif &readonly
    return '⭤'
  else
    return ''
  endif
endfunction

function! LightLineFugitive()
  if exists('*fugitive#head')
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? '' . LightLineModified() : ' ')
endfunction

"###############################################################################
"# CtrlP
"###############################################################################

" Use the_silver_searcher for fuzzy search
" let g:ctrlp_user_command = ['ag %s -l --nocolor --hidden -g ""'

" Use Git's `ls-files` and properly ignore hidden files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

"###############################################################################
"# Indent guides
"###############################################################################

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Disable automatic colors and specify custom ones
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=gray
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

"###############################################################################
"# GUI
"###############################################################################

if has('gui_running')
  " Typography
  set guifont=PragmataPro:h20
  set linespace=5

  " Ligatures support
  set macligatures

  " Force a screen render when changing modes
  inoremap <special> <Esc> <Esc>hl

  " Fix the way cursor looks
  set guicursor+=i:blinkwait0

  " Remove scroll bars
  set guioptions-=T
  set guioptions-=r

  " Display the default tab style
  set guioptions-=e

  " Manually set whitespace chars colors (known issue in Solarized)
  highlight CursorLineNr cterm=none ctermfg=0 guifg=#D15516 guibg=#FDF7E7
  highlight NonText cterm=none ctermfg=0 guifg=#F0EBDA
  highlight SpecialKey cterm=none ctermfg=0 guifg=#F0EBDA guibg=#FDF7E7

  " Customize IndentGuides color scheme
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=none guibg=#9DABAB
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=none guibg=#F0EBDA
endif
