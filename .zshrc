# Set up the prompt

autoload -Uz promptinit
autoload -U colors
colors
promptinit

# Make a multi-line prompt.  This takes up more
# vertical space, but uses less horizontal space
# (which is more valuable on the command line).
# Prompt colors the username red for root and green
# for any other user.
# The third line prints exit status (if non-zero)
# directly before the % or # prompt.
RPROMPT="%w %T"
PS1="
%(!.%{${fg[red]}%}.%{${fg[green]}%})%B%n%b%{${fg[default]}%}@%U%m%u %l %{${bg[black]}${fg[yellow]}%}%d%{${fg[default]}${bg[default]}%} 
%(?..(Exit %? %))%# " 
SPROMPT='zsh: correct '%R' to '%r' ? ([Y]es/[N]o/[E]dit/[A]bort) '

export EDITOR=vi
export PAGER=most
export PATH=$PATH:~/apps/bin

alias ls="ls --color"
alias aterm="aterm -bg black -fg grey +tr -vb +sr -sl 1000"
alias top="htop"

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
