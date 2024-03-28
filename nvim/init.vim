call plug#begin('~/.local/share/nvim/plugged')

Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf.vim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'phaazon/hop.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'karb94/neoscroll.nvim'
Plug 'andrewferrier/debugprint.nvim'
" Plug 'kevinhwang91/promise-async'
" Plug 'kevinhwang91/nvim-ufo'
" Plug 'chentau/marks.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

call plug#end()

"==================plugin settings==================
let mapleader=","

set rtp+=~/.local/apps/fzf
" set rtp+=~/repos/bracket_pair_colorizer.nvim
set rtp+=~/repos/marks.nvim
" set rtp+=~/repos/live.nvim

lua <<EOF
-- require'live'.setup()
-- require'marks'.setup {}
require'marks'.setup {
  builtin_marks = {},
--  builtin_marks = {"."},
  mappings = {
    next_bookmark1 = "]]",
    prev_bookmark1 = "[[",
    toggle = false
  },
  bookmark_1 = {
    sign = "⚑",
    -- virt_text="   ⚑ bookmark"
    virt_text = nil,
  },
  sign_priority = {
    upper = 15,
    lower = 12,
    bookmark = 5
    },
  excluded_filetypes = {"text"},
  refresh_interval = 250,
}

require'debugprint'.setup {
  create_keymaps = false
}

vim.keymap.set("n", "<leader>db", function()
  return require'debugprint'.debugprint()
  end, {expr = true})

vim.keymap.set("n", "<leader>dq", function()
  return require'debugprint'.debugprint({variable = true})
  end, {expr = true})

require'nvim-treesitter.configs'.setup {
  highlight = {
      enable = true,
  },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = '<up>',
        node_decremental = '<down>'
      }
  }
}

-- require'ufo'.setup({
--   provider_selector = function()
--     return nil
--   end,
--   open_fold_hl_timeout = 0,
-- })

require'hop'.setup {teasing=false}

require'indent_blankline'.setup {
  char="│",
  indent_level=5,
  show_trailing_blankline_indent=false,
}

require'neoscroll'.setup {
  easing_function = "quadratic",
  hide_cursor = true
}

require'neoscroll.config'.set_mappings {
  ["<c-y>"] = {"scroll", {"-3", "true", "75"}},
  ["<c-e>"] = {"scroll", {"3", "true", "75"}}
}

_G.P = function(...) print(vim.inspect(...)) end
EOF

map <silent> <leader>w <cmd> lua require'hop'.hint_words()<cr>
map <silent> <leader>l <cmd> lua require'hop'.hint_lines_skip_whitespace()<cr>
map <silent> s <cmd> lua require'hop'.hint_char2()<cr>
map <silent> <leader>t <cmd> lua require'hop'.hint_char1()<cr>

" map <silent> <leader>T <Plug>PlenaryTestFile

let g:fzf_preview_window = 'right:70%'

let g:sandwich_no_default_key_mappings=1
let g:operator_sandwich_no_default_key_mappings=1

nmap gs <Plug>(operator-sandwich-add)
nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap cs  <Plug>(operator-sandwich-replace)<Plug>(textobj-sandwich-query-a)

vmap gs <Plug>(operator-sandwich-add)

let g:tex_flavor="latex"

let g:slime_paste_file = tempname()
let g:slime_target="tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.1"}
let g:slime_dont_ask_default = 1

nmap <c-c><c-p> <Plug>(SlimeParagraphSend)
nmap <c-c><c-c> <Plug>SlimeLineSend
xmap <c-c><c-c> <Plug>SlimeRegionSend

set mouse=

"====================autocomands and language specific stuff=============================
au BufRead,BufNewFile *.tex :call SetLatexSettings()
au BufRead,BufNewFile *.md execute 'set makeprg=pandoc\ \-o\ \%:r.pdf\ \%'

" vim doesn't recognize julia files yet
au BufRead *.jl set ft=julia

" remove line numbers for these buffers
augroup NoLineBuffers
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd FileType qf setlocal nonumber norelativenumber
augroup END

"Configure fzf appearance
augroup fzf
  autocmd!
  autocmd FileType fzf setlocal noshowmode noruler norelativenumber nonumber
  autocmd FileType fzf tnoremap <esc> <esc>
augroup END

