" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }

" Basics {
	set nocompatible 		" must be first line
	set background=dark     " Assume a dark background
" }
 
" General {
	filetype plugin indent on  	" Automatically detect file types.
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage
	"set autochdir 				" always switch to the current file directory.. 
	" not every vim is compiled with this, use the following line instead
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8
	set autowrite
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	set virtualedit=onemore 	   	" allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
	" set spell 		 	     	" spell checking on
	
	" Setting up the directories {
		set backup 						" backups are nice ...
        " Moved to function at bottom of the file
		set backupdir=$HOME/.vim/vimbackup//  " but not when they clog .
		set directory=$HOME/.vim/vimswap// 	" Same for swap files
		set viewdir=$HOME/.vim/vimviews// 	" same but for view files
		
		"" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vim/vimbackup'
		silent execute '!mkdir -p $HOME/.vim/vimswap'
		silent execute '!mkdir -p $HOME/.vim/vimviews'
		au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
	" }
" }

" Vim UI {
	color vibrantink
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set cursorline  				" highlight current line
	hi cursorline guibg=#333333 	" highlight bg color of current line
	hi CursorColumn guibg=#333333   " highlight cursor

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	if has('statusline')
		set laststatus=1           	" show statusline only if there are > 1 windows
		" Use the commented line if fugitive isn't installed
		"set statusline=%<%f\ %=\:\b%n%y%m%r%w\ %l,%c%V\ %P " a statusline, also on steroids
		set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
	endif

	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu 							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	set foldenable  				" auto fold code
	set gdefault					" the /g flag on :s substitutions by default

" }

" Formatting {
	set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=4               	" use indents of 4 spaces
	set noexpandtab 	       		" tabs are tabs, not spaces
	set tabstop=4 					" an indentation every four columns
	"set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F12>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" }

" Key Mappings {

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <S-H> gT
	map <S-L> gt

	" Stupid shift key fixes
	cmap W w 						
	cmap WQ wq
	cmap wQ wq
	cmap Q q
	cmap Tabe tabe

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
" }

"custom
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
autocmd BufNewFile,Bufread *.ros,*.inc,*.php set keywordprg="help"
autocmd BufNewFile,Bufread *.py set keywordprg="pydoc2"
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"syntax on
"filetype on
"au FileType python set ft=python.django 
"au FileType html set ft=htmldjango.html
"au FileType php set ft=php.cakephp
au BufNewFile,BufRead *.ctp set filetype=php
let g:miniBufExplMapWindowNavVim = 1
"进行Tlist的设置
"TlistUpdate可以更新tags
map <F3> :silent! Tlist<CR> "按下F3就可以呼出了
map <F2> :silent! NERDTreeToggle<CR>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0

set undofile
set undodir=$HOME/.vim/vimundo//
silent execute '!mkdir -p $HOME/.vim/vimundo'

let g:SuperTabMappingForward = '<c-space>'
let g:SuperTabMappingBackward = '<s-c-space>'

set helplang=cn

au BufRead,BufNewFile *.ctp set ft=html syntax=php
"au BufRead,BufNewFile *.jinja set ft=html syntax=jinja
"au BufRead,BufNewFile *.jinja set ft=html syntax=htmljinja

au BufRead,BufNewFile *.txt set wrap

set ignorecase smartcase

"nnoremap <silent> <F2> :NERDTreeToggle<CR>

let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1

set guifont=WenQuanYi\ Micro\ Hei\ Mono\ 12

"set clipboard=unnamed
set clipboard=unnamedplus
