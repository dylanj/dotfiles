set rtp+=$GOROOT/misc/vim
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'int3/vim-extradite'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/gist-vim'

Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-commentary'
Plugin 'fatih/vim-go'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'othree/html5.vim'
Plugin 'cakebaker/scss-syntax.vim'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'sjl/gundo.vim'

Plugin 'dgryski/vim-godef'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'SirVer/ultisnips'
Plugin 'Blackrush/vim-gocode', {'rtp':'vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'rking/vim-detailed'

Plugin 'bling/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set hlsearch
set incsearch
set ignorecase
set smartcase

set nocp
set background=dark
set t_Co=256
set nu
set backspace=indent,eol,start
set autoread
set ttyfast
set noerrorbells
set novisualbell
set laststatus=2

"set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set nocompatible

set shell=zsh

set undodir=~/.vim/backups
set undofile
set nobackup
set noswapfile

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.log,*.sqlite3,public/assets/*,coverage,vendor
set wildmode=longest:full,full

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1
let g:commentary_map_backslash = 1

color railscasts

cmap w!! w !sudo tee % >/dev/null

let mapleader=" "
nmap <Leader>u :GundoToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>t :call RunCurrentSpecFile()<CR>
nmap <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>

" ultisnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" ycm
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:gist_post_private = 1

set completeopt-=preview
