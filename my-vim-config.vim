set encoding=UTF-8
so ~/.vim/scripts/fzf.vim
set path+=/home/username/Work/**
set includeexpr=substitute(v:fname,'^@/','src/','g')
set isfname+=@-@

" italic support
set t_ZH=^[[3m
set t_ZR=^[[23m

"Русская раскладка
"let g:XkbSwitchLib = '/usr/local/lib/libg3kbswitch.so'
"let g:XkbSwitchEnabled = 1

"vim-plug
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'isruslan/vim-es6'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug '/usr/bin/fzf'
Plug 'tpope/vim-commentary'
Plug 'takac/vim-hardtime'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-obsession'
"Plug 'dense-analysis/ale'
Plug 'editorconfig/editorconfig-vim'
Plug 'posva/vim-vue'
Plug 'tpope/vim-abolish'
"Plug 'lyokha/vim-xkbswitch'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'chriskempson/base16-vim'
Plug 'rhysd/git-messenger.vim'
Plug 'vim-test/vim-test'
Plug 'zefei/simple-dark'
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'mileszs/ack.vim'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
Plug 'vim-syntastic/syntastic'
Plug 'mogelbrod/vim-jsonpath'
Plug 'vim-scripts/zoom.vim'

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
Plug 'sainnhe/sonokai'
Plug 'fenetikm/falcon'
Plug 'gryf/wombat256grf'
Plug 'rakr/vim-one'

"hls
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'miyakogi/seiya.vim'

call plug#end()

syntax on

autocmd BufNewFile,BufRead *.vue set filetype=vue

let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

let g:htl_all_templates = 1

"colorscheme onehalfdark

" The configuration options should be placed before `colorscheme sonokai`.
"let g:sonokai_style = 'espresso'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1

let g:one_allow_italics = 1

set termguicolors
set t_Co=256
colorscheme one

"
"highlight Normal guibg=black guifg=#c9d1d9
highlight Normal guibg=black guifg=#ffffff

let g:airline_theme='one'
let g:airline_powerline_fonts=1 
let g:seiya_auto_enable=1
let g:Powerline_symbols='unicode'
"let g:ale_fixers=['eslint', 'stylelint']
"let g:ale_fix_on_save=0
set number hls is 
set relativenumber
set iskeyword -=_
set iskeyword -=-
set go=agit
set expandtab tabstop=2 sw=2
set numberwidth=1
set colorcolumn=120

let NERDTreeShowHidden=1
let g:hardtime_default_on = 0
let g:indentLine_char = '┊'
let g:test#javascript#runner = 'jest'

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
noremap <Leader>* :Ack <cword><cr>

"mappings
nnoremap <C-j><C-o> o<Esc>
nnoremap <C-j><C-p> O<Esc>
nnoremap <C-w>d gg<S-v><S-g>"+y<Esc>
nnoremap <Leader><space> :noh<cr>
nnoremap <CR> :vsplit<cr>
noremap <c-s> <c-a>
noremap <C-w><C-n> :tabnext<CR>
noremap <C-w><C-p> :tabprevious<CR>
noremap <C-t> :tabnew<CR>
noremap <C-b> :bw<CR>
noremap <C-l> :tabnext<CR>
noremap <C-h> :tabprevious<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>
map <Leader> <Plug>(easymotion-prefix)

nmap <Leader>p <Plug>(git-messenger)

map <C-k> XXirem<Esc>Frhs.<Esc>p$

nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Optionally copy path to a named register (* in this case) when calling :JsonPath
let g:jsonpath_register = '+'
" Define mappings for json buffers
noremap <buffer> <silent> <leader>d :call jsonpath#echo()<CR>
noremap <buffer> <silent> <leader>g :call jsonpath#goto()<CR>

inoremap <expr> <CR> Expander()
nnoremap <C-q> :call Fzf_dev() <cr>

set pastetoggle=<F2>
inoremap <silent> <C-q> <ESC>u:set paste<CR>.:set nopaste<CR>gi
hi gitmessengerPopupNormal term=None guifg=#d1d1d1 guibg=#222222 ctermfg=255 ctermbg=234

nnoremap <leader>v :vnew<CR>



" SYNTAX
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
let g:syntastic_javascript_checkers=['eslint']
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0



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


" Files + devicons
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {2..-1} | head -'.&lines.'"'

  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%' })
endfunction
