" Jumping commands
nnoremap <leader>gi :GoToInclude
nnoremap <leader>gd :GoToDeclaration
nnoremap <leader>gn :GoToDefinition
nnoremap <leader>gr :GoToReferences

" Info commands
nnoremap <leader>it :GetType
nnoremap <leader>ip :GetParent

" ctrl-i formats a section of code
map <leader>i :pyf /mathworks/hub/share/sbtools/external-apps/llvm/llvm-3.7.0/install/deb7-64/share/clang/clang-format.py<cr>
imap <leader>i <c-o>:pyf /mathworks/hub/share/sbtools/external-apps/llvm/llvm-3.7.0/install/deb7-64/share/clang/clang-format.py<cr>
