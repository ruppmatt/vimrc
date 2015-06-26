" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number              " show line numbers
set mouse=a             " enable mouse support

highlight LineNr term=reverse


" for win32 gui: remove 't' flag fr"om 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" this is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" switch syntax highlighting on, when the terminal has colors
" also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" only do this part when compiled with support for autocommands.
if has("autocmd")

  " enable file type detection.
  " use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in c files, etc.
  " also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " put these in an autocmd group, so that we can delete them easily.
  augroup vimrcex
  au!

  " for all text files set 'textwidth' to 78 characters.
  autocmd filetype text setlocal textwidth=78

  " when editing a file, always jump to the last known cursor position.
  " don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd bufreadpost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup end

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set et
set sw=3 
set smarttab

" Attempt to comment out area
au FileType haskell,vhdl,ada let b:comment_leader = '-- '
au FileType vim let b:comment_leader = '" '
au FileType c,cpp,java let b:comment_leader = '// '
au FileType sh,make,py let b:comment_leader = '# '
au FileType tex let b:comment_leader = '% '
au FileType python set omnifunc=pythoncomplete#Complete
au FileType rst set linebreak | set wrap   


" MiniBufExplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


"VUNDLE configuration from git homepage
set nocompatible        
filetype off

"Let Vundle manage Vundle
"required
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"let vundle manage vundle
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'Rykka/riv.vim' 
Plugin 'Rykka/clickable.vim'
Plugin 'bling/vim-airline'

"Plugin for vim/tmux navigation
"Plugin 'christoomey/vim-tmux-navigator'

filetype plugin indent on " required


"
 " brief help
 " :bundlelist          - list configured bundles
 " :bundleinstall(!)    - install(update) bundles
 " :bundlesearch(!) foo - search(or refresh cache first) for foo
 " :bundleclean(!)      - confirm(or auto-approve) removal of unused
 "                        bundles
 "
 " see :h vundle for more details or wiki for faq
 " note: comments after bundle command are not allowed..

"LatexBox settings
let g:LatexBox_viewer = "open"


"EasyMotion
"Have to change default leader because of conflicts with command-t
let g:EasyMotion_leader_key =  "'"

" TagList options
"let Tlist_Close_On_Select = 1 "close taglist window once we selected0
                              " something
let Tlist_Exit_OnlyWindow = 1 "if taglist window is the only window left,
                                "exit vim
let Tlist_Show_Menu = 1 "show Tags menu in gvim
let Tlist_Show_One_File = 1 "show tags of only one file
let Tlist_GainFocus_On_ToggleOpen = 1 "automatically switch to taglist
                                        " window
let Tlist_Highlight_Tag_On_BufEnter = 1 "highlight current tag in taglist
                                        " window
let Tlist_Process_File_Always = 1 "even without taglist window, create tags
                                  " file, required for displaying tag in statusline
"let Tlist_Use_Right_Window = 1 "display taglist window on the right
let Tlist_Display_Prototype = 1 "display full prototype instead of just

let Tlist_Auto_Update = 1
" function name

" Restructured Text
" #########################
" Ctrl-u 1:    underline Parts w/ #'s
noremap  <C-u>1 yyPVr=yyjp
inoremap <C-u>1 <esc>yyPVr=yyjpA
" Ctrl-u 2:    underline Chapters w/ *'s
noremap  <C-u>2 yyPVr-yyjp
inoremap <C-u>2 <esc>yyPVr-yyjpA
" Ctrl-u 3:    underline Section Level 1 w/ ='s
noremap  <C-u>3 yypVr=
inoremap <C-u>3 <esc>yypVr=A
" Ctrl-u 4:    underline Section Level 2 w/ -'s
noremap  <C-u>4 yypVr-
inoremap <C-u>4 <esc>yypVr-A
" Ctrl-u 5:    underline Section Level 3 w/ ^'s
noremap  <C-u>5 yypVr^
inoremap <C-u>5 <esc>yypVr^A

" Pathogen
execute pathogen#infect()


" Allow for working directory vimrc files
set exrc
set secure

" Airline configuration
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'light'

