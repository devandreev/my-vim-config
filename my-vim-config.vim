set encoding=UTF-8
so ~/.vim/scripts/fzf.vim
set path+=/home/leadbro/Work/Projects/scentbook/source/**
set includeexpr=substitute(v:fname,'^@/','','g')
set isfname+=@-@

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'isruslan/vim-es6'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'takac/vim-hardtime'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-obsession'
Plug 'editorconfig/editorconfig-vim'

"autocomplete
let g:deoplete#enable_at_startup = 1
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"colorschemes
Plug 'sonph/onehalf', {'rtp': 'vim/'}

"hls
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'miyakogi/seiya.vim'

call plug#end()

syntax on

set t_Co=256
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts=1 
let g:seiya_auto_enable=1
let g:Powerline_symbols='unicode'
set number hls is 
set relativenumber
set expandtab tabstop=4 sw=4
let NERDTreeShowHidden=1

"mappings
imap jj <ESC>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader><space> :noh<cr>
noremap <c-s> <c-a>
noremap <C-w><C-n> :tabnext<CR>
noremap <C-w><C-p> :tabprevious<CR>
noremap <C-w>n :tabnext<CR>
noremap <C-w>p :tabprevious<CR>
map <C-n> :NERDTreeToggle<CR>
map <Leader> <Plug>(easymotion-prefix)

set pastetoggle=<F2>
inoremap <silent> <C-q> <ESC>u:set paste<CR>.:set nopaste<CR>gi
let g:user_emmet_leader_key='<C-Z>'


nnoremap <leader>v :vnew<CR>

let g:ft = ''
fu! NERDCommenter_before()
  if &ft == 'svelte'
    let g:ft = 'svelte'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        let syn = tolower(syn)
        exe 'setf '.syn
      endif
    endif
  endif
endfu
fu! NERDCommenter_after()
  if g:ft == 'svelte'
    setf vue
    g:ft
  endif
  if g:ft == 'vue'
    setf vue
    g:ft
  endif
endfu
function! Expander()
  let line   = getline(".")
  let col    = col(".")
  let first  = line[col-2]
  let second = line[col-1]
  let third  = line[col]

  if first ==# ">"
    if second ==# "<" && third ==# "/"
      return "\<CR>\<C-o>==\<C-o>O"

    else
      return "\<CR>"

    endif

  else
    return "\<CR>"

  endif

endfunction

inoremap <expr> <CR> Expander()
