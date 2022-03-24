" Use different colorschemes for different times of a day.
" Ref: https://stackoverflow.com/questions/7588531/vim-set-color-theme-based-off-time-of-day
if strftime("%H") < 18
  colorscheme darkblue
  " https://stackoverflow.com/questions/9065941/how-can-i-change-vim-status-line-color
  hi StatusLine ctermbg=black ctermfg=blue
  highlight LineNr ctermfg=red
else
  colorscheme gruvbox
  highlight LineNr ctermfg=grey
endif


" Unmap F if it has been mapped.
silent! unmap <buffer> F

" Things from LVMTHW
" let maplocalleader = "\\"
" let mapleader = "-"

noremap <c-u> viwU
inoremap <c-u> <esc>viwUi

noremap <leader>c ddO<esc>

nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""
" Customize plugins
""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'c': ['clang-format'],
\   'cpp': ['clang-format', 'clangtidy']
\}

let g:ale_fixers = {
\   'cpp': ['clang-format']
\}

set numberwidth=2
set number
