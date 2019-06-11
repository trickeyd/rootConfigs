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
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, fzf#vim#with_preview('up'), <bang>0)
nnoremap <C-O> :F<CR>

let g:files_command = '
  \ files
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* P call fzf#vim#files('', fzf#vim#with_preview('up'), <bang>)
nnoremap <C-P> :P<CR>

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

let g:syntastic_javascript_checkers = ['jshint']

"jsetup syntastic eslinting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

filetype indent on

set nowrap
set smartindent
set autoindent

" When I close a tab, remove the buffer
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
map <S-j> }
map <S-k> {

" map ctrl j and k to top and bottom of page
map <C-j> <S-l>
map <C-k> <S-h>

" beggining and end of line
map <C-h> ^
map <C-l> $

" begginging and end of word
map <S-h> b 
map <S-l> e

map nn :NERDTreeToggle <CR>

" un-highlight on space
map <space> :noh <CR>
