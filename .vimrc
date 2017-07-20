let mapleader=" "   " #
set shell=/bin/bash " shell out to bash
set textwidth=80    " lines should be <= 80 len
set nocompatible    " #
set laststatus=2    " always show status bar
set hlsearch        " highlight search results
set incsearch       " show results while typing
set ignorecase      " case insensitive search
set smartcase       " allow case sensitive if caps are used
set ttyfast         " #
set number          " enable line numbers
set noerrorbells    " disable terminal bells/beeps on error
set t_Co=256        " 256 colors
set wildmenu        " #
set wildignore+=*/node_modules/*,*/vendor/*

" formatting
set tabstop=2       " two space tabs
set shiftwidth=2    " #
set expandtab       " turn tabs into spaces

" history
set undodir=~/.vim/backups
set undofile
set nobackup
set noswapfile
set backupskip+=*.gpg
set viminfo=

" theme
color neonwave
highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

" highlight 81st column
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v', 100)

" ruby
au BufRead,BufNewFile *.md.erb set ft=eruby.markdown
let g:rspec_command = "!bundle exec rspec {spec}"
nmap <leader>t :echoerr "No build script for this buffer"<cr>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" js
let g:jsx_ext_required = 0

" go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ack
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" ycm
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_filetype_blacklist = { 'rb' : 1, 'ruby': 1, 'erb': 1 }

" airline config
let g:airline_theme = 'luna'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 0

" enable commenting a block with backslash (vim-commentary)
xmap \\  <Plug>Commentary
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine
nmap \\u <Plug>CommentaryUndo

" wrap block to column size with q.
vmap Q gq
nmap Q gqap

call plug#begin('~/.vim/plugged')
Plug 'thoughtbot/vim-rspec'
Plug 'vim-ruby/vim-ruby'
Plug 'jamessan/vim-gnupg'
Plug 'hallison/vim-markdown'
Plug 'fleischie/vim-styled-components'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'fatih/vim-go'
Plug 'Blackrush/vim-gocode', {'rtp':'vim/'}
Plug 'dgryski/vim-godef'
Plug 'mileszs/ack.vim'
Plug 'dag/vim-fish'
" Plug 'Valloric/YouCompleteMe'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elmcast/elm-vim'
call plug#end()

filetype plugin indent on
syntax on
