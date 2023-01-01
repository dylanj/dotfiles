let mapleader=" "   " #
set textwidth=80    " lines should be <= 80 len
set laststatus=2    " always show status bar
set hlsearch        " highlight search results
set incsearch       " show results while typing
set ignorecase      " case insensitive search
set smartcase       " allow case sensitive if caps are used
set number          " enable line numbers
set noerrorbells    " disable terminal bells/beeps on error
set t_Co=256        " 256 colors
set wildmenu        " #
set wildignore+=*/node_modules/*,*/vendor/*
set completeopt-=preview
set termguicolors

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


call plug#begin('~/.vim/plugged')
Plug 'jamessan/vim-gnupg'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'ledger/vim-ledger'                " for ledger
"Plug 'lifepillar/vim-solarized8'        " theme
Plug 'altercation/vim-colors-solarized'
Plug 'ntpeters/vim-better-whitespace'   " cleaning up src
Plug 'tpope/vim-commentary'             " comments
Plug 'thoughtbot/vim-rspec'             " rspec tests
Plug 'vim-test/vim-test'
Plug 'tpope/vim-abolish'                " replace variants of a word
" Plug 'ejholmes/vim-forcedotcom'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'

"Plug 'othree/html5.vim'
"Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
"  Plug 'leafOfTree/vim-svelte-plugin'

"Plug 'vim-scripts/diffchar.vim'
call plug#end()
"let test#strategy = "dispatch"

" vim commentary config
xmap \\  <Plug>Commentary
nmap \\  <CR><Plug>Commentary

" vim rspec config
let g:rspec_command = "!bundle exec rspec {spec}"
nmap <leader>t :echoerr "No build script for this buffer"<cr>
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

nmap <silent> <leader>s :GoTestFunc<CR>
nmap <silent> <leader>t :GoTest<CR>
nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>


color solarized
highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap

if system('uname -r') =~ "Microsoft"
  augroup Yank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe ',@")
  augroup END
endif

highlight link QuickFixLine CursorLine
