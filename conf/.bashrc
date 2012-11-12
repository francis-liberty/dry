# .bashrc

# commen user prompt color
PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\] '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# 256 color
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        export TERM='xterm-256color'
else
        export TERM='xterm-color'
fi


# User specific aliases and functions

# ======================== alias ===============================
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files

# mongodb
# alias mongod='mongod run --config /usr/local/etc/mongod.conf'

# Emacs
alias emacs='emacsclient -t -a ""'

# Eclim
alias eclimd=/home/francis/Documents/eclipse/eclimd

# Tsinghua WIFI
alias tunet=/home/francis/Downloads/TUNet_linux/TUNet64

# goagent
alias go='python2 ~/goagent/local/proxy.py'

# scale sbt
alias csbt='/home/francis/Dropbox/Coder/fp/sbt/bin/sbt'
