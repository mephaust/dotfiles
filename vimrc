" Load up Pathogen
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

if has("gui_running")
	colorscheme solarized
	let g:solarized_visibility="low"
endif

set background=dark

syntax on
set shiftwidth=4
set shiftround " round indentation to nearest tabstop
set tabstop=4
set softtabstop=4
set noexpandtab

" Listchars
set nolist
set listchars=eol:�
nmap <leader>l :set list!<CR>

set autoindent " retain indentation from line to line

set ruler " show cursor position
set hlsearch " hilight matches of the most recent search
set showmatch " highlight matching parens/brackets
"set cursorline " help me find my damn cursor
filetype plugin indent on " Be smart about indentation
set number " show line numbers
set title " set window title to the relevant file
set ignorecase " search case-insensitive by default
set smartcase " ...unless I use caps
set incsearch " search-as-you-type
set guioptions-=T " fuck the toolbar
set wildmenu " super :e completion goodness
set showcmd " show some extra info about visual mode

set modeline

let g:explHideFiles='.*\.pyc$' " don't bother showing me .pyc

if exists('+colorcolumn')
	set colorcolumn=80
endif

command W w !sudo tee % >/dev/null

"let python_highlight_all = 1
