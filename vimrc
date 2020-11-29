set nocompatible
filetype plugin indent on

"set scs
"set showmatch
"set viminfo='1000,f1,<500
color evening
set completeopt=menuone,longest
set dir=~/.vimswap/
set display+=lastline
set expandtab
set exrc
set formatoptions+=tcrq
set guifont=Menlo\ Regular:h14
set guioptions+=m "no menu
set guioptions-=T "no toolbar
set guioptions-=l "no left scrollbar
set guioptions-=r "no right scrollbar
set hidden
set hls
set linebreak
set mousemodel="popup"
set noic
set nowrap
set nowrapscan
set number
set path+=**
set popt=paper:letter,syntax:y,number:y
set ruler
set scrolloff=2 "scroll at 2 lines to bottom
set secure
set shiftwidth=4
set softtabstop=4
set synmaxcol=300 "syntax on long lines is slow.. limit syntax to 300 columns
set tags=tags;/
set textwidth=80
set wildignore=.c.basis,.c.edited,.c.link,.c.orig,.class,.p
set wildmenu
set wildmode=list:longest
syntax on

" help autocmd-events to see list of events
augroup Makefiles
    au!
    au BufRead,BufNewFile ?akefile* setlocal noet ts=8 sts=8 sw=8 nowrap
    au BufEnter,BufNewFile *.mak setlocal noet ts=8 sts=8 sw=8 nowrap
augroup END

au BufNewFile,BufRead *.arxml set filetype=xml
au BufNewFile,BufRead *.tlc set filetype=tlc

nnoremap :2html :source $VIMRUNTIME/syntax/2html.vim
nnoremap <C-h> 5zh
nnoremap <C-l> 5zl
nnoremap <C-wq> <nop>
nnoremap <f11> :prev<cr>
nnoremap <f12> :next<cr>
nnoremap <leader>W :match none<cr>
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>cs :w<cr>:!seqdiag %; eog %:r.png<cr>
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>fb :Bookmark 
nnoremap <leader>ff :NERDTree 
nnoremap <leader>fg :NERDTreeFind<cr>
nnoremap <leader>gf :let @"=expand("%:p")<cr>
nnoremap <leader>hex :%!xxd<cr>
nnoremap <leader>nohex :%!xxd -r
nnoremap <leader>pa :!p4 add %<cr>
nnoremap <leader>pe :!p4 edit %<cr>
nnoremap <leader>sv :source %<cr>
nnoremap <leader>tv :TagbarOpenAutoClose<cr>
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wk :wincmd k<cr>

let g:go_fmt_command = "goimports"
