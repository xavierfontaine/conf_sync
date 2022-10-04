""""""""
" VUNDLE
""""""""
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
" Themes
Plug 'mhartington/oceanic-next'  " https://github.com/mhartington/oceanic-next 
"Plug 'rakr/vim-one'  " https://github.com/rakr/vim-one
"Plug 'drewtempelmeyer/palenight.vim'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"# Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
" Python
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
" Display
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'jpalardy/vim-slime'

" All of your Plugs must be added before the following line
call plug#end()            " required
"filetype Plug indent on    " required



""""""""""""""
" THEME & FONT
""""""""""""""
" Suppport for multiple colors (try one of the two)
"set t_Co=256
"set termguicolors

" Theme
"" Mustang
"colorscheme mustang
"" Solarized
"colorscheme solarized
"" vim-one
"colorscheme one
"set background=dark " for the dark version
"set background=light " for the light version
"" oceanic-next
colorscheme OceanicNext
"" palenight
"colorscheme tokyonight



"""""""""
" LUALINE
"""""""""
lua << END
require('lualine').setup{
  options = {
    icons_enabled = true,
    theme = 'OceanicNext',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END


"""""""""
" LUATREE
"""""""""
lua << END
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
END


""""""
" BASE
""""""
set autoread        " Read again if file changed

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set mouse=a         " Enable the use of the mouse.
 
syntax on

" ======
" SEARCH
" ======
" See here for an intro: https://stackoverflow.com/a/23978432
set path+=**  " When using 'find', do so recursively
set wildmenu  " Allows 'wild' matching by name, using wildcards and <ATab>
set wildignore=*.pyc  " Exclude *.pyc from search

" ==========
" DISPLAYING
" ==========
vnoremap <C-c> "+y
nnoremap <C-c> "*y
vnoremap <C-p> "+p
nnoremap <C-p> "*p
" " ↑ former version, but bugs when coyp from vim in one window to vim another
" " * and + are two different system clipboards. Application might rely on either,
" " so copy to both.
" vnoremap <C-c> "*y"+y
" nnoremap <C-c> "*y"+y
" vnoremap <C-p> "*p
" nnoremap <C-p> "*p


" RECHERCHE
" Pour chercher un text selectionne visuellement dans tous le doc avec *
vnoremap // y/<C-R>"<CR>


"""PATHOGEN
""execute pathogen#infect()
"
"""VIM-TEX
""" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
""filetype Plug on
""
""" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
""" can be called correctly.
""set shellslash
""
""" IMPORTANT: grep will sometimes skip displaying the file name if you
""" search in a singe file. This will confuse Latex-Suite. Set your grep
""" program to always generate a file-name.
""set grepprg=grep\ -nH\ $*
""
""" OPTIONAL: This enables automatic indentation as you type.
""filetype indent on
""
""" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
""" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
""" The following changes the default filetype back to 'tex':
""let g:tex_flavor='latex'
""
""" this is mostly a matter of taste. but LaTeX looks good with just a bit
""" of indentation.
""set sw=2
""" TIP: if you write your \label's as \label{fig:something}, then if you
""" type in \ref{fig: and press <C-n> you will automatically cycle through
""" all the figure labels. Very useful!
""set iskeyword+=:
""
""" Output en pdf
""let g:Tex_DefaultTargetFormat = 'pdf'
""let g:Tex_MultipleCompileFormats='pdf, aux'


""""""""""
" NERDTREE
""""""""""
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

 
""""""
" JEDI
""""""
let mapleader = ","
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = "0"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 1
" Parameters used for years
"let mapleader = ","
"let g:jedi#popup_select_first = 1
"let g:jedi#show_call_signatures = "2"
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#popup_on_dot = 0  " Otherwise too slow with lib like transformer


"""""""""""""
" PYDOCSTRING 
"""""""""""""
"" May requires expliciting doq location (if needed to be install by hand)
"" see https://github.com/heavenshell/vim-pydocstring/issues/98 on that.
let g:pydocstring_doq_path = '~/.pyenv/shims/doq'
" Set style to numpy
let g:pydocstring_formatter = 'google'


""""""""""""
" vim-flake8
""""""""""""
let g:flake8_ignore="E501,W503,E203"
let g:flake8_max_line_length=79


""""""""
" PYTHON
""""""""
" Python + neovim
" Requires to pip install pynvim, and to link the shim here
" See https://neovim.io/doc/user/provider.html for more info
let g:python3_host_prog = '~/.pyenv/versions/3.9.9/bin/python'

" Spot bad whitespaces
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"""""""""
" FOLDING
"""""""""
" Most folding is dealt with using SimplyFold.
set foldlevel=1  " Fold de niveau 1 par défaut
"set foldclose=all  " Au sortir d'un fold, close le fold
" La ligne ci-dessous permet de folder/defolder avec espace
nnoremap <space> za


""""""
" TABS
""""""
" Tab navigation like Firefox (inspiration from from https://vim.fandom.com/wiki/Alternative_tab_navigation)
nnoremap th :tabprevious<CR>
nnoremap tl   :tabnext<CR>
nnoremap tk     :tabnew<CR>
nnoremap tj  :tabclose<CR>


""""""""
" SPLITS
""""""""
"nnoremap <C-w>n <esc>:vnew<cr><bar><C-w>L
 
 
"""""""
" SLIME
"""""""
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.0"}
let g:slime_python_ipython = 1  " for proper handling of indentation


""""""""""
" TERMINAL
""""""""""
" Escape insert mode with esc
tnoremap <Esc> <C-\><C-n>
