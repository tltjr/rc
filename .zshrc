######################################################################
#           tltjr's zshrc file
######################################################################

setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt APPEND_HISTORY
unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt MENUCOMPLETE
setopt ALL_EXPORT


# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent 
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
# zmodload -ap zsh/mapfile mapfile

# set WinRDBI library files path
export LD_LIBRARY_PATH=/home/tltjr/WinRDBI

# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

export EC2_HOME=/home/tltjr/ec2-tools
export JAVA_HOME=/usr
export SSH_KEY=/home/tltjr/.ec2/tltjrkey.pem
export EC2_PRIVATE_KEY=/home/tltjr/.ec2/pk-DY2JNXIZXTAVBLQ3WXMPHOTUJRJGSH4B.pem
export EC2_CERT=/home/tltjr/.ec2/cert-DY2JNXIZXTAVBLQ3WXMPHOTUJRJGSH4B.pem
export ADDER_PEM=/home/tltjr/src/clojure/adder/dev/adder.pem
export ADDER_HOST=184.72.249.184

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="tltjr"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(vi-mode)

source $ZSH/oh-my-zsh.sh

# PATH Settings
PATH="/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:$PATH"
# edit path
PATH=$PATH:/home/tltjr/jruby-1.3.0/bin
PATH=$PATH:$JAVA_HOME/bin
PATH=$PATH:/home/tltjr/Eclipse/eclipse
PATH=$PATH:$GRAILS_HOME/bin
PATH=$PATH:/home/tltjr/android-sdk-linux_86/tools/
PATH=$PATH:/home/tltjr/gwt-linux-1.7.1/
PATH=$PATH:/var/lib/gems/1.9.1/bin
# PATH=$PATH:~/.gem/ruby/1.8/bin
PATH=$PATH:/home/tltjr/.gem/ruby/1.9.1/bin
PATH=$PATH:/home/tltjr/Komodo-Edit-5/bin
PATH=$PATH:/home/tltjr/clojure/vimclojure-2.1.2/bin
PATH=$PATH:/home/tltjr/opt/cmucl-20b/bin
PATH=$PATH:/home/tltjr/ec2-tools/bin
export PATH

export CLOJURE_EXT=~/.clojure
export EDITOR=vim
export GIT_EDITOR=vim

#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

if [ $SSH_TTY ]; then
  MUTT_EDITOR=vim
else
  MUTT_EDITOR=emacsclient.emacs-snapshot
fi

unsetopt ALL_EXPORT
# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------

alias lazytest='java -cp "src:test:classes:lib/*" lazytest.watch src test'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '

alias got='git '
alias get='git '

alias slrn="slrn -n"
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias offlineimap-tty='offlineimap -u TTY.TTYUI'
alias hnb-partecs='hnb $HOME/partecs/partecs-hnb.xml'
alias rest2html-css='rst2html --embed-stylesheet --stylesheet-path=/usr/share/python-docutils/s5_html/themes/default/print.css'

###ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls --color=auto -C' #I like color
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
 
##cd, because typing the backslash is ALOT of work!!
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias	=clear

selfupdate(){
        URL="http://stuff.mit.edu/~jdong/misc/zshrc"
        echo "Updating zshrc from $URL..."
        echo "Press Ctrl+C within 5 seconds to abort..."
        sleep 5
        cp ~/.zshrc ~/.zshrc.old
        wget $URL -O ~/.zshrc
        echo "Done; existing .zshrc saved as .zshrc.old"
}
#chpwd

autoload -U compinit
compinit
bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
# zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps ax -o pid,s,nice,stime,args | sed "/ps/d"'
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -A -o pid,user,cmd'
zstyle ':completion:*:processes-names' command 'ps axho command' 
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

# rvm
if [[ -s /home/tltjr/.rvm/scripts/rvm ]] ; then source /home/tltjr/.rvm/scripts/rvm ; fi

# TZ="America/New_York"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
   colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
   eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
   eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
   (( count = $count + 1 ))
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"
