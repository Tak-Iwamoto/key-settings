call plug#begin('~/.config/nvim/plugged')

Plug 'jacoborus/tender.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'brooth/far.vim'

" color
Plug '907th/vim-auto-save'

Plug 'jparise/vim-graphql'
Plug 'cespare/vim-toml'
Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()

let mapleader = "\<Space>"

nmap<C-e> :NERDTreeToggle<CR>
nmap f <Plug>(easymotion-overwin-f)
nnoremap <C-p> :GFiles<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

nnoremap <C-f> :Rg<CR>
inoremap <silent> jj <ESC>

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

tnoremap <Esc> <C-\><C-n>
autocmd TermOpen * startinsert
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>

"lsp
nmap <C-d> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <C-i> <Plug>(coc-implementation)
nmap <C-r> <Plug>(coc-references)
nmap <C-.> <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent>ac  <Plug>(coc-codelens-action)
nmap <silent>gh :<C-u>call CocAction('doHover')<cr>
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:auto_save = 1
" airline
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l   :bnext<CR>
nnoremap <leader>w :bdelete<CR>

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
if has("autocmd")
    filetype plugin indent on
    autocmd FileType javascript nmap <Leader>p :Prettier<CR>
    autocmd FileType typescript nmap <Leader>p :Prettier<CR>
    autocmd FileType typescriptreact nmap <Leader>p :Prettier<CR>
    autocmd FileType rust nmap <Leader>p :RustFmt<CR>
    autocmd FileType go nmap <Leader>p :Format<CR>
endif

autocmd ColorScheme * highlight LineNr ctermfg=239
set autoindent
set smartindent
set clipboard+=unnamedplus
set encoding=UTF-8
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

set modifiable
set write
set incsearch ignorecase smartcase hlsearch
set textwidth=0
set hidden
set number
set title

filetype plugin indent on
syntax enable
colorscheme dracula

set completeopt+=menuone
set tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType go setlocal shiftwidth=2 tabstop=2
autocmd FileType rust setlocal shiftwidth=4 tabstop=4

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.config/nvim/snippets"

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:closetag_filenames = '*.html,*.xhtml,*.tsx'

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Constant'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" signify
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none

