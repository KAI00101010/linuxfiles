" disable writing a backup file
set	nowritebackup

" format comments automatically, after enter, after o/O, allow gq
au FileType cpp set formatoptions=croq 
au FileType cpp set textwidth=79

" completion function
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" execute
"map <F5> :set makeprg=make<CR>:silent !echo -e "\n\n\nExecuting: make run"<CR>:silent make run<CR>:redraw!<CR>
"map <F6> :set makeprg=make<CR>:silent !echo -e "\n\n\nExecuting: make rundebug"<CR>:make rundebug<CR>:redraw!<CR>

" compile and show errors if there are some
"map <F7> :set makeprg=make<CR>:silent !echo -e "\n\n\nExecuting: make -j8 debug"<CR>:redraw!<CR>:make -j8 debug<CR>:cw<CR>
"map <F8> :set makeprg=make<CR>:silent !echo -e "\n\n\nExecuting: make -j8 "<CR>:redraw!<CR>:make -j8 <CR>:cw<CR>

" go to previous and next error in list
"map <F4> :cn<CR>
"map <F3> :cp<CR>

" set scrolloff context lines
set so=999

" activate syntax highlighting
syntax on

" activate line numbers
"set number

" set tab behaviour
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
au FileType make setlocal noexpandtab

" activate indenting
set smartindent

" window movements in normal and edit mode
map <m-up>    <c-w>k
map <m-down>  <c-w>j
map <m-left>  <c-w>h
map <m-right> <c-w>l

map! <m-up>    <ESC> <c-w>k
map! <m-down>  <ESC> <c-w>j
map! <m-left>  <ESC> <c-w>h
map! <m-right> <ESC> <c-w>l

" window formatting - increase, decrease size, maximize
map <c-up>    4<c-w>-
map <c-down>  4<c-w>+
map <c-right> <c-w>_

" window minimal height settings
set winheight=3
set winminheight=3

" always show a status bar
set laststatus=2

" display file, line number and position
set ruler

" folding
set foldmethod=marker
"set foldignore=#

" color settings
highlight Folded ctermbg=black ctermfg=darkcyan
highlight Comment ctermfg=Cyan
highlight DiffChange ctermbg=blue

" dont highlight searches
set nohlsearch

" substitute behaviour: always substitute in whole line
set gdefault

" ignore case and override if the seach pattern contains
" uppercase chars
set ignorecase
set smartcase

" enable backspacing over everything
set backspace=indent,eol,start

" activate mouse
set mouse=a

" activate man page plugin - :Man <bla>
runtime! ftplugin/man.vim

" set completion mode
" set wildmode=list,full

" set a scalable font in windows
if has('gui_running')
  if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h9:cANSI:qDRAFT
  endif
endif
