augroup AutoCommands
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tmux-plugins/vim-tmux'

Plug 'easymotion/vim-easymotion'

"Plug '/usr/local/opt/fzf'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete-clangx'
Plug 'cquery-project/cquery'

call plug#end()

set mouse=a mousemodel=popup_setpos
set rnu
"set macligatures
set guifont=Fira\ Code:h12

set hidden
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
" Disable the candidates in Comment/String syntaxes.
call deoplete#custom#source('_',
            \ 'disabled_syntaxes', ['Comment', 'String'])

" set sources
let g:deoplete#sources = {}
" Change clang binary path
call deoplete#custom#var('clangx', 'clang_binary', '/usr//bin/clang')

let g:deoplete#sources.cpp = ['LanguageClient']
"let g:deoplete#sources.python = ['LanguageClient']
"let g:deoplete#sources.python3 = ['LanguageClient']
"let g:deoplete#sources.rust = ['LanguageClient']
let g:deoplete#sources.c = ['LanguageClient']
let g:deoplete#sources.vim = ['vim']

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
