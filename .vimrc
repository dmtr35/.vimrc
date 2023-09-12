" An example for a vimrc file.
"
" Maintainer: Bram Moolenaar <Bram@vim.org>
" Last change:  2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"       for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"     for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile  " keep an undo file (undo changes after closing)
  endif
endif

"if &t_Co > 2 || has("gui_running")
"   Switch on highlighting the last used search pattern.
"   set hlsearch
"endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

scriptencoding utf-8
set encoding=utf-8
set termguicolors
set nocompatible       " Forget old vi
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
"set nohlsearch        " подсветка поиска
set hls is             " подсветка вкл
set number
"set relativenumber
set tabstop=2          " a tab is four spaces
set softtabstop=4      " when hitting <BS>, pretend like a tab is removed, even if spaces
set noexpandtab        " don't expand tabs to spaces by default
set shiftwidth=2       " number of spaces to use for autoindenting
set shiftround         " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent         " always set autoindenting on
set copyindent         " copy the previous indentation on autoindenting
set nolist
set listchars=eol:$,tab:.\ ,trail:.,extends:>,precedes:<,nbsp:_
highlight SpecialKey term=standout ctermfg=darkgray guifg=darkgray
nnoremap <F3> :set list! list?<CR>
let mapleader = " " " map leader to Space
set pastetoggle=<F2>
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
syntax enable
filetype on                  " required

" soft wrap
set wrap
set linebreak

