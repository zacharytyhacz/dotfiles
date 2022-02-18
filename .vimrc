filetype plugin indent on

set background=dark
syntax on
set encoding=utf-8
set nocompatible

" put swap files here
set directory^=$HOME/.vim/tmp//

" keep undo history
set undofile
set undodir=~/.vim/undo

" formatting
set nowrap
set autoindent
set smartindent



" searching
set hlsearch
set incsearch
set ignorecase


" hide highlighted search on enter
nnoremap <CR> :nohlsearch<cr> 


" just hides unsaved buffers
set hidden



" minimum window buffer width
set winwidth=100


" 100 character line guide
set colorcolumn=121


" shrink size of status line
set statusline=\ \ \ \ \ %f\ Line\ %l\ \:%c\ \ \ \ \ \ \ %L\ lines
set laststatus=2


" set distance of lines away from top and bottom
set scrolloff=999


" set horizontal scrolling distance
set sidescroll=8


" prevents macro recording crap
nnoremap Q <esc> 
nnoremap q <esc> 
nnoremap K k


" create blank line below
nnoremap t o<esc>
" create blank line above
nnoremap T O<esc>

" deletes line without removing carriage return
nnoremap df cc<esc>


" remaps ctrl-l to autocomplete words
" imap <C-L> <C-X><C-N>


" remaps ctrl-f to autocomplete paths
imap <C-F> <C-X><C-F>


" changes the buffer dir to current folder of current file
command CDC cd %:p:h

" quickly add and commit current file ( opens full buffer for commit message )
command F !clear && git add %:p && git commit

" quickly show git status 
command GS !clear&& git status

" see git difference of current file
command D !clear && git diff %:p

" git blame of current file
command B !clear && git blame %:p --color-by-age --date=relative

" toggle showing of color column ( 100 character helper )
command C set colorcolumn=101

command VRC tabe ~/.vimrc


" whitespace characters on :set list
"set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:\|


" html tag cursor movement
nnoremap [t vit<esc>`<
nnoremap ]t vit<esc>`>


" refresh syntax on open or 'R'
autocmd BufEnter * :syntax sync fromstart
noremap R :syntax sync fromstart<cr>:set nopaste<cr>


" remove netrw banner
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sizestyle="H"



" tabbing. 4 spaces as one tab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set matchpairs+=<:>


" specific file tabbing
au BufRead,BufNewFile *.blade.php set tabstop=2
au BufRead,BufNewFile *.html set tabstop=2
au BufRead,BufNewFile *.html set shiftwidth=2
au BufRead,BufNewFile *.html set softtabstop=2


" filetype syntax setting
au BufRead,BufNewFile *.js set syntax=javascript
au BufRead,BufNewFile *.html set ft=phtml
au BufRead,BufNewFile *.php set ft=phtml
au BufRead,BufNewFile *.hbs set syntax=html
au BufRead,BufNewFile *.svelte set syntax=html
au BufRead,BufNewFile .env set syntax=sh
au BufRead,BufNewFile .env.example set syntax=sh


" set certain tab settings based on project
autocmd BufNewFile,BufRead /Users/zact/Projects/EP/* set tabstop=4 shiftwidth=4 softtabstop=4
retab


" keep undo history
set undofile
set undodir=~/.vim/undo



" skeleton template files
augroup templates
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")
augroup END


" plugins 
call plug#begin()
Plug 'pangloss/vim-javascript'                  " js support 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " more autocompletition
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'w0rp/ale'                                 " linting
"Plug 'junegunn/goyo.vim'                        " zen mode
"Plug 'Yggdroot/indentLine'                      " indenting help
call plug#end()

" CoC extensions
" coc-html
" coc-tsserver
" coc-sql
" coc-json
" coc-css


" indent line settings
let g:indentLine_setColors = 0
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239


" Goyo width
let g:goyo_width = 100

" Ale linting and git gutter characters
let g:gitgutter_sign_modified = 'c'
let g:ale_sign_error = '!'
let g:ale_sign_warning = '!'
" disable ALE errors for certain files
let g:ale_pattern_options = {'\.min.js$|\.c$|\.h$|\.json$': {'ale_enabled': 0}}

" allow context block helper
let g:context_enabled = 1


""" faster window resizing

" decrease width
nnoremap <C-H> <C-W><
" increase width
nnoremap <C-L> <C-W>>
" decrease height
nnoremap <C-K> <C-W>-
" increase height
nnoremap <C-J> <C-W>+


" ui highlighting
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=black ctermfg=yellow
highlight StatusLine ctermbg=NONE ctermfg=green
highlight Pmenu cterm=NONE ctermfg=green ctermbg=black

highlight CocErrorSign ctermfg=black ctermbg=red
highlight CocWarningSign ctermfg=black ctermbg=yellow
highlight CocInfoSign ctermfg=black ctermbg=yellow

" pop up menu
highlight Pmenu cterm=NONE ctermfg=black ctermbg=white



" tabs highlighting
highlight TabLine ctermbg=black ctermfg=green
highlight TabLineSel ctermbg=green ctermfg=black
highlight TabLineFill ctermbg=red ctermfg=black

" window status line highlighting
"highlight StatusLine ctermbg=NONE ctermfg=green
highlight StatusLine cterm=NONE ctermfg=black ctermbg=white
highlight StatusLineNC cterm=NONE ctermfg=black ctermbg=white

highlight ColorColumn cterm=NONE ctermbg=white


" vimdiff
highlight DiffAdd    cterm=NONE ctermfg=0 ctermbg=2
highlight DiffDelete cterm=NONE ctermfg=0 ctermbg=1
highlight DiffChange cterm=NONE ctermfg=0 ctermbg=6
highlight DiffText   cterm=NONE ctermfg=0 ctermbg=6

function MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return bufname(buflist[winnr - 1])
endfunction

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        " the label is made by MyTabLabel()
        let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    return s
endfunction

set tabline=%!MyTabLine()




set backspace=indent,eol,start

hi StatusLine                  ctermfg=0     ctermbg=2     cterm=NONE
hi StatusLineNC                ctermfg=0     ctermbg=4     cterm=NONE
