set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" original repos on github
" vim-scripts repos
Bundle 'DoxygenToolkit.vim'
Bundle 'a.vim'
Bundle 'taglist.vim'
Bundle 'vcscommand.vim'
Bundle 'xmledit'
Bundle 'asciidoc.vim'
Bundle 'ctrlp.vim'
" Bundle 'valgrind.vim'
" non github repos

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


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

"enable detecting filetype, ft-plugins, and ft-indent
filetype plugin indent on 
color koehler
syntax on

" :set filetype -- shows the current filetype
" help autocmd-events to see list of events
augroup Makefiles
    au!
    au BufRead,BufNewFile ?akefile* setlocal noet ts=8 sts=8 sw=8 nowrap
    au BufEnter,BufNewFile *.mak setlocal noet ts=8 sts=8 sw=8 nowrap
augroup END

augroup xml
    au!
    au BufRead,BufNewFile *.fpage,*.fdoc setlocal filetype=xml
    au FileType xml setlocal foldmethod=syntax
augroup END

augroup clang
    au!
    au BufNewFile *.c,*.h,*.cc,*.cpp 0r ~/scripts/header
    au BufNewFile,BufRead *.c,*.h,*.cc,*.cpp nnoremap <leader>c I//<esc>
    "autocmd FileType c,cpp setlocal fmr={,}
    "autocmd FileType c,cpp setlocal fdm=marker
    "autocmd FileType c,cpp setlocal foldcolumn=1
    "autocmd FileType c,cpp,h setlocal cindent
augroup END

" au! FileType python :iabbrev <buffer> iff if:<left>
" au! BufWrite * :echom "Writing Buffer!"

" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.bin let &bin=1
    au BufReadPost *.bin if &bin | %!xxd
    au BufReadPost *.bin set ft=xxd | endif
    au BufWritePre *.bin if &bin | %!xxd -r
    au BufWritePre *.bin endif
    au BufWritePost *.bin if &bin | %!xxd
    au BufWritePost *.bin set nomod | endif
augroup END

augroup docbook
    au!
    au BufRead,BufNewFile *.xml iabbrev _dtd <?xml version='1.0'?><cr> <!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd">
    au BufRead,BufNewFile *.xml iabbrev _t <title>
    au BufRead,BufNewFile *.xml iabbrev _r <reference id="
    au BufRead,BufNewFile *.xml iabbrev _re <refentry>
    au BufRead,BufNewFile *.xml iabbrev _rnd <refnamediv>
    au BufRead,BufNewFile *.xml iabbrev _rn <refname>
    au BufRead,BufNewFile *.xml iabbrev _rp <refpurpose>
    au BufRead,BufNewFile *.xml iabbrev _rs1 <refsect1>
    au BufRead,BufNewFile *.xml iabbrev _rs2 <refsect2>
    au BufRead,BufNewFile *.xml iabbrev _rs3 <refsect3>
    au BufRead,BufNewFile *.xml iabbrev _fs <functionsynopsis>
    au BufRead,BufNewFile *.xml iabbrev _fp <functionprototype>
    au BufRead,BufNewFile *.xml iabbrev _fd <functiondef>
augroup END

augroup txt
    au!
    au BufRead,BufNewFile *.txt unset textwidth=0
augroup END

"set makeprg=make\ -C/users/bchandle/src/fooproject/

nnoremap <leader>ev <esc>:vsp $MYVIMRC<cr>
nnoremap <leader>sv <esc>:source $MYVIMRC<cr>
nnoremap :PrettyXML :%!xmllint --format --encode UTF-8 -
nnoremap <C-wq> <nop>
nnoremap :2html :source $VIMRUNTIME/syntax/2html.vim
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <F1> :TlistToggle<CR>

inoremap jk <esc>

" Surround selection with parenthesis.  Only works starting
" at the end of the visual selection.
vnoremap <leader>( <esc>a)<esc>gvo<esc>i(<esc>f)

"onoremap p i(
"onoremap b /return<cr>
onoremap in( :<c-u>normal! 0f)vi(<cr>

" iabbrev <buffer> --- &mdash;
iabbrev __modeline /* -*- mode: c; indent-tabs-mode: nil; c-basic-offset: 4; -*- */<cr>/* vim: set expandtab shiftwidth=4 softtabstop=4 : */

let g:valgrind_arguments='--leak-check=yes --num-callers=5000'

