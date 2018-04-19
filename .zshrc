# zsh settings
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# custom scripts
export PATH=$PATH:~/.bin

# shell style
export LS_COLORS='di=36;40:ln=35;40:so=32:pi=33:ex=31;40:bd=32;47:cd=33;47:su=31;47:sg=31;47:tw=36;44:ow=0;44'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}#%b%{$reset_color%}"
PROMPT='%F{cyan}%~%F{240}$vcs_info_msg_0_ %F{197}> %f'
