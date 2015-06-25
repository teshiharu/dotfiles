 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

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







"if has('vim_starting')
"  if &compatible
"    set nocompatible               " Be iMproved
"  endif
"
"  " Required:
"  set runtimepath+=/home/teshima_haruki/.vim/bundle/neobundle.vim/
"endif
"
"" Required:
"call neobundle#begin(expand('/home/teshima_haruki/.vim/bundle/'))
"
"" Let NeoBundle manage NeoBundle
"" Required:
"NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'scrooloose/nerdtree'
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
set tabstop=4 "tab文字が占める幅
set autoindent "改行時に前の行のインデントを継続
set expandtab "タブ入力をスペースで行う
set shiftwidth=4 "自動インデントでずれる幅
"set colorcolumn=80 "80文字目に縦ライン

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
inoremap <C-b> <Left>
inoremap <C-f> <Right>

imap <c-j> <esc>

"色変更
autocmd colorscheme molokai highlight Cursor guifg=Purple guibg=Purple
autocmd colorscheme molokai highlight Visual ctermbg=8
colorscheme molokai 

"ステータスバー的なやつ
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

