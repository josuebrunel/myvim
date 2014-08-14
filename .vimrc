"Starting
filetype off
set nu " Line number
set tabstop=4 " tab width
set shiftwidth=4 " indent width
set softtabstop=4 " dealing with combination of space and tab used to simulate ...
set smarttab " make "tab" insert indents instead of tabs at the beginning of a line
set expandtab " always uses spaces instead of tab characters

"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

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

"Syntax highlighting and validation
syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

"Pep8
let g:pep8_map='<leader>8'

"Tab completion and documentation
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

"Auto Indent Python
set cindent
autocmd FileType python setlocal foldmethod=indent smartindent shiftwidth=4 ts=4 et cinwords=if,elif,else,for,while,try,except,finally,def,class
