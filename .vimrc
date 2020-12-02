set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'SpellCheck'
"Plugin 'kamykn/CCSpellCheck.vim'
"
"Spelling
Plugin 'kamykn/spelunker.vim'
Plugin 'easymotion/vim-easymotion'

Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jlanzarotta/bufexplorer' 
Plugin 'tpope/vim-fugitive.git' 
Plugin 'dense-analysis/ale'

Plugin 'leafgarland/typescript-vim.git'
Plugin 'peitalin/vim-jsx-typescript'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'arithran/vim-delete-hidden-buffers'
Plugin 'Quramy/tsuquyomi'
Plugin 'lifepillar/vim-mucomplete' 
Plugin 'vim-syntastic/syntastic'
Plugin 'jason0x43/vim-js-indent' 
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
call vundle#end()            " required




"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---    fzf setup    ---%%%%%%%%%%%%%%%%%%%%
let g:fzf_layout = { 'down': '~80%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color=always
  \ -g "*.{js,json,php,md,style,jade,html,config,py,cpp,c,go,hs,rb,conf,ts,tsx,xml}"
  \ -g "!{.git,node_modules,*/node_modules,artifacts,coverage,vendor,lib,*/lib}/*"
  \ '

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

function! s:close_nerd_and_search_with_selection(args, bang)
  let selection = s:get_visual_selection()
  echo selection
  :NERDTreeClose 
  call fzf#vim#grep(g:rg_command.shellescape(a:args), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4.. -q '.shellescape(selection)},'up:60%'), a:bang )
endfunction 

command! -bang -nargs=* CC call <SID>close_nerd_and_search_with_selection(<q-args>, <bang>0 )

command! -bang -nargs=* P call fzf#vim#files('', fzf#vim#with_preview('up'), <bang>)


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---    syntax      ---%%%%%%%%%%%%%%%%%%%%
filetype plugin indent on 
let g:javascript_plugin_jsdoc = 1 
let g:javascript_plugin_ngdoc = 1 
let g:javascript_plugin_flow = 1 
set number
"autocmd BufNewFile,BufRead *.ts,*.tsx,*.jsx,*.js set filetype=typescript.tsx
au BufNewFile,BufRead *.ts,*.tsx set filetype=typescript.tsx
au FocusGained,BufEnter * :silent! ! 
au FocusLost,WinLeave * :silent! noautocmd w 
set autoread
set nowrap
set textwidth=0 
"set smartindent
"set autoindent
set cindent
set cinkeys-=0#
set indentkeys-=0# 

hi clear SpellBad
hi SpellBad cterm=underline
set hlsearch
hi Search ctermbg=Red
hi Search ctermfg=Black
set spelllang=en
set nospell 

augroup vimrc
 autocmd!
 autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END 

let g:typescript_indent_disable = 1 
set backspace=indent,eol,start 

let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_linters_ignore = ['tsserver'] 
" Or in ~/.vim/vimrc:
let g:ale_linters = {
\   'javascript': ['flow-language-server', 'eslint', 'flow' ],
\}

let g:ale_fix_on_save = 1



"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---    skining     ---%%%%%%%%%%%%%%%%%%%%
set cursorline 
"set cursorcolumn 
"hi Cursor ctermbg=15 ctermfg=8 
"hi CursorLine cterm=none term=none  ctermbg=234 ctermfg=none 
"hi CursorColumn cterm=none term=none  ctermbg=234 ctermfg=none 
set lazyredraw
set ttyfast
:set cul! 

syntax on 
set sidescroll=1
set tabstop=2

hi tsxTag guifg=#E06C75 ctermfg=DarkRed
hi tsxTagName guifg=#E06C75 ctermfg=Red
hi tsxOpenTag guifg=#E06C75 ctermfg=DarkRed
hi tsxCloseString guifg=#F99575 ctermfg=DarkRed
hi tsxCloseTag guifg=#F99575 ctermfg=DarkRed
hi tsxAttributeBraces guifg=#F99575 ctermfg=166
hi tsxEqual guifg=#F99575 ctermfg=166
hi tsxAttrib guifg=#F8BD7F ctermfg=214
hi ReactState guifg=#C176A7 ctermfg=99
hi ReactProps guifg=#D19A66 ctermfg=99

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=lightgrey ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkgrey ctermbg=236


hi Normal ctermfg=248 ctermbg=233
highlight NonText ctermfg=232 ctermbg=232 
hi VertSplit ctermfg=232  ctermbg=232
hi LineNr ctermfg=15 ctermbg=233
hi StatusLine ctermfg=145  ctermbg=232
hi StatusLineNC ctermfg=235 ctermbg=231  

" color of opposite bracket
hi matchparen cterm=underline ctermbg=black ctermfg=red 

hi SpelunkerSpellBad cterm=underline ctermfg=none gui=underline guifg=#9e9e9e
hi SpelunkerComplexOrCompoundWord cterm=underline ctermfg=none gui=underline guifg=NONE 

set laststatus=2
set statusline=%{expand('%:t')}%=%4l/%3v\  

let NERDTreeQuitOnOpen=1 

" fix shitty color in tmux
set background=dark 

" MiniBufExpl Colors
"hi MBENormal               guifg=#808080 ctermfg=218
"hi MBEChanged              guifg=#CD5907 ctermfg=218
"hi MBEVisibleNormal        guifg=#5DC2D6 ctermfg=208
"hi MBEVisibleChanged       guifg=#F1266F ctermfg=208
"hi MBEVisibleActiveNormal  guifg=#A6DB29 ctermfg=226
"hi MBEVisibleActiveChanged guifg=#F1266F ctermfg=226
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---     misc.      ---%%%%%%%%%%%%%%%%%%%%

set mouse=a
set ttymouse=sgr 
set showcmd
set nocompatible
set shiftwidth=2
set expandtab
set hidden
set tags=./tags;,tags;

" Use CCSpellCheck.vim. (1 / 0) (default 1)
let g:CCSpellCheckEnable = 1
" Setting for start checking min length of character. (default 4)
let g:CCSpellCheckMinCharacterLength = 4
" Setting for max suggest words list length. (default 50)
let g:CCSpellCheckMaxSuggestWords = 50
" Override highlight group name. (default 'CCSpellBad')
let g:CCSpellCheckMatchGroupName = 'CCSpellBad'
" Override highlight setting.
highlight CCSpellBad cterm=underline 

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1 

"use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
  let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---  completion  ---%%%%%%%%%%%%%%%%%%%%

let g:tsuquyomi_javascript_support = 1
"let g:tsuquyomi_baseurl_import_path = 1 
let g:tsuquyomi_single_quote_import = 1
let g:tsuquyomi_auto_open = 1
 
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] 
 
