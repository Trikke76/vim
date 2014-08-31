if version >= 700

"------ Meta ------"
" clear all autocommands!
autocmd!
set nocompatible                        " break away from old vi compatibility
set fileformats=unix,dos,mac            " support all three newline formats
set viminfo=                            " don't use or save viminfo files
set background=dark                     " Tell Background color to VIM
syntax on


"------ Console UI & Text display ------"
set number                              " Set line numbers on screen
set showcmd                             " Show partial command in status line
""" set list                              " Show invisible characters
set wrap                                " Soft wrap long lines
set wildmenu                            " Menu has tab completion
set wildmode=list:longest,full
set ruler                               " Show the line number on the bar

"------ Text editing and searching behavior ------"
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif     " Remove trailing white spaces
set textwidth=80                        " Set column with to 80
set mouse=a                             " Enable mouse support in console
set backspace=2
set ignorecase                          " Search case insensitive
set smartcase                           " Unless there's a capital letter
set incsearch                           " Incremental searching
set hlsearch                            " Highlight search results
set cursorline                          " Bring cursor back on current line
hi CursorLine term=none cterm=none ctermbg=0    " Highlight current line

filetype on                             " Enable filetype detection
filetype indent on                      " Enable filetype-specific indenting
filetype plugin on                      " Enable filetype-specific plugins


"------ Indents and tabs ------"
set autochdir                           " Auto cd to the dir the file is in
set autoindent                          " Add autoindent
set smartindent                         " try to be smart about indenting (C-style)
set expandtab                           " Expand tabs with spaces
set smarttab
set shiftwidth=4                        " spaces for each step of (auto)indent
set softtabstop=4                       " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                           " for proper display of files with tabs
set shiftround                          " always round indents to multiple of shiftwidth
set copyindent                          " use existing indents for new indents
set preserveindent                      " save as much indent structure as possible
filetype plugin indent on               " load filetype plugins and indent settings


"------ Filetypes ------"

" Vimscript
autocmd FileType vim setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Shell
autocmd FileType sh setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" Ruby
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" PHP
autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4



endif                                                                       " version <= 700

if !exists("autocommands_loaded")
      let autocommands_loaded = 1
        autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
endif

" This beauty remembers where you were the last time you edited the file,
" and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

