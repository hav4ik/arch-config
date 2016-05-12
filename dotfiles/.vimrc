"call pathogen#infect()
"call pathogen#helptags()

" ---------------- VUNDLE --------------
filetype off
" set nocompatible

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage vundles
" Required!
Plugin 'VundleVim/Vundle.vim'

" Python autocompletion

Plugin 'davidhalter/jedi-vim'
"NOTE: disabled for being too slow
"Plugin 'Valloric/YouCompleteMe'
"NOTE: disabled for not compatible with jedi-vim
"Plugin 'klen/python-mode'

"NOTE: need to make them work!
" Snippet plugins
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'

" General plugins
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jistr/vim-nerdtree-tabs'

call vundle#end()

" disable this shit for c++, we're pro and we need only clang_complete
" let g:ycm_filetype_blacklist = {
"	\ 'cpp' : 1
" \}

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"--------------END VUNDLE --------------
set number



" ----- commmon settings -----
highlight LineNr guibg=grey
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=utf8
set laststatus=2
set foldmethod=indent
set foldlevel=99

" Vim-airline customizations
let g:Powerline_symbols='fancy'
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1

" ---------- C++ is love C++ is life -------------
let g:clang_complete_auto=1
set completeopt-=preview

" Python configurations
let g:pymode_rope=0
let g:pymode_virtualenv=1
let NERDTreeIgnore=['\.pyc$']

" Autocompletion snippet configurations
" let g:snips_trigger_key = '<c-\>'
set runtimepath+=~/.vim/bundle/vim-snipmate/after

" ----- virtual env ----------------
let g:airline#extensions#virtualenv#enabled = 1


" Add the virtualenv's site-packages to vim path
if filereadable($VIRTUAL_ENV . '/.vimrc')
	source $VIRTUAL_ENV/.vimrc
endif


" Visual customizations
autocmd vimenter * color jellybeans
autocmd vimenter * AirlineRefresh


" NERD Tree and nerd-tree-tabs
"autocmd vimenter * NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
map <C-n> :NERDTreeTabsToggle<CR>


" Programming contests customization
autocmd BufRead,BufNewFile *.cont.cc setlocal filetype=cppcontest.cpp
autocmd BufRead,BufNewFile *.cont.cpp setlocal filetype=cppcontest.cpp
