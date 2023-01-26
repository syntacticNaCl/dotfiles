" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" vim-plug setup
call plug#begin('~/.config/nvim/autoload/plugged')

" Experimental Plugins
	Plug 'christoomey/vim-tmux-navigator'

" Plugins

" Autocompletion
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	let g:coc_global_extensions = [
		\'coc-emmet',
		\'coc-css', 
		\'coc-html',
		\'coc-json',
		\'coc-tsserver', 
		\'coc-solargraph', 
		\'coc-swagger', 
		\'coc-snippets',
		\'coc-eslint',
		\'coc-vimlsp',
		\'coc-go',
		\'coc-pyright']

" Code linting and helpers
	Plug 'editorconfig/editorconfig-vim'
	Plug 'mattn/emmet-vim'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-surround'
	" Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-eunuch'
	Plug 'yukunlin/auto-pairs'
	Plug 'sheerun/vim-polyglot'
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'
	Plug 'preservim/vimux'
  Plug 'tpope/vim-commentary'


" Editor
	Plug 'scrooloose/nerdtree' 
	Plug 'ryanoasis/vim-devicons' 
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Git
	" Plug 'tpope/vim-fugitive'
	" Plug 'airblade/vim-gitgutter'
	" Plug 'mattn/gist-vim'
	Plug 'mhinz/vim-signify'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-rhubarb'
	Plug 'junegunn/gv.vim'

" Languages

" Ruby 
	Plug 'tpope/vim-rails'
	Plug 'thoughtbot/vim-rspec'

" Javascript 
	Plug 'elzr/vim-json'
	Plug 'pangloss/vim-javascript'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
	Plug 'jparise/vim-graphql'
	" post install (yarn install | npm install) then load plugin only for editing supported files
	Plug 'prettier/vim-prettier', {
		\ 'do': 'yarn install',
		\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }



" Typescript
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'

" Themes
	Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
	Plug 'trusktr/seti.vim'
	Plug 'junegunn/seoul256.vim'
	Plug 'powerline/fonts', { 'do': './install.sh' }
	Plug 'sainnhe/everforest'
	Plug 'joshdick/onedark.vim'

call plug#end()
