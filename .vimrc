" Kevin Guenthner .vimrc
" 3/11/2019
"""""""""""""""""""""""""""
colorscheme elflord	" I want to be like ezraboley

set colorcolumn=80	" 80 character limit reminder
set nowrap		" long text will go off screen
syntax enable

" Search Settings
set ignorecase		" ignore case for search patterns
set smartcase		" override ignorecase if search
			" contains uppercase characters
set incsearch		" show where search shows up
set hlsearch		" highlight search results

set cindent		" enalbe automatic C program indenting
set noswapfile		" disables the creation of swap files
set nobackup		" don't create copies while overwriting

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set background=dark

" Have vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Have vim load indentation rules and plugins according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

set showcmd		" Show (partial) command in status line
set mouse=a		" Enable mouse usage (all modes)

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
map <leader>l :set list!<CR>

" Show trailing whitespace and spaces for tabs
map <leader>L /\s\+$<CR>

" Navigating Tabs
" New WinMove function may replace these
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>t :tab split +Explore<CR>
map <leader>T :Explore<CR>

" Tab Character Spacing
set tabstop=4		" number of spaces that a tab counts for
set shiftwidth=4	" number of spaces for auto indent
set expandtab		" insert tabs as spaces

" Quick Insertion
nnoremap <Space> i_<Esc>r

" HTML autocomplete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Kernel-style C
autocmd FileType c call SetKernelRules()
function SetKernelRules()
    set tabstop=8
    set softtabstop=8
    set shiftwidth=8
    set noexpandtab
endfunction

" Status Line
set laststatus=2                               " always show status line
set statusline=%<%f\                           " Filename
set statusline+=%w%h%m%r                       " Options
set statusline+=\ [%{&ff}/%Y]                  " filetype
set statusline+=\ [%{split(getcwd(),'/')[-1]}] " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%        " Right aligned file nav info
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
