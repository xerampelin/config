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
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-sensible'
"Plugin 'SirVer/ultisnips'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


set dir=~/.vimswap/
set softtabstop=4
set shiftwidth=4
set expandtab
set ruler
set number
set hidden
"set incsearch
"set scs
set noic
set hls
set linebreak
set display+=lastline
set synmaxcol=300 "syntax on long lines is slow.. limit syntax to 300 columns
set scrolloff=2 "scroll at 2 lines to bottom
"set viminfo='1000,f1,<500
"set showmatch
set guioptions-=l "no left scrollbar
set guioptions-=r "no right scrollbar
set guioptions-=T "no toolbar
set guioptions+=m "no menu
set textwidth=80
" see help fo-table
set formatoptions+=tcrq
set nowrap
set nowrapscan
set wildmode=list:longest
set wildmenu
set wildignore=.c.basis,.c.edited,.c.link,.c.orig,.class
" I learned the hard way not to set completeopt=longest along with ic.  It will
" possibly match two different cases, and clear whatever partial thing you've
" already written and are trying to complete.  Really annoying.
set completeopt=menuone,longest
set guifont=DejaVu\ Sans\ Mono\ 10
set popt=paper:letter,syntax:y,number:y
set tags=tags;/
set exrc
set secure
let mapleader = "\<Space>"
color default
syntax on

" help autocmd-events to see list of events
augroup Makefiles
    au!
    au BufRead,BufNewFile ?akefile* setlocal noet ts=8 sts=8 sw=8 nowrap
    au BufEnter,BufNewFile *.mak setlocal noet ts=8 sts=8 sw=8 nowrap
augroup END

au BufNewFile,BufRead *.arxml set filetype=xml

set makeprg=$HOME/bin/compile-command.sh
"set makeprg=sbmake\ -distcc\ SEPARATE_DEBUG_SYMBOLS=\ DEBUG=1\ VERBOSE=1"
"set makeprg=sbmake\ SEPARATE_DEBUG_SYMBOLS=\ DEBUG=1\ VERBOSE=1"

" Leader c compile/execute/translate etc commands
command! NoJumpMake make! | copen
nnoremap <leader>cv <esc>:source $MYVIMRC<cr>
nnoremap <leader>cs :w<cr>:!seqdiag %; eog %:r.png<cr>
nnoremap <leader>cp :!p4 edit %<cr>
nnoremap <leader>cr :NoJumpMake<cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Leader f --> filesystem related
nnoremap <leader>fc :let @"=expand("%:p")<cr>
nnoremap <leader>fg :e <cname><cr>
nnoremap <leader>ff :CtrlP<cr>
nnoremap <leader>fb :CtrlPMRU<cr>
nnoremap <leader>ft :NERDTreeToggle<cr>
nnoremap <Leader>fw :w<CR>
nnoremap <leader>fed <esc>:vsp $MYVIMRC<cr>

" Leader y copy/paste, yanking, etc
vmap <Leader>yy "+y
vmap <Leader>yd "+d
nmap <Leader>yp "+p
nmap <Leader>yP "+P
vmap <Leader>yp "+p
vmap <Leader>yP "+P

" Leader b --> buffer related
nnoremap <leader>bb :CtrlPBuffer<cr>

" Leader s --> search related
" not working  nnoremap <leader>sl :echom <c-r><c-w> expand("%")<cr>:cwin<cr>

nmap <Leader><Leader> V

" Leader w --> window management
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>wh :wincmd h<cr>

nnoremap <leader>wJ :wincmd J<cr>
nnoremap <leader>wK :wincmd K<cr>
nnoremap <leader>wL :wincmd L<cr>
nnoremap <leader>wH :wincmd H<cr>

" Unsorted mappings
nnoremap <leader>hex :%!xxd<cr>
nnoremap <leader>nohex :%!xxd -r
nnoremap <leader>st :grep -R <c-r><c-w> .<cr><cr>:cwin<cr>

" Other Mappings
nnoremap <C-l> 5zl
nnoremap <C-h> 5zh
nnoremap <C-wq> <nop>
nnoremap <leader>xmllint :%!xmllint --format --encode UTF-8 -
nnoremap :2html :source $VIMRUNTIME/syntax/2html.vim
nnoremap <f12> :next<cr>
nnoremap <f11> :prev<cr>
nnoremap <f7> :TlistOpen<cr>

nnoremap <leader>w :match Error /\v +$/<cr>
nnoremap <leader>W :match none<cr>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>/<C-R><C-W><CR>

" file name
inoremap <leader>fn <C-R>=expand("%:t:r")<cr>

" YouCompleteMe Config ------------------------------
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_confirm_extra_conf = 0
" end YouCompleteMe Config --------------------------

" CtrlP configuration --------------------------
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'a'
" end CtrlP configuration ----------------------


