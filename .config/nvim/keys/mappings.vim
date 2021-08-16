" KEYBINDINGS {

	"" Buffers
    set hidden
    nmap <leader>n :enew<cr>
    nmap <leader>l :bnext<CR>
    nmap <leader>h :bprev<CR>
	
    " Buffers
    nmap <leader>b :Buffers<CR>
	
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
	
	" TAB in general mode will move to text buffer
	nnoremap <TAB> :bnext<CR>
	" SHIFT-TAB will go back
	nnoremap <S-TAB> :bprevious<CR>

	" Split window
	nnoremap <leader>w <C-w>v<C-w>l 

	" Strip trailing whitespace
	nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

	" Search with Ack
	nnoremap <leader>ag :Ag

	" Search with Rg
	nnoremap <leader>rg :Rg

	" Fold tag
	nnoremap <leader>ft Vatzf

	" Sort CSS. You're welcome Google
	nnoremap <leader>S vi{ :sort<CR>

	" select text that was just pasted
	nnoremap <leader>v V`]

	" Quickly edit/reload the vimrc file
	" nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
	" nmap <silent> <leader>sv :so ~/.config/nvim/init.vim<CR>

	" Save/Quit
	nmap <silent> <leader>s :w<CR>
	nmap <silent> <leader>q :q<CR>

	" Quick disable highlight
	nnoremap <leader><space> :noh<cr>

	" Escape slashes in url; used for vagrant
	nmap <leader>r/ :s/\//\\\/<CR>

	" Reselect visual block after indent/reindent
	vnoremap < <gv
	vnoremap > >gv

	" Make Y behave like other capitals
	map Y y$

	" Improve up/down movement for wrapped lines
	nnoremap j gj
	nnoremap k gk

	" Use tab to cycle through brackets/parens
	nnoremap <tab> % 
	vnoremap <tab> %

	" Leave insert mode faster
	inoremap jk <ESC>
	inoremap kj <ESC>

	" Use control-c instead of escape
	nnoremap <C-c> <Esc>
	" <TAB>: completion.
	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

	" HARDMODE
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

	" Fugitive
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

	" Vimux 
	nmap <leader>G :call VimuxRunCommand("grunt")<CR>
	
	" EasyMotion 
	" JK motions: Line motions
	map <Leader>j <Plug>(easymotion-j)
	map <Leader>k <Plug>(easymotion-k)

" }
