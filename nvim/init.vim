let mapleader = ' '
filetype plugin indent on
" tab
set textwidth=80
set autoindent noexpandtab tabstop=4 shiftwidth=4
" set tabstop=4 softtabstop=4
" set shiftwidth=4
" set expandtab
set smartindent
" set nowrap

" others
set ex " exec .vim file in directory
set nu rnu
set nohls
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set ignorecase
set termguicolors
set scrolloff=15
set noshowmode
set completeopt=menuone,noinsert,noselect
set signcolumn=yes:1
set colorcolumn=80
set cursorline
let g:nord_cursor_line_number_background = 1

set fillchars+=eob:*

syntax on

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
" Plug 'yuttie/comfortable-motion.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'Yggdroot/indentLine'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
Plug 'kjssad/quantum.vim'
Plug 'sainnhe/edge'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
call plug#end()

" Some colorschemes
" colorscheme xcodedarkhc
" colorscheme nord
" colorscheme edge
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
let ayucolor="mirage"
colorscheme ayu
highlight Normal guibg=none

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunc

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" lightline
let g:lightline = {
    \ 'colorscheme': 'OldHope',
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'fugitive': 'LightlineFugitive'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
" 
function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
    if exists('*fugitive#head')
        let branch = fugitive#head()
        return branch !=# '' ? ''.branch : ''
    endif
    return ''
endfunction

" indentLine
" let g:indentLine_defaultGroup = 'SpecialKey'
" let g:indentLine_setColors = 0
" let g:indentLine_char = '│'

" key mapping
nnoremap G Gzz
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :FZF<CR>
nnoremap <CR> o<Esc>k
nnoremap <C-o> i<CR><Esc>b



" nerdtree show hidden file
let NERDTreeShowHidden=1
" let g:NERDTreeWinSize=25

" Markdown
" let g:mkdp_markdown_css = '/Users/hao/.config/nvim/theme/markdown.css'

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" FZF ignore node_modules
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path '**/node_modules/**' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

source ~/.config/nvim/coc.vim
