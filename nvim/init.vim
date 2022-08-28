"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Basic Setup
"*****************************************************************************

set number relativenumber
set noshowmode

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

" Status Bar
Plug 'itchyny/lightline.vim'

" Themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Tree
Plug 'preservim/nerdtree'

" typing
Plug 'jiangmiao/auto-pairs'

" IDE
Plug 'yggdroot/indentline'

" git
Plug 'tpope/vim-fugitive'

call plug#end()

"*****************************************************************************
"" Plugins config
"*****************************************************************************

" Status Bar
	  
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], 
	  \				['gitbranch'],
	  \				['relativepath', 'modified']],
      \   'right': [['kitestatus'], 
	  \				['percent', 'lineinfo'],
	  \				[ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], 
	  \				['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
	  \   'gitbranch': 'FugitiveHead',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ '__colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

" Themes
"Plug 'morhetz/gruvbox'
colorscheme gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = 'dark'

" Kite
let g:kite_supported_languages = ['python', 'javascript', 'go']

"*****************************************************************************
"" Maps
"*****************************************************************************

let mapleader=" "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" Tree
map <Leader>nt :NERDTreeFind<CR>

" Activar de manera manual el autocompletado
inoremap <c-space> <C-x><C-u>
