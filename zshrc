#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#__GLVND_DISALLOW_PATCHING=1 # temp nvidia patch
# Customize to your needs...
source ~/.zsh_aliases
autoload -U compinit promptinit
compinit
LS_COLORS='di=1:fi=0:ln=93:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35'
export LS_COLORS
eval "$(dircolors ~/.dircolors)"
source "$HOME/output/colors.envar"
autoload -U colors && colors


