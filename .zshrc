# zsh settings
export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# shell style
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=32;47:cd=33;47:su=31;47:sg=31;47:tw=36;44:ow=0;44'
export CLICOLOR=1
export LSCOLORS='exfxcxdxbxchdhbhbhgexe'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':vcs_info:git*' formats "%{$fg[cyan]%}#%b%{$reset_color%}"
PROMPT='%F{51}%~%F{240}$vcs_info_msg_0_ %F{197}> %f'

ZSH_WORK=~/.zshrc_work
if [[ -f "${ZSH_WORK}" ]]; then
  source "${ZSH_WORK}"
fi

