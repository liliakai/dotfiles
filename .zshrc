source ~/.bashrc
autoload -U colors && colors
setopt interactivecomments

zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
fpath=(~/.zsh $fpath)

source ~/.git-prompt.sh

Color_Off="%{$reset_color%}"
PathShort="%~ "
bmo_start="%{$fg[cyan]%}╭|❲$Color_Off"
bmo_end="%{$fg[cyan]%}❳|╯$Color_Off"
precmd () { __git_ps1 "$PathShort$bmo_start$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ $? -eq 0 ]; then \
    # @4 - Clean repository - nothing to commit
    echo "%{$fg[green]%}"; \
  else
    # @5 - Changes to working tree
    echo "%{$fg[red]%}"; \
  fi) "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "%{$fg[cyan]%}˙ ‿ ˙$Color_Off"
fi)" "$Color_Off$bmo_end " "%s " }
