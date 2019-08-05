
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

Plugin 'https://github.com/leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'

Plugin 'mxw/vim-jsx'

Plugin 'pangloss/vim-javascript'

Plugin 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plugin 'ternjs/tern_for_vim'

Plugin 'othree/jspc.vim'

Plugin 'nathanaelkane/vim-indent-guides'

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
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,ts,tsx,xml}"
  \ -g "!{.git,node_modules,vendor}/*" '

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

command! -bang -nargs=* FF call fzf#vim#grep(g:rg_command.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4.. '},'up:60%'), <bang>0 )
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -q '.shellescape(s:get_visual_selection())},'up:60%'), <bang>0 )

nnoremap <C-P> :FF<CR>
inoremap <C-P> <Esc> :FF<CR>
vnoremap <C-P> <Esc>:F<CR>

let g:files_command = '
  \ files
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,ts,tsx,xml}"
  \ -g "!{.git,node_modules,vendor}/*" '
command! -bang -nargs=* P call fzf#vim#files('', fzf#vim#with_preview('up'), <bang>)
nnoremap `` :P<CR>
inoremap <S-Space><S-Space> <Esc>:P<CR>

" All of your Plugins must be added before the following line
call vundle#end()            " required

set number
set nocompatible              " be iMproved, required
set omnifunc=syntaxcomplete#Complete#Complete#Complete
filetype off                  " required

syntax on
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
"  " show existing tab with 2 spaces width
set tabstop=2

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


"  " when indenting with '>', use 2 spaces width
set shiftwidth=2
"  On pressing tab, insert 2 spaces
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
" inoremap jj <Esc>

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
hi Search ctermbg=LightBlue
hi Search ctermfg=Black
nmap <CR> O<Esc>
nmap <C-CR> o<Esc>

" ad paragraph up / down to shift- moveement keys
vnoremap <S-j> 5j
vnoremap <S-k> 5k
nnoremap <S-j> 5j
nnoremap <S-k> 5k

" map ctrl j and k to top and bottom of page
vnoremap <C-j> 15j
vnoremap <C-k> 15k
nnoremap <C-j> 15j
nnoremap <C-k> 15k

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
map nf :NERDTreeFocus <CR>
map nff :NERDTreeFind <CR>

noremap w<s-h> :vertical resize +10<CR>
noremap w<s-l> :vertical resize -10<CR>
noremap w<s-j> :resize -10<CR>
noremap w<s-k> :resize +10<CR>

noremap <S-p><S-p> "*p
inoremap <S-p><S-P> <Esc>"*p
vnoremap <S-Y><S-Y> "*y
vnoremap <S-X><S-X> "*d

" un-highlight on space
xnoremap <space> :noh <CR>
noremap <space> :noh <CR>
vnoremap <space> :noh <CR>

noremap gj J

set hidden
set tags=./tags;,tags;
    
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236
map ggg :IndentGuidesToggle<CR>

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
