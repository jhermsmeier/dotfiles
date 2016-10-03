syntax on

set t_Co=256
set background=dark

set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo

set autoindent " Copy indent from last line when starting new line
set encoding=utf-8 nobomb " BOM often causes trouble
set nu " Enable line numbers
set expandtab " Expand tabs to spaces
set esckeys " Allow cursor keys in insert mode
set backspace=indent,eol,start
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set magic " Enable extended regexes
set noerrorbells " Disable error bells
set nostartofline " Don't reset cursor to start of line when moving around
set ofu=syntaxcomplete#Complete " Set omni-completion method
set ruler " Show the cursor position
set shell=/usr/local/bin/fish
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set softtabstop=2 " Tab key results in 2 spaces
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set ttymouse=xterm " Set mouse type to xterm
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
