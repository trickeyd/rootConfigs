set number
set nocompatible              " be iMproved, required
set omnifunc=syntaxcomplete#Complete#Complete#Complete
filetype off                  " required

syntax on

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
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" !!! Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'SpellCheck'

" Plugin 'http://github.com/ctrlpvim/ctrlp.vim.git'

Plugin 'https://github.com/scrooloose/nerdtree.git'

Plugin 'https://github.com/jistr/vim-nerdtree-tabs.git'

Plugin 'mxw/vim-jsx'

Plugin 'pangloss/vim-javascript'

Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plugin 'ternjs/tern_for_vim'

Plugin 'othree/jspc.vim'

Plugin 'vim-syntastic/syntastic'

Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:syntastic_javascript_checkers = ['jshint']

"jsetup syntastic eslinting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:fzf_layout = { 'down': '~80%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color=always
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '


command! -bang -nargs=* F call fzf#vim#grep(
    \ g:rg_command.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'up:60%'), <bang>0
    \ )

nnoremap <C-P> :F<CR>
inoremap <C-P> <Esc>:F<CR>

let g:files_command = '
  \ files
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* P call fzf#vim#files('', fzf#vim#with_preview('up'), <bang>)
nnoremap <Space><Space> :P<CR>
inoremap <Space><Space> <Esc>:P<CR>

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
"  NERDTreeToggle
"  " show existing tab with 4 spaces width
set tabstop=4

" enable tabbing selections
vmap <Tab> >gv
vmap <S-Tab> <gv

" [buffer number] followed by filename:
set statusline=[%n]\ %t
" for Syntastic messages:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" show line#:column# on the right hand side
set statusline+=%=%l:%c


"  " when indenting with '>', use 4 spaces width
set shiftwidth=4
"  On pressing tab, insert 4 spaces
set expandtab
nnoremap wj <C-W><C-J>
nnoremap wk <C-W><C-K>
nnoremap wl <C-W><C-L>
nnoremap wh <C-W><C-H>

nnoremap 9 <C-o>
nnoremap 0 <C-i>

filetype indent on

set nowrap
set textwidth=0 
set smartindent
set autoindent

set nohidden

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc> 

" Enable mouse support in console
set mouse=a

" This shows what you are typing as a command. I love this!
set showcmd

" Necesary  for lots of cool vim things
set nocompatible

set spell spelllang=en
" set highlight color

hi clear SpellBad
hi SpellBad cterm=undercurl
set hlsearch
hi Search ctermbg=LightYellow
hi Search ctermfg=Red
nmap <CR> O<Esc> 
nmap <C-CR> o<Esc>

" ad paragraph up / down to shift- moveement keys
vnoremap <S-j> }
vnoremap <S-k> {
nnoremap <S-j> }
nnoremap <S-k> {

" map ctrl j and k to top and bottom of page
vnoremap <C-j> <S-l>
vnoremap <C-k> <S-h>
nnoremap <C-j> <S-l>
nnoremap <C-k> <S-h>

" beggining and end of line
vnoremap <C-h> ^
vnoremap <C-l> $
nnoremap <C-h> ^
nnoremap <C-l> $

" begginging and end of word
vnoremap <S-h> b 
vnoremap <S-l> e
nnoremap <S-h> b 
nnoremap <S-l> e

" save
noremap <c-s> :wa<CR>
vnoremap <c-s> <C-c>:wa<CR>
inoremap <c-s> <Esc>:wa<CR>

" quit
noremap <c-q> :q<CR>
vnoremap <c-q> <C-c>:q<CR>
inoremap <c-q> <Esc>:q<CR>

inoremap <LeftMouse> <Esc><LeftMouse>

map nn :NERDTreeToggle <CR>
map nf :NERDTreeFind <CR>

" un-highlight on space
"xnoremap <space> :noh <CR>

set hidden
set tags=./tags;,tags;

