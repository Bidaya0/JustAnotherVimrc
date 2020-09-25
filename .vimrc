set nocompatible              " be iMproved, required
filetype off                  " required

"my setting
set nu
syntax on
set tabstop=4 softtabstop=4
set smartindent
set smartcase
set incsearch
set nowrap
set noswapfile

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

"For markdown 
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'


"MANAGER actully i dont need it
"Plugin 'preservim/nerdtree'

"monakai theme
Plugin 'phanviet/vim-monokai-pro'
"terminal
Plugin 'skywind3000/vim-terminal-help'

"autocomplete
Plugin 'Valloric/YouCompleteMe'
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
let g:netrw_banner = 0
let g:netrw_split = 2
let g:netrw_winsize = 25

" own short script
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

" Add your own mapping. For example:
noremap <silent> <C-B> :call ToggleNetrw()<CR>

"let g:coc_global_extensions = ['coc-json','coc-python']

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vex
"augroup END
