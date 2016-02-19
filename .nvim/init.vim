" Vundle setup
filetype off
call plug#begin('~/.config/nvim/plugged')

" Plugins

" Experimental {
    Plug 'weierophinney/argumentrewrap'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'sjl/splice.vim'
    Plug 'mileszs/ack.vim'
	if executable('ctags')
		Plug 'majutsushi/tagbar'
	endif
    Plug 'mattn/webapi-vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'benmills/vimux'
" }

" Autocompletion {
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    Plug 'sirver/ultisnips'
    Plug 'honza/vim-snippets'
" }

" Code linting and helpers {
    Plug 'scrooloose/syntastic'
    Plug 'mattn/emmet-vim'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-surround'
    Plug 'tristen/vim-sparkup'
    Plug 'tpope/vim-repeat'
    Plug 'yukunlin/auto-pairs'
    Plug 'captbaritone/better-indent-support-for-php-with-html'
    Plug 'valloric/MatchTagAlways'
    Plug 'ervandew/supertab'
" }

" Commenting {
    Plug 'tomtom/tcomment_vim'
    Plug 'scrooloose/nerdcommenter'
" }

" Debug {
    Plug 'joonty/vdebug'
" }

" File browser and search {
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'sjl/gundo.vim'
    Plug 'scrooloose/nerdtree' 
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'godlygeek/tabular'
    Plug 'Lokaltog/vim-easymotion'
    " Plug 'fholgado/minibufexpl.vim'
    Plug 'rking/ag.vim'
" }

" Git {
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mattn/gist-vim'
" }

" Language Specific

" CSS {
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'groenewege/vim-less', { 'for': 'less' }
" }

" PHP {
    Plug 'spf13/PIV'
    Plug 'arnaud-lb/vim-php-namespace'
    Plug 'StanAngeloff/php.vim'
    Plug 'shawncplus/phpcomplete.vim'
    Plug 'evidens/vim-twig', { 'for': 'twig' }
" }

" Python {
    Plug 'klen/python-mode'
    Plug 'yssource/python.vim'
" }

" Javascript {
    Plug 'elzr/vim-json'
    Plug 'pangloss/vim-javascript'
    Plug 'briancollins/vim-jst'
    Plug 'kchmck/vim-coffee-script'
    Plug 'Shutnik/jshint2.vim'
" }

