execute pathogen#infect()
syntax on
colorscheme atom-dark-256 
filetype plugin indent on
set number
set wildmenu

autocmd vimenter * NERDTree
map <C-t> :NERDTreeToggle<CR>
map <silent> <C-t> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
map <F8> :tabn<CR>
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
