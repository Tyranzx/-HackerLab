#  ____  _       _ _            ____                        _
# / ___|| |_ ___| | | __ _ _ __/ ___|  __ _ _   _  __ _  __| |
# \___ \| __/ _ \ | |/ _` | '__\___ \ / _` | | | |/ _` |/ _` |
#  ___) | ||  __/ | | (_| | |   ___) | (_| | |_| | (_| | (_| |
# |____/ \__\___|_|_|\__,_|_|  |____/ \__, |\__,_|\__,_|\__,_|
#

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"

export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH
export _JAVA_AWT_WM_NONREPARENTING=1

alias l="lsd"
alias ll="lsd -l"
alias lla="lsd -la"
alias sq="cd ~/Desktop/stellarsquad"
alias cat="/bin/bat"
alias catn="/bin/cat"
alias catnl="/bin/bat --paging=never"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2

bindkey $key[Up] up-line-or-history
bindkey $key[Down] down-line-or-history
bindkey "^[[1;5C" forward-word 
bindkey "^[[1;5D" backward-word

target() {
  if [[ -n "$1" ]]; then
    echo "$1" > ~/.config/bin/target.txt
  else
    echo "Uso correcto: target <str>"
  fi
}

untarget() {
  echo -e '%{F#717171} No target IP' > ~/.config/bin/target.txt
}


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
