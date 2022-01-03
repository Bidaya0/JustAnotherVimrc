






set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030




set nocompatible              " be iMproved, required
"filetype off                  " required

"my setting
set nu
set tabstop=2 softtabstop=2
set smartindent
set smartcase
set incsearch
set nowrap
set noswapfile
set t_RV=
filetype plugin indent on

if $VIM_USE_PROXY == 'TRUE'
	let useproxy = 1
else
	let useproxy = 0
endif

if useproxy
	let proxycommand = ''
else
	let proxycommand = 'proxychains4 -q'
endif


" Check And Init Vim-Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!'.proxycommand.' curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


"MANAGER actully i dont need it
"Plugin 'preservim/nerdtree'

"monakai theme
Plug 'phanviet/vim-monokai-pro'
"terminal
Plug 'skywind3000/vim-terminal-help'

"autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': proxycommand.' ./install.py' }
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
"Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }

Plug 'elixir-editors/vim-elixir'

"Plugin 'vim-syntastic/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'nvie/vim-flake8'
Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
"Plugin 'google/vim-glaive'

Plug 'terryma/vim-multiple-cursors'

"like ctrlp
Plug 'junegunn/fzf',{ 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plugin 'honza/vim-snippets'

"fold
Plug 'pseewald/vim-anyfold'

"git
Plug 'airblade/vim-gitgutter'

"REPL
Plug 'rhysd/reply.vim'
"rainbow ()
Plug 'luochen1990/rainbow'

Plug 'ekalinin/Dockerfile.vim'

Plug 'tpope/vim-surround'

"Plugin 'goerz/jupytext.vim'
"Plugin 'szymonmaszke/vimpyter'

"Debugger
"Plugin 'puremourning/vimspector'

"templates 
Plug 'tibabit/vim-templates'

call plug#end()
" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_python_python_exec = 'python3'
"let g:syntastic_python_checkers = ['pylint' ,  'pyflakes']
"let g:syntastic_python_checkers = ['pyflakes']
"let g:syntastic_aggregate_errors = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jslint', 'eslint']
"let g:syntastic_enable_signs=1

"let g:syntastic_javascript_eslint_exe = 'npm run lint --'

syntax on
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

"ale settings
let g:ale_sign_error = '.X'
let g:ale_sign_warning = '.W'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_enter = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {'python': ['flake8', 'pylint']}
noremap <F2> :ALEToggle<CR>
noremap <F3> :FormatLines<CR>
noremap <F4> :Repl<CR>



"template setting
let g:tmpl_search_paths = ['~/.vim-templates']




let g:rainbow_active = 1
"call maktaba#plugin#Install(maktaba#path#Join([maktaba#Maktaba().location]))
"call glaive#Install()
"Glaive codefmt plugin[mappings]
"augroup autoformat_settings
"  "autocmd FileType bzl AutoFormatBuffer buildifier
"  autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
"  "autocmd FileType dart AutoFormatBuffer dartfmt
"  "autocmd FileType go AutoFormatBuffer gofmt
"  "autocmd FileType gn AutoFormatBuffer gn
"  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
"  "autocmd FileType java AutoFormatBuffer google-java-format
"  autocmd FileType python AutoFormatBuffer yapf
"  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
"  autocmd FileType rust AutoFormatBuffer rustfmt
"  autocmd FileType vue AutoFormatBuffer prettier
"augroup END

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" or
"autocmd Filetype .py AnyFoldActivate " activate for a specific filetype

"set foldlevel=0  " close all folds
" or
set foldlevel=99 " Open all folds

"vimspector
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'


" jupyternotebook
"let g:jupytext_command = 'notedown'
"let g:jupytext_fmt = 'markdown'
"let g:jupytext_to_ipynb_opts = '--to=notebook'
"let g:vimpyter_color = 1
"let g:vimpyter_jupyter_notebook_flags = '--browser=msedge --port=8855'
"let g:vimpyter_nteract_flags = '--browser=msedge --port=8855'
"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
"noremap <F3> :SyntasticReset<CR>
"noremap <F2> :SyntasticCheck<CR>
"function! ToggleSyntastic()
"    for i in range(1, winnr('$'))
"        let bnum = winbufnr(i)
"        if getbufvar(bnum, '&buftype') == 'quickfix'
"            lclose
"            return
"        endif
"    endfor
"    SyntasticCheck
"endfunction
"
"nnoremap <silent><F2> :call ToggleSyntastic()<CR>
"let g:coc_global_extensions = ['coc-json','coc-python']

"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vex
"augroup END
