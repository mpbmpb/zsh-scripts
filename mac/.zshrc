# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="/Users/mark/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true


# To have commands starting with `rm -rf` in red:
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[globbing]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=magenta'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold,underline"

# Set name of the theme to load 
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-z history-substring-search colorize auto-color-ls zsh-syntax-highlighting)

export ZSH=$HOME/.oh-my-zsh
export DEFAULT_USER=$(whoami)
path+=/usr/local/share
path+=/usr/local/share/zsh-completions
path+=~/dotmem/Console.macos
path+=~/.dotnet/tools
TERM=xterm-256color
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# zsh-z.plugin.zsh menu beautify option
zstyle ':completion:*' menu select

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export CLICOLOR=1
export LSCOLORS=gxExhxBxfxabafhxhxcaca
export LS_COLORS="di=36:ln=1;34:so=37:pi=1;31:ex=35:bd=30;41:cd=30;45:su=37:sg=37:tw=32;40:ow=32;40"

# nvm
# export NVM_DIR=~/.nvm
# source $(brew --prefix nvm)/nvm.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# go to top directory of git repository
gtop() {
  TEMP_PWD=`pwd`
  while [ ! -d ".git" ]; do
  cd ..
  done
  TARGET_PWD=`pwd`
  cd $TEMP_PWD
  cd $TARGET_PWD
}

# show tree n levels deep
tree() {
  depth=${1:=2}
  colorls -d --tree=$depth
}

clone() { git clone https://github.com/"$1" }

#zmv
autoload zmv

# use lf to switch directories
alias lfcd='source ~/zsh-scripts/lfcd.sh'
bindkey -s '^o' 'lfcd\n'

bindkey '/e[A' history-beginning-search-backward
bindkey '/e[B' history-beginning-search-forward
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word


#suffix alias
alias -s {cs,csproj,ts,html,css,cshtml,xml,json,js,svg,txt,doc,csv,md,zshrc}=code

#user aliases
source ~/.useraliases

neofetch