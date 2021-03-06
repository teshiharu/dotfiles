syntax on 
if !1  | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'


" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Yggdroot/indentLine'
" 予測変換
NeoBundle "Shougo/neocomplete.vim"
" 画面上を移動
NeoBundle 'Lokaltog/vim-easymotion'

" ファイルをツリー表示ctr+e
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" 引数なしでファイルツリーを初期表示
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * execute 'NERDTree ./'
endif

" nerdcommenter の設定(カンマ二つでコメントのオンオフ)
NeoBundle 'scrooloose/nerdcommenter'
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" jkキーを加速
NeoBundle 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" スペース２回でファイル履歴
NeoBundle 'yegappan/mru'
nmap <Space><Space> :MRU<CR>

" ウェブブラウザ
NeoBundle 'plasticboy/vim-markdown'

" サブモードを自由に定義
NeoBundle 'kana/vim-submode'

" 書いたコードを即実行
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split': ''}}
set splitbelow

"色
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'twerth/ir_black'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'fmoralesc/vim-vitamins'
NeoBundle 'altercation/vim-colors-solarized'
"/色

" Required:
call neobundle#end()


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------


" Required:
filetype plugin indent on
set whichwrap=b,s,h,l,<,>,[,] "行頭行末をまたいで左右移動
set number "行番号を表示
set cursorline "カーソル行の背景色を変える
set scrolloff=8 "カーソル上下8行の視界を確保
set t_Co=256 "スクリーンを256色に
set tabstop=2 "tab文字が占める幅
set autoindent "改行時に前の行のインデントを継続
set expandtab "タブ入力をスペースで行う
set showtabline=2 " 常にタブラインを表示
set shiftwidth=2 "自動インデントでずれる幅
"set colorcolumn=80 "80文字目に縦ライン

"色変更
autocmd colorscheme molokai highlight Cursor guifg=Purple guibg=Purple
autocmd colorscheme molokai highlight Visual ctermbg=8
" colorscheme Tomorrow-Night-Bright 
colorscheme molokai 

"esc2回でハイライトを消す
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
"検索する際にハイライトON
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#
"0で行末に移動
noremap 0 $
"1で行頭に移動
noremap 1 0
"ノーマルモードでもエンターで改行
nnoremap <CR> A<CR><ESC>
"ノーマルモードでもスペース入力
"nnoremap <Space> i<Space><Right><ESC>
"ノーマルモードでもバックスペース
nnoremap <BS> X
"挿入モードでもCtrl＋で移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"ctrm押しながらでスピードアップ
noremap <C-j> jjj
noremap <C-k> kkk
noremap <C-h> hhh
noremap <C-l> lll
" jjでエスケープ
imap jj <esc>
" PerlTidy Perl/Tidyがインストールされている必要あり
map ,ptv <Esc>:'<,'>! perltidy<CR>
map ,pt <Esc>:%! perltidy<CR>
" ファイルを閉じてもundo,redoがのこる
if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

"------画面分割----------
nnoremap s <Nop>
"ss svで画面分割
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
"sqでファイルを閉じる
nnoremap sq :<C-u>q<CR>
nnoremap sw :<C-u>w<CR>
nnoremap swq :<C-u>wq<CR>
"s hjklで画面分割間を移動
"sw 次の画面に移る
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
"s HJKLで分割した画面を移動させる
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
"s><+-画面幅調節
"s= 画面幅を揃える
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
nnoremap s= <C-w>=

"------タブ関連----------
"st 新規タブ sn,spでタブ移動
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction
" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= ' ' . no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

"ステータスバー的なやつ
set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ }

" vimrcを保存した時に自動更新
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

"全角スペースと行末の半角スペースをハイライト表示
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=darkred ctermbg=darkred
  autocmd VimEnter,WinEnter * match TrailingSpaces /　\|\s\+$/
augroup END

set cursorline
set cursorcolumn
highlight CursorColumn ctermbg=239
highlight CursorLine ctermbg=239
" 挿入モードの時のみ、カーソル行をハイライトする
autocmd InsertEnter * highlight CursorLine ctermbg=23
autocmd InsertLeave * highlight CursorLine ctermbg=240
hi Comment ctermfg=246

" add syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby
au BufRead,BufNewFile *.scss set filetype=sass

" インデントを見やすく表示
let g:indentLine_color_term = 242
let g:indentLine_char = "┆"

" xでのヤンクでクリップポードを上書きしないように
noremap x "_x

" 予測変換 {{{
  highlight Pmenu ctermbg=4
  highlight PmenuSel ctermbg=1
  highlight PMenuSbar ctermbg=4
  " 補完ウィンドウの設定
  set completeopt=menuone
  " 補完ウィンドウの設定
  set completeopt=menuone
  " rsenseでの自動補完機能を有効化
  let g:rsenseUseOmniFunc = 1
  " let g:rsenseHome = '/usr/local/lib/rsense-0.3'
  " auto-ctagsを使ってファイル保存時にtagsファイルを更新
  let g:auto_ctags = 1
  " 起動時に有効化
  let g:neocomplcache_enable_at_startup = 1
  " 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplcache_enable_smart_case = 1
  " _(アンダースコア)区切りの補完を有効化
  let g:neocomplcache_enable_underbar_completion = 1
  let g:neocomplcache_enable_camel_case_completion  =  1
  " 最初の補完候補を選択状態にする
  let g:neocomplcache_enable_auto_select = 1
  " ポップアップメニューで表示される候補の数
  let g:neocomplcache_max_list = 20
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplcache_min_syntax_length = 3
  " 補完の設定
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
  if !exists('g:neocomplete#keyword_patterns')
          let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" }}} 

" vim-easymotion {{{
let g:EasyMotion_do_mapping = 0
nmap m <Plug>(easymotion-sn)
xmap m <Plug>(easymotion-sn)
map m <Plug>(easymotion-sn)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'asdfghjklweruioty'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
hi EasyMotionTarget guifg=#80a0ff ctermfg=81
" }}}

