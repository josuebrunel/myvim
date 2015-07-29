"Starting
filetype on
set nu " Line number
set tabstop=4 " tab width
set shiftwidth=4 " indent width
set softtabstop=4 " dealing with combination of space and tab used to simulate ...
set smarttab " make "tab" insert indents instead of tabs at the beginning of a line
set expandtab " always uses spaces instead of tab characters
set backspace=2 " Fixes backspace issues
set autoindent "always set autoindenting on
set copyindent "copy the previous indentation on autoindenting

"Clear highlight search
nmap <silent> ,/ :nohlsearch<CR>

"Syntax highlighting and validation
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype


"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

"Code Folding
set foldmethod=indent
set foldlevel=99

"Window split keymap
"Vertical Split : Ctrl+w + v
"Horizontal Split: Ctrl+w + s
"Close current windows: Ctrl+w + q

"Ctrl movement keymap to move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Task List
map <leader>td <Plug>TaskList

"Revision History
map <leader>g :GundoToggle<CR>

"Pep8
let g:pep8_map='<leader>8'

"Tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

"Auto Indent Python
set cindent
autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class

"Golang
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%f

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Rmmenber last position
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Loading .sh file headers
"
autocmd bufnewfile *.php,*.sh,*.py,*.rb,*.c so $HOME/.scripts/headers/header.txt
autocmd bufnewfile *.php,*.sh,*.py,*.rb,*.c exe "1," . 10 . "g/Author          :.*/s//Author          :" 'josuebrunel'
autocmd bufnewfile *.php,*.sh,*.py,*.rb,*.c exe "1," . 10 . "g/Filename        :.*/s//Filename        : " .expand("%")
autocmd bufnewfile *.php,*.sh,*.py,*.rb,*.c exe "1," . 10 . "g/Creation Date   :.*/s//Creation Date   : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.sh,*.py,*.rb,*.c execute "normal ma"
autocmd Bufwritepre,filewritepre *.sh,*.py,*.rb,*.c exe "1," . 10 . "g/Last Modified   :.*/s/Last Modified   :.*/Last Modified   : " .strftime("%c")
autocmd bufwritepost,filewritepost *.sh,*.py,*.rb,*.c execute "normal `a"
