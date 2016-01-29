"Starting

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep "Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}
" vim-go plugin
Plugin 'fatih/vim-go'

" All of your "Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :"PluginList       - lists configured plugins
" :"PluginInstall    - installs plugins; append `!` to update or just :"PluginUpdate
" :"PluginSearch foo - searches for foo; append `!` to refresh local cache
" :"PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-"Plugin stuff after this line

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

set wildmenu
set wildmode=list,longest,list,full

set wildignore=*.pyc "ignore files with the listed extensions

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
"

"syntastic
set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%f

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufWritePre *.py :%s/\s\+$//e
iabbrev <// </<C-X><C-O>

" pretty json
command PrettyJSON %!python -m json.tool 
