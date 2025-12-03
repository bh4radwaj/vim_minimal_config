" Set space as the leader key
let mapleader = " "

" Enable relative line numbers
set relativenumber
set number
set clipboard=unnamedplus

" Map kj to escape to normal mode from insert mode
inoremap kj <Esc>

" Leader + w to save file (works in both normal and insert mode)
nnoremap <leader>w :w<CR>
inoremap <leader>w <Esc>:w<CR>

" Leader + q to quit
nnoremap <leader>q :q<CR>
inoremap <leader>q <Esc>:q<CR>

" Optional: Leader + wq to save and quit
nnoremap <leader>wq :wq<CR>
inoremap <leader>wq <Esc>:wq<CR>

" Optional: Leader + Q to force quit without saving
nnoremap <leader>Q :q!<CR>
inoremap <leader>Q <Esc>:q!<CR>

"file explorer
nnoremap <leader>e :Explore<CR>

" ============================================
" Buffer line configuration (minimal, built-in)
" ============================================

" Always show the tabline (bufferline)
set showtabline=2

" Show buffer number and filename in tabline
set tabline=%!MyTabLine()

function! MyTabLine()
  let s = ''
  for i in range(1, bufnr('$'))
    " Skip unlisted buffers
    if !buflisted(i)
      continue
    endif
    
    " Highlight active buffer
    if i == bufnr('%')
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    
    " Add buffer number and filename
    let s .= "  "
    let s .= fnamemodify(bufname(i), ':t')  " Just filename, no path
    let s .= ' '
  endfor
  
  " Fill the rest with TabLineFill
  let s .= '%#TabLineFill#%T'
  return s
endfunction

" Buffer navigation shortcuts
nnoremap <leader>0 :bnext<CR>
nnoremap <leader>9 :bprev<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>b1 :buffer 1<CR>
nnoremap <leader>b2 :buffer 2<CR>
nnoremap <leader>b3 :buffer 3<CR>
nnoremap <leader>b4 :buffer 4<CR>
nnoremap <leader>b5 :buffer 5<CR>
