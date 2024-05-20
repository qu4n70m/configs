
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


source ~/profile.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# <android-device-utilities>
export NDK='~/android-ndk-r23b-linux/'
export JADX='/home/ubuntu/jadx/build/jadx/bin/jadx'
export FRIDA_JS='~//home/ubuntu/git/android-device-utilities/frida-js/'
# alias jadx='/home/ubuntu/git/jadx/build/jadx/bin/jadx'
# alias ndk='python3 /home/ubuntu/git/android-device-utilities/ndk.py'
# alias frida-js='python3 /home/ubuntu/git/android-device-utilities/frida_js.py'
# alias device='python3 /home/ubuntu/git/android-device-utilities/device.py'
# alias apk='python3 /home/ubuntu/git/android-device-utilities/apk.py'
# alias manifest='python3 /home/ubuntu/git/android-device-utilities/manifest_viewer.py'
# </android-device-utilities>

alias deployer='/home/ubuntu/git/android-apk-deployer/apkget_chrome.py'
# alias git='git --no-pager'
alias gs='git status -uno'


# export PS1="\w:> "
# if [[ "$TERM" == "dumb" ]] ; then
#     PS1="\e]7;file://\u@\H\$PWD\e\\ [\${ANDROID_SERIAL}] ${PS1}"
#     # PS1="\$(echo -ne '\033]7;adb://'`getprop ro.serialno`$PWD'\033\\') $PS1"
#     # alias adb="~/.local/bin/adb_osc7"
# fi

export PATH=/home/ubuntu/scripts:$PATH
. "$HOME/.cargo/env"


export ALTERNATE_EDITOR=""
# export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
# export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode
# # export VISUAL="code -r"         # $VISUAL opens in GUI mode
export REQUESTS_CA_BUNDLE="/etc/ssl/certs/ca-certificates.crt"

# export SHELL='/usr/bin/zsh'
# export ZSH_THEME=robbyrussell

if [[ -n $PS1 && -f ~/.bash_prompt ]]; then
  . ~/.bash_prompt
  ps1_dark_theme  # Choose your theme here
fi


# --------------------------------------------------------------------------------

export PATH=/usr/local/bin/:$PATH
export TERM=xterm
set -o vi
export EDITOR="nvim"         # $EDITOR opens in terminal
export VISUAL="nvim"         # $VISUAL opens in GUI mode
export TERM=xterm-256color

# --------------------------------------------------------------------------------
#
#
#

export PATH=/home/ubuntu/.local/bin:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Ctrl-p bindings for fzf
# this is the in-memory max num of commands limit
export HISTSIZE=1000000
# this is the history file max num of commands limit
export HISTFILESIZE=1000000
# remove duplicates from history + ignore all commands that starts with space.
# this is usefull in the case we wish to execute commands with sensetive
# information like passwords
export HISTCONTROL=ignoreboth


# # Save history from every terminal opened in the machine!!
# # commands inside PROMPT_COMMAND executes every time the prompt is displayed.
# # basiclly every command we run.
# # 'history -a' is appending any unwritten history to the history file (HISTFILE)
# # 'history -r' is reloading the history from the file (HISTFILE) to in-memory
# # I do not use this because it corrupt the history per terminal
# export PROMPT_COMMAND='history -a; history -r'
# IMPORTANT: Install fzf from github

# mashed history of all terminals in a single-separated file
# '~/.persistent_history'
# format the history time in the HISTFILE file
#  15  2023-11-03 09:08:29  <command> 1
#  16  2023-11-03 09:08:36  <command> 2
#  17  2023-11-03 09:08:44  <command>
export HISTTIMEFORMAT="%F %T  "

log_bash_persistent_history()
{
  [[
    $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
  ]]
  local date_part="${BASH_REMATCH[1]}"
  local command_part="${BASH_REMATCH[2]}"
  if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
  then
    echo "$command_part" >> ~/.persistent_history
    export PERSISTENT_HISTORY_LAST="$command_part"
  fi
}
# Stuff to do on PROMPT_COMMAND
run_on_prompt_command()
{
    log_bash_persistent_history
}
export PROMPT_COMMAND="run_on_prompt_command"

ph()
{
    READLINE_LINE=$(tac ~/.persistent_history ~/.common_commands | fzf)
    READLINE_POINT=${#READLINE_LINE}
}
bind -x '"\C-p":ph'
  



