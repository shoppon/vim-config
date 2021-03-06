"===============================================================================
"=======Shoppon=================================================================
"===============================================================================
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"===============================================================================
"=======General=================================================================
"===============================================================================
set nocompatible
colo solarized
autocmd FileType text setlocal textwidth=80  "set the most length of text 
set mouse=a
set guioptions-=T
set guioptions-=m
set number
set ruler
set showcmd
set showmode
set incsearch
set hlsearch
set ignorecase smartcase
set laststatus=2
set showmatch
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ 
			\[%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
syntax on
filetype on
filetype plugin on
filetype indent on
set guifont=Lucida_Console:h12
language messages zh_CN.utf-8
"set autochdir
nmap <leader>e :e $VIM/_vimrc<cr>
"auto source _vimrc
autocmd! bufwritepost _vimrc source $VIM/_vimrc
"===============================================================================
"=======Files===================================================================
"===============================================================================
set encoding=utf-8
if has("win32")
	set fileencoding=chinese
	"fullscreen
	au GUIEnter * simalt ~x
else
	set fileencoding=utf-8
endif
set fileencodings=utf-8,gb2312,gbk,latin-1
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
lcd D:\Dropbox\workspace
set nobackup
set noswapfile
set wildignore+=.hg,.git,.svn
set wildignore+=.metadata
"===============================================================================
"=======Format==================================================================
"===============================================================================
set cindent
set smartindent
set formatoptions=tcrqn
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
"===============================================================================
"=======Keymap==================================================================
"===============================================================================
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"-------------------------------------------------------------------------------
"-------tab---------------------------------------------------------------------
"-------------------------------------------------------------------------------
map te :tabnew <CR>
map tn :tabnext <CR>
map tp :tabprevious <CR>
map tc :tabclose <CR>
map <a-1> 1gt
map <a-2> 2gt
map <a-3> 3gt
map <a-4> 4gt
map <a-5> 5gt
map <a-6> 6gt
map <a-7> 7gt
map <a-8> 8gt
map <a-9> 9gt
map <a-0> 10gt
"-------------------------------------------------------------------------------
"-------fold--------------------------------------------------------------------
"-------------------------------------------------------------------------------
set nofen
set fdl=1
set foldenable
set foldmethod=indent
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"-------------------------------------------------------------------------------
"-------move--------------------------------------------------------------------
"-------------------------------------------------------------------------------
imap <c-k> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
"-------------------------------------------------------------------------------
"-------window------------------------------------------------------------------
"-------------------------------------------------------------------------------
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
"-------------------------------------------------------------------------------
"-------leader------------------------------------------------------------------
"-------------------------------------------------------------------------------
let mapleader=","
"===============================================================================
"=======Plugin==================================================================
"===============================================================================
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"-------------------------------------------------------------------------------
"-------vundle------------------------------------------------------------------
"-------------------------------------------------------------------------------
set rtp+=D:\Dropbox\Soft\Vim\vim74\bundle\vundle
call vundle#rc('D:\Dropbox\Soft\Vim\vim74\bundle')
Bundle 'gmarik/vundle'
Bundle 'flazz/vim-colorschemes'
Bundle 'mattn/emmet-vim'
"-------------------------------------------------------------------------------
"-------nerd_tree---------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'scrooloose/nerdtree'
map <F3> :NERDTreeToggle<CR>
imap <F3> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
"-------------------------------------------------------------------------------
"-------nerd_commenter----------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'scrooloose/nerdcommenter'
"-------------------------------------------------------------------------------
"-------tagbar------------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'majutsushi/tagbar'
nmap <F2> :TagbarToggle<CR>
let g:tagbar_type_javascript = {
	\ 'ctagsbin' : 'D:\Program Files\Vim\vim74\bundle\jsctags\jsctags.cmd' 
\}
"-------------------------------------------------------------------------------
"------jsbeautify---------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'maksimr/vim-jsbeautify'
autocmd FileType javascript noremap <buffer>  <F4> :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <F4> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <F4> :call CSSBeautify()<cr>
"let g:config_Beautifier='$Vim/vim-config/.editorconfig'
"-------------------------------------------------------------------------------
"------bufexplorer--------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'widox/vim-buffer-explorer-plugin'
map <F9> :BufExplorer<CR>
"-------------------------------------------------------------------------------
"-------ctrlp-------------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
"-------------------------------------------------------------------------------
"--------surround---------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'tpope/vim-surround'
"-------------------------------------------------------------------------------
"-------easygrep----------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'vim-scripts/EasyGrep'
map f/ <esc>:Grep 
"-------------------------------------------------------------------------------
"-------multiple-cursors--------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=1
"-------------------------------------------------------------------------------
"-------yankring----------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'vim-scripts/YankRing.vim'
nnoremap <silent> <F8> :YRShow<CR>
let g:yankring_max_history = 100
let g:yankring_dot_repeat_yank = 1
let g:yankring_replace_n_pkey = '<a-p>'
let g:yankring_replace_n_nkey = '<a-n>'
"-------------------------------------------------------------------------------
"-------neocomplcache-----------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'Shougo/neocomplcache.vim'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_quick_match = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {}
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><space> pumvisible() ? 
			\neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 0
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"-------------------------------------------------------------------------------
"-------html5-------------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'shoppon/html5.vim'
"-------------------------------------------------------------------------------
"-------supertab----------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'ervandew/supertab'
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-O>" 
"-------------------------------------------------------------------------------
"-------xptemplate--------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'drmingdrmer/xptemplate'
let g:xptemplate_vars = "SParg="
"avoid key conflict
let g:SuperTabMappingForward = '<Plug>supertabKey'
"if nothing matched in xpt, try supertab
let g:xptemplate_fallback = '<Plug>supertabKey'
let g:xptemplate_key = '<c-i>'
let g:xptemplate_brace_complete=1
"-------------------------------------------------------------------------------
"-------airline-----------------------------------------------------------------
"-------------------------------------------------------------------------------
let g:airline#extensions#tabline#enable=1
Bundle 'bling/vim-airline'
"-------------------------------------------------------------------------------
"-------expand-region-----------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'terryma/vim-expand-region'
" Default settings. (NOTE: Remove comments in dictionary before sourcing)
let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1, 
      \ 'ib'  :1, 
      \ 'iB'  :1,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }
