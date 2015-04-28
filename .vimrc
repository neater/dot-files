" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.

autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

set showmode
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes) in terminals
set helplang=cn
set nu
set nohls
set fileencodings=utf-8,ucs,gb18030,GB2312,GBK,Big5,cp936
set autoindent
set autoread
set cindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autochdir
set expandtab
set winaltkeys=no
set noswapfile
set cursorline
set ruler
set laststatus=2
set paste

""set tag=tags;../tags;../../tags;../../../tags;../../../../../tags;../../../../../../tags;../../../../../../../../tags;
set dict=~/vim
" Source a global configuration file if available
" XXX Deprecated, please move your changes here in /etc/vim/vimrc
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1

let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1

let g:instant_markdown_autostart = 0

let mapleader = ","
map <silent> <leader>tl :TlistToogle<cr>

set winaltkeys=no
"imap <C-k> <Up>
imap <C-j> <Down>
imap <C-h> <left>
imap <C-l> <Right>
imap <C-d> <Del>
imap <C-e> <End>
imap <C-a> <HOME>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

imap {} {}<LEFT><CR><ESC>O
"imap [] []<LEFT>
"imap () ()<LEFT>
"imap <> <><LEFT>
"imap "" ""<LEFT>
imap '' ''<LEFT>
imap ?? /**/<left><left>

inoremap ( ()<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap [ []<ESC>i

inoremap ) <c-r>=ClosePair(')')<CR>

nmap ts :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap tg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap tc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap tt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap te :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap tf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap ti :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap ti :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap td :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap tb <C-t>
nmap t] <C-]>
"nmap * /\C\<<C-R>=expand("<cword>")<CR>\><CR>

nmap T :q<CR>
nmap TT :qa<CR>
nmap TTT :qa!<CR>

inoremap ,, <ESC>
inoremap ;; <End>;<CR>
imap <C-S> <ESC>:w<CR>a
cnoremap ,, <C-u> <Esc>

"nmap <Space> i<Space><Esc>l
nmap <Space> :

cnoremap <C-A> <Home>
vmap <c-c> "+y

cnoremap w!! %!sudo tee > /dev/null %

vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf


"Vuncle
set nocompatible " be iMproved, required
filetype off " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'c.vim'
Bundle 'OmniCppComplete'
Bundle 'taglist.vim'

filetype plugin indent on

set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
