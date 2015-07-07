#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#(sleep 3; xmodmap ~/.Xmodmap) &
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export SVN_EDITOR="vi"
PATH=$PATH:/home/tokunaga/.gem/ruby/2.2.0/gems
PATH=$PATH:/usr/local/bin/scala/bin
PATH=$PATH:/home/tokunaga/.gem/ruby/2.2.0/gems/gems/pry-0.10.1/bin
export GEM_HOME=/home/tokunaga/.gem/ruby/2.2.0/gems
export PATH=$PATH:/home/tokunaga/.gem/ruby/2.2.0/bin
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

#Git のブランチ表示部分
# reference:http://qiita.com/tanishi/items/2adb71024d675bc43177
PS1="\[\033[1;32m\]\$(date +%Y/%m/%d_%H:%M:%S)\[\033[0m\] \[\033[33m\]\H:\w\n\[\033[0m\][\u@ \W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

#
# git-completion.bash / git-prompt.sh
#
if [ -f /usr/local/share/git-completion.bash ]; then
      source /usr/local/share/git-completion.bash
fi
if [ -f /usr/local/share/git-prompt.sh ]; then
      source /usr/local/share/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
