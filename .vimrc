execute pathogen#infect()

" GENERAL SETTINGS
syntax on
filetype plugin indent on
set number
set shell=/bin/zsh

set number	" Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set spell	" Enable spell-checking
set visualbell	" Use visual bell (no beeping)

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set autoindent	" Auto-indent new lines
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab

set ruler	" Show row and column ruler information

set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
let javascript_enable_domhtmlcss=1 

" THEME
" colorscheme atom-dark-256
colorscheme seoul256
let g:seoul256_background = 233

" NERDTREE
autocmd vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
nmap <C-V> "+gP
imap <C-V> <ESC><C-V>i
vmap <C-C> "+y 
let NERDTreeShowHidden=1

" SOURCES
source ~/dotfiles/.vim/bundle/matchit.zip/plugin/matchit.vim

" SYNTASTIC SETTINGS
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