"Latex stuff
function! SetLatexSettings()
    nnoremap <buffer> <leader>init<cr> :0r /home/tony/.config/nvim/init.tex<cr>
    execute 'setlocal tabstop=2 shiftwidth=2 softtabstop=2'
    execute 'setlocal norelativenumber'
    execute 'setlocal errorformat=%f:%l:\ %m'
    execute 'setlocal makeprg=rubber\ -d\ %'
    inoremap <buffer> <leader>bb <esc>yiWi\begin{<esc>Ea}<cr>\end{"}<esc>o<++><esc>kO
    inoremap <buffer> _{ _{}<++><esc>4<left>i
    inoremap <buffer> ^{ ^{}<++><esc>4<left>i
    nnoremap <buffer><silent> <leader>m :call AsyncMake()<cr>
endfunc

"====================syntax and highlights====================
syntax enable 
set background=dark
colorscheme wal

"====================variable declarations====================
filetype plugin indent on "load filetype-specific indent files and turns on filetype detection
set tabstop=2 "number of spaces per tab
set softtabstop=2 "number of spaces per tab when editing
set shiftwidth=2 "set shift width to four spaces
set autoindent "pressing enter keeps tab spacing instead of moving cursor to beginning of line
set expandtab

set signcolumn=auto:9

" set jumpoptions+=view

" set showtabline=2

set splitbelow splitright " Change how splits open

set lazyredraw " Run faster

set hidden " switch between buffers without saving

set formatoptions-=ro " disable comments on newlines

set foldcolumn=1
set foldmethod=manual

function! ModeColor()
  let l:prefix="%#"
  let l:mode = mode()
  if l:mode == 'n'
    let l:prefix .= 'Character#'
  elseif l:mode == 'i'
    let l:prefix .= 'Function#'
  elseif l:mode == 'v'
    let l:prefix .= 'Boolean#'
  elseif l:mode == 'V'
    let l:prefix .= 'Boolean#'
  elseif l:mode == ''
    let l:prefix .= 'Boolean#'
  elseif l:mode == 't'
    let l:prefix .= 'Constant#'
  elseif l:mode == 'r'
    let l:prefix .= 'Identifier#'
  elseif l:mode == 'c'
    let l:prefix .= 'Conditional#'
  else
    let l:prefix .= 'Comment#'
  endif

  return l:prefix . '●' . '%#Default#'
endfunction

set statusline=%{%ModeColor()%}\ 
set statusline+=%t\ " filename
set statusline+=%m\ " modified
set statusline+=%r\ " readonly flag
set statusline+=[b%n]\ %<" buffer number
set statusline+=%=%y\ "filetype
set statusline+=%l/%L\ "line fraction
set statusline+=[col\ %v]\ "column number
" set statusline+=%p%% "percent

" global statusline
set laststatus=3

set hlsearch
set incsearch
set ignorecase

set wildmenu
set wildmode=longest:full,full
set wildignore=*.pyc,*.swp,*.class,*.aux,*.bbl,*.blg,*.fls,*.fdb_latexmk,.git,.git/*

" set scrolloff=3 "Start scrolling 3 lines from border

" don't save lowercase marks
" set shada=!,'0,<50,s10,h,'0

" incremental search and replace - nvim only
set inccommand=nosplit

set completeopt=menu,preview,menuone,noselect

"Make Y yank to EOL
nnoremap Y y$
" set showmatch "highlight matching parentheses

set number "this turns on line numbering
set relativenumber "turns on relative line numbering
set showcmd "show last command entered

set noshowmode

set shortmess+=c " don't print ugly completion messages

"remap left and right keys so they wrap around lines
set whichwrap+=<,>

"make it so you can go one char past the end of line in normal mode
set virtualedit=onemore

"make it so backspace can skip across lines
set backspace=indent,eol,start

set wildcharm=<c-z>

" Use ripgrep as the grepprg
set grepprg=rg\ --vimgrep\ -S\ $*\ >\ /dev/null

" cursor
set guicursor=n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20

"====================key mappings====================
"remap the vertical movements to work by visual lines
nnoremap <expr> j (v:count == 0 ? 'gj' : "m'" . v:count . 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : "m'" . v:count . 'k')

nnoremap <silent> ]] :bn<cr>
nnoremap <silent> [[ :bp<cr>

vnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
vnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

" onoremap i_ :<c-u>norm! T_vt_<cr>

" better completion options
" enter to select
inoremap <expr> <cr> pumvisible() ? '<c-y>' : '<cr>'

" define this wildcard operator
" inoremap `` <++>
inoremap <leader><leader> <esc>/<++><cr>"_ca<<c-o>:nohl<cr>

" basic emacs keys that I've gotten used to having
inoremap <c-f> <right>
inoremap <c-b> <left>

" look at buffers
nnoremap <leader>x :b <C-z><s-tab>

" save
nnoremap <silent> <space> :w<cr>

" paste with indentation on following line
nnoremap ]P o<c-o>]p<esc>k"_dd

"I make this typo too much - remap it to what I mean when I type this
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Q! q!
cnoreabbrev W w
cnoreabbrev E e
cnoreabbrev B b

" control l redraws the screen and removes search highlighting
nnoremap <silent><c-l> :nohl<cr><c-l>

" make # and * search for highlighted word under cursor
vnoremap # y?<c-r>"<cr>
vnoremap * y/<c-r>"<cr>

" switch between buffers
nnoremap <silent> <BS> :b#<cr>

" FZF mappings
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :BLines<cr>
" nnoremap <leader>t :Tags<cr>
nnoremap <leader><leader>m :Marks<cr>
nnoremap <leader>h :History<cr>

nnoremap <leader><leader>i :e ~/.config/nvim/init.vim<cr>

"switch between buffers and quickfix
nnoremap [b :bnext<cr>
nnoremap ]b :bprev<cr>

nnoremap ]c :cnext<cr>
nnoremap [c :cprev<cr>

nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>

nnoremap ]t :tabnext<cr>
nnoremap [t :tabprev<cr>

" quick insert of space
nnoremap <leader><space> i<space><esc>

"exit terminal mode with esc
tnoremap <esc> <c-\><c-n>

"open quickix window
nnoremap <leader>c :copen<cr>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

"open pdf viewer for latex and md
nnoremap <leader>z :! setsid zathura %:r.pdf<cr>

"move around on command line faster
cnoremap <c-a> <home>
cnoremap <c-f> <right>
cnoremap <c-b> <left>
cnoremap <a-f> <s-right>
cnoremap <a-b> <s-left>

" <c-f> allows editing of commands in a separate buffer
cnoremap <c-l> <c-f>

"c-r in insert mode fucks up indentation
inoremap <c-r> <c-r><c-p>

" search with word boundaries
cnoremap <c-k> <home>\<<end>\>

nnoremap <leader>gw :silent lgrep! <c-r><c-w><cr>:lopen<cr>
nnoremap <leader>gr :silent lgrep! 
" ----------------functions----------------------

let g:match_id = 0

" these functions turn off the highlighting
noremap <expr> <Plug>(StopHL) execute('nohlsearch')[-1]
noremap! <expr> <Plug>(StopHL) execute('nohlsearch')[-1]

func! HlSearch()
  if g:match_id
    call matchdelete(g:match_id)
    let g:match_id = 0
  endif

  let l:line = line(".")
  let l:col = col(".")
  let l:result = matchstrpos(getline("."), @/, l:col - 1)
  " If even after the cursor move, the index of the match is the same as our current column,
  " that means that we have simply jumped to the next match. in that case,
  " keep the highlighting; if we have moved away from the search pattern,
  " then clear the highlighting.
  if l:result[1]+1 != l:col
    call StopHL()
  elseif v:hlsearch
    let g:match_id = matchaddpos("IncSearch", [[l:line, l:col, l:result[2]-l:col+1]], 100)
  endif
endfunc

func! StopHL()
    if !v:hlsearch || mode() isnot 'n'
        return
    else
      " calls the functions to clear highlighting
      sil call feedkeys("\<Plug>(StopHL)", 'm')
      if g:match_id
        call matchdelete(g:match_id)
        let g:match_id = 0
      endif
    endif
endfunc

augroup SearchHighlight
au!
    au CursorMoved * call HlSearch()
    au InsertEnter * call StopHL()
augroup end

function! OnEvent(jobid, data, event)
    " handle any stderr from shell command
    if a:event == "stderr"
        call setqflist([], "a", {"lines": a:data})
    endif
endfunction

let g:callbacks = {
\ "on_stdout": function("OnEvent"),
\ "on_stderr": function("OnEvent"),
\ "on_exit": function("OnEvent")
\ }

function! AsyncMake()
    w
    call setqflist([], "r")
    " call jobstart(["rubber", "-d", expand("%")], g:callbacks)
    call jobstart(map(split(&makeprg), {_, v -> expand(v)}), g:callbacks)
endfunction

