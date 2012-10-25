# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source ~/.bashrc

# User specific environment and startup programs

alias ebp="em ~/.bash_profile && sbp"
alias sbp="source ~/.bash_profile"
alias e="vim"

alias flog="git log --full-diff --decorate -p ."
alias flp="git log --full-diff --decorate -p"
alias log="git log --decorate"
alias co="git co"
alias remaster="git co master && git fetch && git reset --hard origin/master"
alias rem=remaster
alias reup="git fetch && git rebase origin/upgrade"
alias master="git co master"
alias tmp="commit! -m tmp"
alias tmpall="git add . && tmp"
alias commit="git commit -v"
alias amend="commit --amend"
alias add="git add -p"
alias a="git add -p"
alias aa="git add --all"
alias aaa="git add --all  && amend!"
alias pull="git pull"
alias up="git pull"
alias gico="git checkout"
alias gici="git commit"
alias girb="git rebase"
alias ri="git fetch && git rebase -i origin/master"
alias rb="git fetch && git rebase origin/master"
alias f="git fetch"
alias h="git show"
alias hs="git show --stat"
alias d="git diff"
alias ds="git diff --stat"
alias dm="git diff origin/master"
alias c="git diff --cached"
alias cs="git diff --cached --stat"
alias s="git status"
alias lg="git lg"
alias br="git branch"
alias stash="git stash"
alias ss="git stash"
alias sh="git stash show --full-diff"
alias sd="sh && git stash drop"
alias p="git stash pop"
alias pp="git stash pop"
alias su="git submodule update"
alias routes="bundle exec rake routes"

alias rd="rvm use && rvm use default"

export EDITOR="vim"

# start ssh-agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
