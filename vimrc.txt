set nocompatible
filetype off

"Bundles

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'embear/vim-localvimrc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'wincent/Command-T'
Plugin 'bitc/vim-hdevtools.git'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/a.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'jeaye/color_coded'
Plugin 'pangloss/vim-javascript'
Plugin 'honza/vim-snippets'
Plugin 'mxw/vim-jsx'
Plugin 'leshill/vim-json'

"Bundles
set rtp+=/usr/local/lib/python3.7/site-packages/powerline/bindings/vim

filetype plugin indent on
syntax on

"if filereadable(expand("~/.vimrc_background"))
"     let base16colorspace=256
"       source ~/.vimrc_background
"    endif

colorscheme grb256

set shell=zsh
set laststatus=2
set shortmess=aoOW

set showcmd
set noswapfile
set nowritebackup
set undolevels=1000
set undoreload=-1

if has('persistent_undo')
   set undodir=~/.vim/backups
   set undofile
endif

au BufWinLeave *.* silent! mkview
au BufWinEnter *.* silent! loadview

set number
set cursorline
set showmatch
set matchpairs+=<:>
set hlsearch
set incsearch

set list
set listchars=tab:::,trail:.,extends:#,nbsp:.
set textwidth=80
hi ColorColumn ctermbg=0

set nowrap
set smartindent
set expandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3
set pastetoggle=<F12>

set wildignore+=*.o,*.hi,*.png,*.tix
set wildignore+=node_modules

"Remove trailing whitespaces on write
au BufWritePre <buffer> :call setline(1, map(getline(1,"$"), 'substitute(v:val, "\\s\\+$","","")'))

"Add linebreaks to syntastic messages.
au FileType qf setlocal wrap linebreak

let mapleader=','

nnoremap ; :

set clipboard=unnamed
vnoremap <C-C> "+y

"copy from cursor to end of line
nnoremap Y y$

nnoremap <Tab> :w<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>

"shows git diff
nnoremap <F11> :GitGutterToggle<CR>

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell setlocal tabstop=4 shiftwidth=4 softtabstop=4

au FileType rust map <leader>g :!cargo build && cargo run<CR>

"window navigation
set wmh=0
map <leader>w <C-W>j<C-W>_
map <leader>s <C-W>k<C-W>_
map <leader>d <C-W>l<C-W>_
map <leader>a <C-W>h<C-W>_

map <C-A> :AS <CR>

" Plugin Options
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_haskell_checkers=['hdevtools']

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

let g:ycm_allow_changing_updatetime = 0
let g:ycm_rust_src_path = '/Users/bradboswell/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

let g:color_coded_enabled = 1
let g:color_coded_filetypes = ['c', 'cpp', 'objc']

let g:localvimrc_whitelist='.*'
let g:localvimrc_sandbox=0

let g:hdevtools_options = '-g -Wall'

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

let g:gitgutter_enabled = 0

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

highlight clear SignColumn

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
" End search
