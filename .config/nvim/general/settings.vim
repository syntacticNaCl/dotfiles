" BASIC SETTINGS {
	" OLD
	" syntax enable                           " Enables syntax highlighing
	" filetype plugin indent on
	" set autoindent	" Auto-indent new lines
	" set colorcolumn=85
	" set foldlevel=2
	" set foldmethod=indent   
	" set foldnestmax=10
	" set gdefault " Global replace
	" set hidden
	" set hlsearch	" Highlight all search results
	" set ignorecase	" Always case-insensitive
	" set incsearch	" Searches for strings incrementally
	" set linebreak	" Break lines at word (requires Wrap lines)
	" set nobackup " No backup file
	" set nofoldenable " do not fold file by default
	" set noswapfile " No swap file
	" set number	" Show line numbers
	" set ruler	" Show row and column ruler information
	" set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
	" set shiftwidth=4	" Number of auto-indent spaces
	" set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
	" set showbreak=+++	" Wrap-broken line prefix
	" set showcmd                 " Show partial commands in status line and
	" set showmatch " Highlight matching brace
	" set smartcase	" Enable smart-case search
	" set smartindent	" Enable smart-indent
	" set smarttab	" Enable smart-tabs
	" set softtabstop=4	" Number of spaces per Tab
	" set spell	" Enable spell-checking
	" set tabstop=4
	" set textwidth=79 " Line wrap (number of cols)
	" set visualbell	" Use visual bell (no beeping)
	" set wrap
  " set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
  " set virtualedit=onemore             " Allow for cursor beyond last character

	" set leader key
	let g:mapleader = "\<Space>"

	syntax enable                           " Enables syntax highlighing
	if has("autocmd")
		filetype plugin indent on
	endif
	"set autochdir                           " Your working directory will always be the same as your working directory
	set autoindent                          " Good auto indent
	set background=dark                     " tell vim what the background color looks like
	set backspace=indent,eol,start	        " Backspace behaviour
	set clipboard=unnamedplus               " Copy paste between vim and everything else
	set cmdheight=2                         " More space for displaying messages
	set conceallevel=0                      " So that I can see `` in markdown files
	set cursorline                          " Enable highlighting of the current line
	set encoding=utf-8                      " The encoding displayed
	set expandtab                           " Converts tabs to spaces
	set foldmethod=indent   								" Better fold support
	set formatoptions-=cro                  " Stop newline continution of comments
	set hidden                              " Required to keep multiple buffers open multiple buffers
	set iskeyword+=-                      	" treat dash separated words as a word text object"
	set laststatus=0                        " Always display the status line
	set mouse=a                             " Enable your mouse
	set nobackup                            " This is recommended by coc
	set nofoldenable 												" do not fold file by default
	" set noshowmode                          " We don't need to see things like -- INSERT -- anymore
	set nowrap                              " Display long lines as just one line
	set nowritebackup                       " This is recommended by coc
	set number                              " Line numbers
	set pumheight=10                        " Makes popup menu smaller
	set ruler              			            " Show the cursor position all the time
	set shiftwidth=4                        " Change the number of space characters inserted for indentation
	set showtabline=2                       " Always show tabs
	set signcolumn=auto 										" Display sign when it is available; prevents overlap of line numbers with symbol
	set smartindent                         " Makes indenting smart
	set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
	set splitbelow                          " Horizontal splits will automatically be below
	set splitright                          " Vertical splits will automatically be to the right
	set t_Co=256                            " Support 256 colors
	set tabstop=4                           " Insert 4 spaces for a tab
	set timeoutlen=500                      " By default timeoutlen is 1000 ms
	set undolevels=1000	                    " Number of undo levels
	set updatetime=300                      " Faster completion
  set virtualedit=onemore             		" Allow for cursor beyond last character

	au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

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

	" indent_guides {
		let g:indent_guides_start_level = 2
		let g:indent_guides_guide_size = 1
		let g:indent_guides_enable_on_vim_startup = 1
	" }
	
	" Terminal {
		" Turn terminal to normal mode with escape
		tnoremap <Esc> <C-\><C-n>

		" Start terminal in insert mode
		au BufEnter * if &buftype == 'terminal' | :startinsert | endif

		" Open terminal on ctrl+n
		function! OpenTerminal()
			split term://zsh
			resize 10
		endfunction
		nnoremap <c-n> :call OpenTerminal()<CR>

		" Use alt+hjkl to move between split/vsplit panels
		tnoremap <A-h> <C-\><C-n><C-w>h
		tnoremap <A-j> <C-\><C-n><C-w>j
		tnoremap <A-k> <C-\><C-n><C-w>k
		tnoremap <A-l> <C-\><C-n><C-w>l
		nnoremap <A-h> <C-w>h
		nnoremap <A-j> <C-w>j
		nnoremap <A-k> <C-w>k
		nnoremap <A-l> <C-w>l
	" }
	
	" Vimux {
		nmap <leader>G :call VimuxRunCommand("grunt")<CR>
	" }
	
	autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
	autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" }
