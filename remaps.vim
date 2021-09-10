" Edit .vimrc
execute "nnoremap <leader>ev :edit " . vimrc_path . "<cr>"
" Reload ~/.vimrc
execute "nnoremap <leader>sop :source " . vimrc_path . "<cr>"

" Save current buffer
nmap <silent> <leader>w :w<CR>
" Quit
nmap <silent> <leader>q :q<CR>

" Yank entire line
nnoremap Y y$

" Delete word - TODO
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Reselect when using ">" or "<" in vmode
vnoremap < <gv
vnoremap > >gv

" Navigation between buffers
nnoremap <leader>bl <c-^>
nnoremap <leader>bd :bdelete <cr>

" Split panes
nnoremap <leader>wsh :vertical split <cr>
nnoremap <leader>wsv :split <cr>
" Navigation between panes
nnoremap H <c-w>h
nnoremap L <c-w>l
nnoremap J <c-w>j
nnoremap K <c-w>k
nnoremap <c-H> <c-w>h
nnoremap <c-L> <c-w>l
nnoremap <c-J> <c-w>j
nnoremap <c-K> <c-w>k
" Resize panes
nnoremap <leader>wrl :vertical resize +10 <cr>
nnoremap <leader>wrh :vertical resize -10 <cr>
nnoremap <leader>wrk :resize +10 <cr>
nnoremap <leader>wrj :resize -10 <cr>

" Tabs
nnoremap <leader>tc :tabclose <cr>
nnoremap <leader>te :tabedit <cr>
nnoremap <leader>tn :tabnext <cr>
nnoremap <leader>tp :tabprevious <cr>


" Copy visual to system clipboard
vnoremap <c-c> "+y
