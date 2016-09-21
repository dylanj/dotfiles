set shell=/bin/bash " I use fish, and vim doesn't like it.
set textwidth=80 " Ideally columns should be <= 80 len
set nocompatible " Vi sucks.
set laststatus=2 " Always show status bar.
set hlsearch " Highlight searches
set incsearch " Start searching as you type
set ignorecase " Case insensitive searches by default
set smartcase " But allow case sensitive if caps are used
set ttyfast " Let VIM know it can send lots of data to the terminal
set number " Line numbering
set noerrorbells " Disable terminal bells/beeps on error
set t_Co=256 " 256 Color Terminal
set wildmenu " A menu for command completion

" Formatting
set tabstop=2 " Tabs are two spaces.
set shiftwidth=2 " This should be the same as tabstop but i dont know why
set expandtab " spaces > tabs

" Highlight the 81st column so I know when my lines are too long.
highlight ColorColumn ctermbg=yellow
call matchadd('ColorColumn', '\%81v', 100)

" Wraps a selection to the column size
vmap Q gq
nmap Q gqap

" Options
let mapleader=" "

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" NGINX Support
Plugin 'nginx.vim'

au BufRead,BufNewFile
 \ /etc/nginx/*,/usr/local/nginx/conf/*,nginx.conf
 \ if &ft == '' | setfiletype nginx | endif

" RUBY Support
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'

let g:rspec_command = "!bundle exec rspec {spec}"
nmap <Leader>t :call RunCurrentSpecFile()<CR>
nmap <Leader>s :call RunNearestSpec()<CR>
nmap <Leader>a :call RunAllSpecs()<CR>

" Markdown
Plugin 'hallison/vim-markdown'

" HTML5, CSS3, JS
Plugin 'pangloss/vim-javascript'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'

" Go
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode', {'rtp':'vim/'}
Plugin 'dgryski/vim-godef'

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Code Exploration
Plugin 'majutsushi/tagbar'
nmap <Leader>a :TagbarToggle<CR>

  let g:tagbar_type_go = {  
      \ 'ctagstype' : 'go',
      \ 'kinds'     : [
          \ 'p:package',
          \ 'i:imports:1',
          \ 'c:constants',
          \ 'v:variables',
          \ 't:types',
          \ 'n:interfaces',
          \ 'w:fields',
          \ 'e:embedded',
          \ 'm:methods',
          \ 'r:constructor',
          \ 'f:functions'
      \ ],
      \ 'sro' : '.',
      \ 'kind2scope' : {
          \ 't' : 'ctype',
          \ 'n' : 'ntype'
      \ },
      \ 'scope2kind' : {
          \ 'ctype' : 't',
          \ 'ntype' : 'n'
      \ },
      \ 'ctagsbin'  : 'gotags',
      \ 'ctagsargs' : '-sort -silent'
    \ }

" Search
Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Autocomplete
Plugin 'Valloric/YouCompleteMe'

nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_autoclose_preview_window_after_completion=1

" Disable YCM for Ruby.
let g:ycm_filetype_blacklist = { 'rb' : 1, 'ruby': 1, 'erb': 1 }

" Fish Shell
Plugin 'dag/vim-fish'

" Syntax Highlighting
Plugin 'scrooloose/syntastic'

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_eruby_ruby_quiet_messages = {'regex': 'possibly useless use of a variable in void context'}

" Theme
highlight link SyntasticError SpellBad
highlight link SyntasticWarning SpellCap
color neonwave

" Status Bar
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme = 'luna' " or paper
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 0

" Easy Comments with Tab
Plugin 'tpope/vim-commentary'

xmap \\  <Plug>Commentary
nmap \\  <CR><Plug>Commentary
nmap \\\ <Plug>CommentaryLine
nmap \\u <Plug>CommentaryUndo

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'

" Trailing Whitespace
Plugin 'ntpeters/vim-better-whitespace'

" History
set undodir=~/.vim/backups
set undofile
set nobackup
set noswapfile

call vundle#end()

filetype plugin indent on
syntax on
