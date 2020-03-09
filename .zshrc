# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit


# emacsキーバインド
bindkey -e

# 他のターミナルとヒストリーを共有
setopt share_history

#
setopt correct


# cdコマンドを省略して、ディレクトリ名のみの入力で移動
setopt auto_cd


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000


# backspace,deleteキーを使えるように
stty erase ^H
bindkey "^[[3~" delete-char

# どこからでも参照できるディレクトリパス
cdpath=(~)

# Ctrl+rでヒストリーのインクリメンタルサーチ、Ctrl+sで逆順
bindkey '^r' history-incremental-pattern-search-backward
bindkey '^s' history-incremental-pattern-search-forward


# コマンドを途中まで入力後、historyから絞り込み
# 例 ls まで打ってCtrl+pでlsコマンドをさかのぼる、Ctrl+bで逆順
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^b" history-beginning-search-forward-end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/seiki/.sdkman"
[[ -s "/home/seiki/.sdkman/bin/sdkman-init.sh" ]] && source "/home/seiki/.sdkman/bin/sdkman-init.sh"

PROMPT="%(?.%{${fg[green]}%}.%{${fg[red]}%})%n${reset_color}@${fg[blue]}%m${reset_color}(%*%) %~
%# "

export EDITOR=vi

# ファイルをzshプロセス間で共有
setopt share_history


