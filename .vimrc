au BufWritePost .vimrc so ~/.vimrc
let mapleader = ","
set guioptions-=T  "remove toolbar




set clipboard=unnamed

vnoremap < <gv
vnoremap > >gv

let $LANG = 'en'
set langmenu=none
set backspace=2

set vb t_vb=			" visualbell

execute pathogen#infect()

" disaple arrow key
" no <left>	<Nop>
" no <right>	<Nop>
" no <up>		<Nop>
" no <down>	<Nop>
" 
" ino <left>	<Nop>
" ino <right>	<Nop>
" ino <up>	<Nop>
" ino <down>	<Nop>


" active color scheme
colorscheme desert

" font settings
set guifont=Ubuntu\ Mono\ 11
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 11
  elseif has("gui_win32")
    set guifont=Ubuntu\ Mono:h12
  endif
endif
set enc=utf-8
set fileencoding=utf-8

" edior settingd
set number				" line numbres
set history=1000			" commands history
set showcmd				" show incomplete cmds down the bottom
set showmode				" show current mode down the bottom
set autoread				" reload changes files automatically

" enable syntax highlighting
syntax on


set showmatch

" turn of swap files
set noswapfile
set nobackup
set nowb

" Intendations
set cindent
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

set nowrap
set linebreak

set nolist
set colorcolumn=80


" select all
map <Leader>a ggVG
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>
" NERDTree
map <leader>n :NERDTreeToggle<CR>

