"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|


" PLUGINS:
" Load Plugins using vim-plug under the specified directory
call plug#begin('~/vimfiles/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'captbaritone/better-indent-support-for-php-with-html'
" onehalf needs manual move of files from vim folder in main onehalf plugin folder!
Plug 'sonph/onehalf'
Plug 'vim-airline/vim-airline'
Plug 'ajh17/VimCompletesMe'
Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
call plug#end()


" LOAD VIMRC_DEFAULT VALUES:
source $VIM/_vimrc

" Store undo, backup and swap files in fixed location, not current directory.
" The "//" at the end of each directory means that file names will be built from the complete path to the file with all path separators substituted to percent "%" sign. 
set undodir=~/vimfiles/backup//
set backupdir=~/vimfiles/backup//
set directory=~/vimfiles/backup//

" KEY MAPPINGS:
inoremap jk <Esc>
inoremap jj <Esc>
" Insert empty line below or above from https://stackoverflow.com/questions/6765211/vim-command-to-insert-blank-line-in-normal-mode
nnoremap <silent> [<space> :pu! _<cr>:']+1<cr>
nnoremap <silent> ]<space> :pu _<cr>:'[-1<cr>

" GRAPHICAL STUFF:
set background=dark
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
set guifont=DejaVu\ Sans\ Mono:h11
"set guifont=Source\ Code\ Pro:h11
"set guifont=Consolas:h12:cDEFAULT
set cursorline "highlight cursorline
" Airline - enable tab line
let g:airline#extensions#tabline#enabled = 1

" SEARCH OPTIONS:
" (incsearch already set in default settings)
set ignorecase
set hlsearch

" RELATIVE LINE NUMBERS:
" Automatic toggling between 'hybrid' and absolute line numbers from https://jeffkreeftmeijer.com/vim-number/
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" INDENTATION:
" indentation from https://superuser.com/questions/328686/how-do-i-get-correct-indentation-for-html-and-javascript-in-gvim
set autoindent
set tabstop=2
set softtabstop=0
" set noexpandtab
set expandtab
set shiftwidth=2
set shiftround
set autoindent
set copyindent

" ENCODING:
" Encoding in UTF-8
set enc=utf-8
set fileencoding=utf-8
setlocal bomb

" HTML AND PHP COMPLETION:
" Autocomplete html tags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=htmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" Auto closing an HTML tag
iabbrev </<CR> </<C-X><C-O>
autocmd FileType vim let b:vcm_tab_complete = 'vim'
" Activate Omni completion <c-x><c-o> for html tags with VimCompletesMe
autocmd FileType html,php let b:vcm_omni_pattern = '</'
"autocmd FileType php let b:vcm_tab_complete = 'tags'

" FINDING FILES:
" Search down into subfolders with :find command and * fuzzy find
" Provides tab-completion for all file-related tasks
set path+=**

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/vimfiles/.skeleton.html<CR>4jf>a
" Read an sql connection skeleton, auto indent and move cursor below
nnoremap ,sql :-1read $HOME/vimfiles/.skeletonSQLConn.php<CR>8==8j

