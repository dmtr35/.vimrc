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
set termguicolors               " Включает поддержку 24-битных цветов в терминале.
set nocompatible                " режим совместимости с классическим Vi
set showcmd                     " Показывает вводимые команды в строке статуса.
set showmatch                   " Подсвечивает парные скобки при наборе.
set ignorecase                  " Игнорирует регистр при поиске 
set smartcase                   " учитывает регистр, если в поиске есть хотя бы одна заглавная буква
set incsearch                   " Поиск обновляется по мере ввода строки
set autowrite                   " Автоматически сохраняет файл перед выполнением команд, таких как :next или :make
"set nohlsearch                 " подсветка поиска
set hls is                      " Включает подсветку поиска.
"set number                     " Номерацию строк
set mouse=                      " отключает управление мышью.
"set relativenumber             " относительные номера строк
set tabstop=2                   " Табуляция отображается как 2 пробела.
set softtabstop=4               " При нажатии Backspace удаляется 4 пробела
set noexpandtab                 " Табуляция не заменяется пробелами.
set shiftwidth=2                " Количество пробелов для отступов — 2.
set shiftround                  " Выравнивает отступы по кратным значениям shiftwidth
set backspace=indent,eol,start  " Разрешает удаление отступов, конца строки и начальных символов в режиме вставки.
set autoindent                  " Включает автоматическое добавление отступов
set copyindent                  " Копирует отступы предыдущей строки.
set nolist                      " По умолчанию скрывает специальные символы.
set listchars=eol:$,tab:.\ ,trail:.,extends:>,precedes:<,nbsp:_
highlight SpecialKey term=standout ctermfg=darkgray guifg=darkgray
nnoremap <F3> :set list! list?<CR>
let mapleader = " "             " Устанавливает пробел как лидер-клавишу
set pastetoggle=<F2>            " Переключает режим вставки (paste), чтобы корректно вставлять текст без форматирования.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
"syntax enable                  " Включает подсветку синтаксиса.  
filetype on                     " Включает автоматическое определение типа файла

" soft wrap                     
set wrap                        " Включает перенос строк.
set linebreak                   " Переносы происходят только на пробелах, чтобы текст выглядел аккуратнее.

"call plug#begin('~/.vim/plugged')
"Plug 'vim-scripts/hexman.vim'
"call plug#end()

" Назначить Ctrl + a для переключения на следующий буфер
nnoremap <C-a> :bnext<CR>
" Назначить Ctrl + q для переключения на предыдущий буфер
nnoremap <C-q> :bprev<CR>

" Назначить alt+up, alt+down -> удалить строку, вставить выше, ниже
nnoremap <silent> <A-Up> :if line('.') > 1 \| let l = line('.') \| let c = col('.') \| if line('.') == line('$') \| execute "normal! ddP" \| else \| execute "normal! ddkP" \| endif \| call cursor(l - 1, c) \| endif<CR>
nnoremap <silent> <A-Down> ddp 

