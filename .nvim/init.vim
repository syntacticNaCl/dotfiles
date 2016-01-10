" Vundle setup
filetype off
call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'bling/vim-airline'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tristen/vim-sparkup'
Plug 'tpope/vim-repeat'
Plug 'wikitopian/hardmode' "Because I hate myself :)
Plug 'yukunlin/auto-pairs'
Plug 'mattn/gist-vim'
Plug 'joonty/vdebug'
Plug 'fholgado/minibufexpl.vim'
Plug 'captbaritone/better-indent-support-for-php-with-html'
Plug 'rking/ag.vim'
" Plug 'ryanoasis/vim-devicons'

" Theme Plugins
Plug 'junegunn/seoul256.vim'
Plug 'croaker/mustang-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'shawncplus/skittles_berry'

" Language Specific
Plug 'mattn/emmet-vim'
Plug 'StanAngeloff/php.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'shawncplus/phpcomplete.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'tpope/vim-haml'
Plug 'skammer/vim-css-color'
Plug 'Shutnik/jshint2.vim'
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'evidens/vim-twig', { 'for': 'twig' }

" Experimental
" Plug 'weierophinney/argumentrewrap'
Plug 'valloric/MatchTagAlways'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/splice.vim'
Plug 'ervandew/supertab'

call plug#end()

" GENERAL SETTINGS
syntax on
filetype plugin on
filetype indent on
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

:let mapleader = ","

" THEME SETTINGS
" colorscheme seoul256
" let g:seoul256_background = 233

colorscheme mustang
" colorscheme monokai
" colorscheme skittles_berry

" NERDTREE
map <C-t> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
let NERDTreeShowHidden=1

" SOURCES
" source ~/dotfiles/.vim/bundle/matchit.zip/plugin/matchit.vim

" SYNTASTIC SETTINGS
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if version >= 700
    set spl=en spell
    set nospell
endif

" CTRLP
let g:ctrlp_show_hidden = 1

"" KEYBINDINGS

"rewrap arugments (cleaner code)
nnoremap <silent> <leader>s :call argumentrewrap#RewrapArguments()<CR>

" BUFFERS & WINDOWS
set hidden

nmap <leader>n :enew<cr>
nmap <leader>l :bnext<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Buffer list and status
nmap <leader>bl :ls<CR>

" Previous buffer
nmap <leader>h :bprevious<CR>

" Splitting
nmap <leader>s :vs<CR>
nmap <leader>hs :split<CR>

" Saving/Quitting
nmap <leader>q :q<CR>
nmap <leader>s :w<CR>

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \}

"" HACKS AND FIXES
autocmd FileType scss set iskeyword+=-

" VIM CSS
let g:cssColorVimDoNotMessMyUpdatetime = 1

" AutoCompletion
" nnoremap <leader><leader> 
let g:UltiSnipsExpandTrigger="<leader>,"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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

" minibufexplorer
let g:miniBufExplMapCTabSwitchBufs = 1

" Navigation
nnoremap <C-j> 10j<cr>
nnoremap <C-k> 10k<cr>