" " HTML {
    Plug 'amirh/HTML-AutoCloseTag'
    Plug 'gorodinskiy/vim-coloresque'
    Plug 'tpope/vim-haml'
    Plug 'othree/html5.vim'
" }

" Puppet {
    Plug 'rodjek/vim-puppet'
" }

" Theme Plugins
    Plug 'junegunn/seoul256.vim'
    Plug 'croaker/mustang-vim'
    Plug 'altercation/vim-colors-solarized'
    Plug 'sickill/vim-monokai'
    Plug 'shawncplus/skittles_berry'
    Plug 'bling/vim-airline'
	Plug 'powerline/fonts', { 'do': './install.sh' }
	Plug 'flazz/vim-colorschemes'

call plug#end()

" BASIC SETTINGS {
	syntax on
	filetype plugin indent on
	set shell=/bin/zsh
	set number	" Show line numbers
	set linebreak	" Break lines at word (requires Wrap lines)
	set showbreak=+++	" Wrap-broken line prefix
	set spell	" Enable spell-checking
	set visualbell	" Use visual bell (no beeping)
	set ruler	" Show row and column ruler information
	set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	set showcmd                 " Show partial commands in status line and
	set autoindent	" Auto-indent new lines
	set smartindent	" Enable smart-indent
	set smarttab	" Enable smart-tabs
	set shiftwidth=4	" Number of auto-indent spaces
	set softtabstop=4	" Number of spaces per Tab
	set tabstop=4
	set wrap
	set textwidth=79 " Line wrap (number of cols)
	set colorcolumn=85
	set ignorecase	" Always case-insensitive
	set smartcase	" Enable smart-case search
	set gdefault " Global replace
	set incsearch	" Searches for strings incrementally
	set showmatch " Highlight matching brace
	set hlsearch	" Highlight all search results
	set nobackup " No backup file
	set noswapfile " No swap file
	set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
	set foldmethod=indent   
	set foldnestmax=10
	set nofoldenable " do not fold file by default
	set foldlevel=2

	" Use tab to cycle through brackets/parens
	nnoremap <tab> % 
	vnoremap <tab> %

	" other
	set undolevels=1000	" Number of undo levels
	set backspace=indent,eol,start	" Backspace behaviour
	let javascript_enable_domhtmlcss=1
	:let mapleader = ","

	" Save when losing focus
	au FocusLost * :silent! wall

	" Resize splits when the window is resized
	au VimResized * :wincmd =

	" Show trailing whitespace in insert mode only
	augroup trailing
		au!
		au InsertEnter * :set listchars-=trail:⌴
		au InsertLeave * :set listchars+=trail:⌴
	augroup END

	" leave insert mode faster
	inoremap jj <ESC>
	
	" Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
	function! ResCur()
		if line("'\"") <= line("$")
			silent! normal! g`"
			return 1
		endif
	endfunction

	augroup resCur
		autocmd!
		autocmd BufWinEnter * call ResCur()
	augroup END

" }

" Theming {
	" colorscheme seoul256
	colorscheme Tomorrow-Night
	" let g:seoul256_background = 233

	" colorscheme mustang
	" colorscheme monokai
	" colorscheme skittles_berry
" }


" Plugin Settings {
	" NerdTree {
		map <C-t> :NERDTreeToggle<CR>
		map <F7> :tabp<CR>
		map <F8> :tabn<CR>
		let NERDTreeShowHidden=1
		let NERDTreeShowBookmarks=1
		let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
		let NERDTreeChDirMode=0
		let NERDTreeQuitOnOpen=1
		let NERDTreeMouseMode=2
		let NERDTreeShowHidden=1
		let NERDTreeKeepTreeInNewTab=1
		let g:nerdtree_tabs_open_on_gui_startup=0
	" }

	" Syntastic {
		set statusline+=%#warningmsg#
		set statusline+=%{SyntasticStatuslineFlag()}
		set statusline+=%*
		let g:syntastic_always_populate_loc_list = 1
		let g:syntastic_auto_loc_list = 1
		let g:syntastic_check_on_open = 1
		let g:syntastic_check_on_wq = 0
		let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
		nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>

		if version >= 700
			set spl=en spell
			set nospell
		endif
	" }

	" Wildignore/CTRLP {
		let g:ctrlp_working_path_mode = 'ra'
		let g:ctrlp_custom_ignore = {
				\ 'dir':  '\.git$\|\.hg$\|\.svn$',
				\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' 
				\ }

		if executable('ag')
			let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
		elseif executable('ack-grep')
			let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
		elseif executable('ack')
			let s:ctrlp_fallback = 'ack %s --nocolor -f'
		else
			let s:ctrlp_fallback = 'find %s -type f'
		endif
		let g:ctrlp_user_command = {
				\ 'types': {
				\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
				\ 2: ['.hg', 'hg --cwd %s locate -I .'],
				\ },
				\ 'fallback': s:ctrlp_fallback
				\ }
		let g:ctrlp_dont_split = 'NERD_tree_2'
		set wildmenu
		set wildmode=list:longest

		set wildignore+=.hg,.git,.svn                    " Version control
		set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
		set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
		set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
		set wildignore+=*.spl                            " compiled spelling word lists
		set wildignore+=*.sw?                            " Vim swap files
		set wildignore+=*.DS_Store                       " OSX bullshit

		set wildignore+=*.luac                           " Lua byte code

		set wildignore+=migrations                       " Django migrations
		set wildignore+=*.pyc                            " Python byte code

		set wildignore+=*.orig                           " Merge resolution files

		" Clojure/Leiningen
		set wildignore+=classes
		set wildignore+=lib

	" }
	
	" Airline {
		let g:airline_powerline_fonts=1
		set guifont=Inconsolata\ for\ Powerline
	" }
	
	" PIV {
		let g:DisableAutoPHPFolding = 0
		let g:PIVAutoClose = 0
	" }
	
	" TagBar {
		nnoremap <silent> <leader>tt :TagbarToggle<CR>
	"}

	" Rainbow {
		let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
	"}
	
	" YouCompleteMe/Autocompletion {
		" enable completion from tags
		let g:ycm_collect_identifiers_from_tags_files = 1

		" remap Ultisnips for compatibility for YCM
		let g:UltiSnipsExpandTrigger="<leader>,"
		let g:UltiSnipsJumpForwardTrigger = '<C-j>'
		let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

		" Enable omni completion.
		autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
		autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
		autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
		autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
		autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
		autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
		autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

		" Sassy fix
		autocmd BufNewFile,BufRead *.scss             set ft=scss.css
		autocmd FileType scss set iskeyword+=-

		" PHP and Html together
		au BufRead,BufNewFile *.php set ft=php.html

		let g:ycm_semantic_triggers =  {
			  \   'c' : ['->', '.'],
			  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
			  \             're!\[.*\]\s'],
			  \   'ocaml' : ['.', '#'],
			  \   'cpp,objcpp' : ['->', '.', '::'],
			  \   'perl' : ['->'],
			  \   'php' : ['->', '::'],
			  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
			  \   'ruby' : ['.', '::'],
			  \   'lua' : ['.', ':'],
			  \   'erlang' : [':'],
		  \ }
	" }
	
	" indent_guides {
		let g:indent_guides_start_level = 2
		let g:indent_guides_guide_size = 1
		let g:indent_guides_enable_on_vim_startup = 1
	" }
	
	" Fugitive {
		nnoremap <silent> <leader>gs :Gstatus<CR>
		nnoremap <silent> <leader>gd :Gdiff<CR>
		" nnoremap <silent> <leader>gc :Gcommit<CR>
		nnoremap <silent> <leader>gb :Gblame<CR>
		nnoremap <silent> <leader>gl :Glog<CR>
		" nnoremap <silent> <leader>gp :Git push<CR>
		" nnoremap <silent> <leader>gr :Gread<CR>
		" nnoremap <silent> <leader>gw :Gwrite<CR>
		" nnoremap <silent> <leader>ge :Gedit<CR>
		" Mnemonic _i_nteractive
		" nnoremap <silent> <leader>gi :Git add -p %<CR>
		" nnoremap <silent> <leader>gg :SignifyToggle<CR>
    "}

	let g:mta_filetypes = {
		\ 'html' : 1,
		\ 'xhtml' : 1,
		\ 'xml' : 1,
		\ 'jinja' : 1,
		\ 'php' : 1,
		\ }


	" VIM CSS
	let g:cssColorVimDoNotMessMyUpdatetime = 1


	" Remapping Defaults
	" Unmap the arrow keys
	no <down> ddp
	no <left> <Nop>
	no <right> <Nop>
	no <up> ddkP
	ino <down> <Nop>
	ino <left> <Nop>
	ino <right> <Nop>
	ino <up> <Nop>
	vno <down> <Nop>
	vno <left> <Nop>
	vno <right> <Nop>
	vno <up> <Nop>

	" Removes columns and numbers; allows for easy copy and pasting
	nnoremap <leader>CM :set nonu nolist foldcolumn=0<CR>
	nnoremap <leader>MC :set nu list foldcolumn=1<CR>

	" MiniBufExplorer
	let g:miniBufExplMapCTabSwitchBufs = 1

	" Vimux {
		nmap <leader>G :call VimuxRunCommand("grunt")<CR>
	" }
	
	" EasyMotion {
		" Turn on case insensitive feature
		let g:EasyMotion_smartcase = 1

		" JK motions: Line motions
		map <Leader>j <Plug>(easymotion-j)
		map <Leader>k <Plug>(easymotion-k)
	" }

" }



" KEYBINDINGS {

	"" Buffers
    set hidden
    nmap <leader>n :enew<cr>
    nmap <leader>l :bnext<CR>
    nmap <leader>h :bprev<CR>
	
    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>bq :bp <BAR> bd #<CR>

    " Buffer list and status
    nmap <leader>bl :ls<CR>

    " Previous buffer
    nmap <leader>h :bprevious<CR>

	"" Tabs
	" New tab
	nmap <leader>t :tabnew<CR>
    nmap <leader>L :tabnext<CR>
    nmap <leader>H :tabprev<CR>

	" Tab next

    " split window
    nnoremap <leader>w <C-w>v<C-w>l 

	" strip trailing whitespace
	nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

	" search with Ack
	nnoremap <leader>a :Ag

	" fold tag
	nnoremap <leader>ft Vatzf

	" Sort CSS. You're welcome Google
	nnoremap <leader>S vi{ :sort<CR>

	" select text that was just pasted
	nnoremap <leader>v V`]

	" Quickly edit/reload the vimrc file
	nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
	nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>

	" Save/Quit
	nmap <silent> <leader>s :w<CR>
	nmap <silent> <leader>q :q<CR>

	" Quick disable highlight
	nnoremap <leader><space> :noh<cr>

	" Escape slashes in url; used for vagrant
	nmap <leader>r/ :s/\//\\\/<CR>
" }
