"######################################################
"#
"# Vim Startup File
"#

set backspace=start,indent,eol
set viminfo=\"20,%,'5,/10,:20,h,n~/.viminfo
set history=50
set laststatus=2
set showmode
set showcmd
set showmatch
set vb t_vb=
set noerrorbells
set virtualedit=block
set title
set shell=sh
set complete=.,w,b,t
set formatoptions=cqn1
set switchbuf=

"####################################################################
"# Set Colorscheme
"# For future reference, colorschemes can be found in,
"# /usr/share/vim/vim72/colors/
"####################################################################
colorscheme ron

"####################################################################
"#
"# The Status Line
"#
"####################################################################
set statusline=%f%=%1*[%Y%R%M]%*

"####################################################################
"#
"# Abbreviations
"#
"####################################################################
abbreviate ctor constructor
abbreviate Ctor Constructor
abbreviate dtor destructor
abbreviate Dtor Destructor
abbreviate #i #include
abbreviate #d #define

"####################################################################
"#
"# FileType Support
"#
"####################################################################
filetype on
filetype plugin on
filetype indent on

"####################################################################
"#
"# Programming Stuff
"#
"####################################################################
set path+=include
set path+=lib
set tags=./.tags,.tags,./.ruby_tags,.ruby_tags
set tagstack
set tabstop=8
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set textwidth=78
set nowrap    
set autoindent
set number
set foldcolumn=1
set foldmethod=indent
set foldlevel=1
set nofoldenable

command Q  :qa
command W  :w
command Wq :wq

"####################################################################
"# Ruby
autocmd BufRead,BufNewFile Rakefile set filetype=ruby
autocmd BufRead,BufNewFile rakefile set filetype=ruby
autocmd BufRead,BufNewFile *.rake   set filetype=ruby
autocmd BufRead,BufNewFile .irbrc   set filetype=ruby
autocmd BufRead,BufNewFile *.rjs    set filetype=ruby
autocmd BufRead,BufNewFile *.rhtml  call ERubySettings()
autocmd FileType ruby,eruby         call RubySettings()

au BufRead,BufNewFile *.feature set filetype=cucumber
au! Syntax cucumber source ~/vim-cucumber/syntax/cucumber.vim

"####################################################################
"# JavaScript can be just like Ruby
autocmd FileType javascript         call UseRubyIndent()

"####################################################################
"# Clojure
" let clj_paren_rainbow = 1
au BufRead,BufNewFile *.clj set filetype=clojure

"####################################################################
"# Crontabs
autocmd BufRead /tmp/crontab* call CrontabSettings()

"####################################################################
function RubySettings ()
    call UseRubyIndent()
    command! -buffer Irb call RunIRB()
endfunction

"####################################################################
function UseRubyIndent ()
    setlocal tabstop=8
    setlocal softtabstop=2
    setlocal shiftwidth=2
    setlocal expandtab
    setlocal makeprg=ruby\ %
endfunction

"####################################################################
" Does three things:
"
"   1) Clears the screen
"   2) Runs IRB on the current buffer
"   3) Redraws the Vim screen
function RunIRB ()
    :silent !clear;irb -r %
    :redraw!
endfunction

"####################################################################
function ERubySettings ()
    imap <buffer> <CR> <C-R>=PMADE_XmlEndToken()<CR>
endfunction

"####################################################################
" Key mappings
nnoremap <C-v> :set paste<Enter>
nnoremap <C-x> :set nopaste<Enter>