map <s-k> <Plug>(expand_region_expand)
map <c-k> <Plug>(expand_region_shrink)
"-------------------------------------------------------------------------------
"-------easymotion--------------------------------------------------------------
"-------------------------------------------------------------------------------
Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader><leader>'
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
"-------------------------------------------------------------------------------
"-------fullscreen--------------------------------------------------------------
"-------------------------------------------------------------------------------
" Win平台下窗口全屏组件 gvimfullscreen.dll
" Alt + Enter 全屏切换
" Shift + t 降低窗口透明度
" Shift + y 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
" Vim启动的时候自动使用当前颜色的背景色以去除Vim的白色边框
if has('gui_running') && has('win32') && has('libcall')
    let g:MyVimLib = 'gvimfullscreen.dll'
    function! ToggleFullScreen()
        call libcallnr(g:MyVimLib, 'ToggleFullScreen', 0)
    endfunction

    let g:VimAlpha = 255
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 80
            let g:VimAlpha = 80
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcallnr(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction
    "映射 Alt+Enter 切换全屏vim
    map <F11> <esc>:call ToggleFullScreen()<cr>
    "切换Vim是否在最前面显示
    nmap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
    "增加Vim窗体的不透明度
    nmap <a-t> <esc>:call SetAlpha(10)<cr>
    "增加Vim窗体的透明度
    nmap <a-y> <esc>:call SetAlpha(-10)<cr>
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
endif
"===============================================================================
"=======Compile=================================================================
"===============================================================================
func! Compile()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -g -o %< "
	elseif &filetype == 'cpp'
		exec "!g++ % -g -o %< "
	elseif &filetype == 'java'
		exec "!javac %"
	endif
endfunc

func! Debug()
	exec "w"
	if &filetype == 'c'
		exec "!gdb %<"
	elseif &filetype == 'cpp'
		exec "!gdb %<"
	elseif &filetype == 'java'
		exec "!jdb %<"
	endif
endfunc

func! Run()
	exec "w"
	if &filetype == 'c'
		exec "! %<"
	elseif &filetype == 'cpp'
		exec "! %<"
	elseif &filetype == 'java'
		exec "!java %<"
	elseif $filetype == 'ruby'
		exec "!ruby %"
	elseif $filetype == 'html'
		exec "! %"
	else
		exec "! %"
	endif
endfunc

map <F5> :call Compile()<CR>
imap <F5> <ESC>:call Compile()<CR>
vmap <F5> <ESC>:call Compile()<CR>
map <F6> :call Run()<CR>
