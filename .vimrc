" General
if &shell =~# 'fish$'
    set shell=sh
endif
set nocompatible
filetype off
syntax on

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'

" Vundle setup end
call vundle#end()
filetype plugin indent on

" Visual
set t_ut=
set t_Co=256
set background=dark
colorscheme gruvbox
hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235
hi Pmenu ctermbg=238
set statusline=%=%P\ %f\ %m
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
set number
set autoindent
set backspace=indent,eol,start
set formatoptions-=cro
set noet ci pi sts=0 sw=2 ts=2
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" Spacing
set expandtab
set tabstop=2
set shiftwidth=2

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers

" Mappings
let mapleader = ' '
nnoremap <SPACE> <Nop>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap - <Nop>
nnoremap = <Nop>
nnoremap <C-=> <C-W><C-=>
nnoremap <silent> <Leader>= :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "vertical resize " . (winwidth(0) * 2/3)<CR>
nnoremap <silent><CR> :noh<CR><CR>
nnoremap <Leader>q" ciw""<Esc>P
nnoremap <Leader>q' ciw''<Esc>P
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
nmap <silent> <leader>y :NERDTreeFind<cr>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.swp$', '\.o$', '\.tsk$']
let NERDTreeStatusline = ' '

" Ctrlp
nmap <silent> <leader>l :CtrlP<cr>
let g:ctrlp_show_hidden=1
let g:ctrlp_by_filename=1

" Clang format
map <C-I> :py3f ~/.bin/clang-format.py<cr>

"" ITerm2 Cursor change   
let &t_SI = "\<Esc>]1337;CursorShape=1\x7"
let &t_EI = "\<Esc>]1337;CursorShape=0\x7"
