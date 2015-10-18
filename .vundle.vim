" Remove automatic plugin identation (required by Vundle)
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Startup Vundle
call vundle#rc()

"###############################################################################
"# Plugins
"###############################################################################

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

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

filetype plugin indent on
