set nocompatible

" Disable filetype for Vundle
filetype off

set runtimepath^=~/.vim

call plug#begin('~/.vim/plugged')

" Codedark Theme
Plug 'tomasiser/vim-code-dark'
" Status/Tab line
Plug 'vim-airline/vim-airline'
" Themes for status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' " Tree file explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " Git status for NERDTree
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'plasticboy/vim-markdown'
" Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
" File search, install pulls latest binary
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on

let mapleader = ","
let g:mapleader = ","

if &term == "alacritty"
  let &term = "xterm-256color"
endif

""""""""
"""""""""""""" Plugin Specific Changes """"""""""""""""""""
""""""""


"""""" Airline


let g:airline#extensions#tabline#enabled = 1

""" Don't show mode explicitly, Airline tab shows it anyway
set noshowmode

let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 90,
      \ 'x': 70,
      \ 'y': 90,
      \ 'z': 50,
      \ 'warning': 80,
      \ 'error': 80,
      \ }


"""""" NERDTree

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

nnoremap <C-t> :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror


""""""NERDCommenter

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"Vim-Devicons Configurations
let g:webdevicons_enable = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" let g:WebDevIconsOS = 'Ubuntu'

""""""""" PLasticboy Markdown
set conceallevel=2
let g:vim_markdown_conceal = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" """"""""" VimTex
" let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
" set conceallevel=1
" let g:tex_conceal='abdmg'

"""""""""" vim-gitgutter
" let g:gitgutter_highlight_linenrs = 1


"""""""""" vim-visual-multi
let g:VM_mouse_mappings = 1


"""""""""" FZF Related
nnoremap ff :Files<CR>
nnoremap fzf :FZF
nnoremap bb :Buffers<CR>

"""""""""" auto-pairs related
let g:AutoPairsFlyMode = 1


"""""""""
"""""""""" Appearance and Text"""""""""""
"""""""""
set encoding=UTF-8
set t_Co=256
set termguicolors
set background=dark

colorscheme onedark

" colorscheme codedark
" " Make vim-code-dark work with airline
" let g:airline_theme = 'codedark'

" from https://github.com/Mangeshrex/vim-dots/blob/main/vimrc
highlight LineNr term=italic cterm=NONE ctermfg=Grey ctermbg=NONE gui=NONE guifg=#353b45 guibg=NONE

" Set default font for vim
set guifont=Menlo\ Regular:h18

" Enable syntax highlighting
syntax on

" Change gutter column width of number column
set nuw=5

" This option determines the number of context lines you would like to see
" above and below the cursor
set scrolloff=10

" Set numbering of lines
set number relativenumber

"" Automatically toggle to relative number when in a buffer
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set wrap

" set auto indent and smart indent
set ai si

" Display the status line always
set laststatus=2

set expandtab smarttab
set tabstop=4
set shiftwidth=4

" Show matching brackets when text indicator is over them
set showmatch


" buffer  line configurations
let g:bufferline_modified = '+'

" Automatically change directory (:pwd always follows the current directory)
set autochdir

""""""""""
"""""""""""" Search related tweaks """""""""""""""
""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic


""""""""""""" Misc """"""""""""""""""""
" Turn on wildmenu
set wildmenu

" Set to autoread when a file is changed from outside
set autoread

" Set buffer to modifiable fix error with nerdtree to create a new npde's
set modifiable

"Performance improvements
set synmaxcol=200 "Don't bother highlighting anything over 200 chars

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" enable mouse everywhere
set mouse=a

" use system clipboard
set clipboard+=unnamedplus
set clipboard=unnamedplus
"
"""""""
"""""""""""""" Key Bindings """"""""""""""""""""""
"""""""

" Delete line
inoremap <C-d> <esc>ddi
" Uppercase Previous word
inoremap <C-u> <esc>vbU<esc><end>i

" In normal mode or in insert mode, press Alt-j to move the current line down, or press Alt-k to move the current line up.
" After visually selecting a block of lines (for example, by pressing V then moving the cursor down), press Alt-j to move the whole block down, or press Alt-k to move the block up.
nnoremap <C-j> :m .+1<CR>==
" nnoremap ^[j :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" nnoremap ^[k :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Remove search highlights
noremap <silent><CR><CR><CR> :noh<CR>

" Tab and Buffer Navigation
nnoremap <leader>b :ed
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>

" previous buffer
nnoremap <leader>5 :b#<CR>
nnoremap <silent> <leader>w :w<CR>

"""""""""""""""
""""""""""""""""""""" coc autocomplete """"""""""""""""""""""
"""""""""""""""

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

"" Setting to yes for vim gitgutter, so that it shows both line numbers and
"git status
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"""""""""" coc-extensions """""""""""""
let g:coc_global_extensions = ['coc-clangd', 'coc-html', 'coc-prettier', 'coc-css', 'coc-json', 'coc-jedi', ]

"""" coc-css
" @ is a keyword
autocmd FileType scss setl iskeyword+=@-@

" Add Prettier command
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')


""""""" CP Related  """""""

autocmd FileType cpp nnoremap     <leader>rc    :!g++ -g --std=c++17 % -o %:r<CR>
" autocmd FileType cpp nnoremap   <leader>rm    :set makeprg=g++<CR>:make % -o %:r<CR>
autocmd FileType cpp nnoremap     <leader>rr    :!./%:r<CR>
autocmd FileType cpp nnoremap     <leader>rt    :!for f in %:r.*.test; do echo "TEST: $f"; ./%:r < $f; done<CR>
autocmd BufNewFile  *.cp.cpp 0r ~/.vim/templates/cp_cpp_template.cpp