set completeopt-=preview
set completeopt+=longest,menuone,noselect,noinsert 
let g:mucomplete#enable_auto_at_startup = 1 
let g:tsuquyomi_completion_preview = 1 
set belloff+=ctrlg " If Vim beeps during completion 
"imap qqqqqqqq <plug>(MUcompleteFwd)  
"imap qqqqqqq <plug>(MUcompleteBwd)  

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%---  key mappings  ---%%%%%%%%%%%%%%%%%%%%
" stop MU clash
imap <unique> <C-8> <plug>(MUcompleteBwd)
" map fzf
nnoremap <C-P> :NERDTreeClose<bar>:FF<CR>
inoremap <C-P> :NERDTreeClose<bar><Esc>:FF<CR>
vnoremap <C-P> <Esc>:CC<CR>


nnoremap `` <esc>:NERDTreeClose<bar>:P<CR>

" move between tabs
"nnoremap = :bn<cr>
"nnoremap - :bp<cr>


" enable tabbing selections
nnoremap <Tab> <S-v>>gv<Esc>h 
nnoremap <S-Tab> <S-v><gv<Esc>h 
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <S-Tab> <space><Esc>x<S-v><gv<Esc>i
 


nnoremap wj <C-W><C-J>
nnoremap wk <C-W><C-K>
nnoremap wl <C-W><C-L>
nnoremap wh <C-W><C-H>
nnoremap w<s-j> <C-W><S-J>
nnoremap w<s-k> <C-W><S-K>
nnoremap w<s-l> <C-W><S-L>
nnoremap w<s-h> <C-W><S-H>

set splitbelow
set splitright 
nnoremap w- :split<CR>
nnoremap w_ :vsplit<CR>

nnoremap - <C-o>
nnoremap + <C-i>

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

" this is because i ovverride my system default to 
" use arrow keys when i use control hjkl
nmap <up> <c-k> 
vmap <up> <c-k>
nmap <down> <c-j> 
vmap <down> <c-j>
nmap <left> <c-h> 
vmap <left> <c-h>
nmap <right> <c-l> 
vmap <right> <c-l>

" buffer keys
nnoremap <silent> ww :ToggleBufExplorer<CR>
nnoremap <silent> ws :BufExplorerHorizontalSplit<CR>
nnoremap <silent> wv :BufExplorerVerticalSplit<CR> 


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

noremap <c-s> :wa<CR> 
vnoremap <c-s> <C-c>:wa<CR>
inoremap <c-s> <Esc>:wa<CR>

noremap <c-w><c-w> :DeleteHiddenBuffers<CR> 
vnoremap <c-w><c-w> :DeleteHiddenBuffers<CR>
inoremap <c-w><c-w> :DeleteHiddenBuffers<CR>

" quit
noremap <c-q> :q<CR>
vnoremap <c-q> <C-c>:q<CR>
inoremap <c-q> <Esc>:q<CR>

inoremap <LeftMouse> <Esc><LeftMouse>

map nn :NERDTreeToggle <CR>
map nf :NERDTreeFocus <CR>
map nff :NERDTreeFind <CR>

noremap + :vertical resize +10<CR> 
noremap ) :resize +10<CR>
noremap _ :vertical resize -10<CR>
noremap ( :resize -10<CR>

noremap √ "*P
inoremap √ <space><esc>"*Pa
vnoremap ç "*y
vnoremap ≈ "*d

" search selection in visual
vnoremap * y/<C-R>"<CR>)


" un-highlight on space
xnoremap <space> :noh <CR>
noremap <space> :noh <CR>
vnoremap <space> :noh <CR>

inoremap <S-P><S-O><S-I> console.log({})<Esc>hi
noremap <S-P><S-O><S-I> iconsole.log({})<Esc>hi

noremap gj J

map <C-G><C-G> :IndentGuidesToggle<CR>

set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//

noremap gi :TsuImport<CR>
noremap <C-z> <S-z> 

noremap ® :TsuRenameSymbol<CR>
inoremap ® <esc>:TsuRenameSymbol<CR>
