dotfiles
========

Configs and scripts for a nice command line experience.
Files starting with a dot should be simlinked (ln -s) to the home directory.

`.bashrc`  # bash configuration file, also referenced by .zshrc
`.bash_profile`  # bash profile file, not needed if using .zsh

`.zshrc`  # zsh configuration file

`.tmux.conf`# tmux (terminal multiplexer) configuration file

`.gitconfig` # git configuration file

`.mutt/` # Don't really use mutt anymore, but if I did I'd want the configs in this directory

Three files to add command line niceties when using git, all of which are referenced by .zshrc
`.zsh/_git
`.git-completion.bash`
`.git-prompt.sh`

Vim setup
`.vimrc` # vim configuration file
`lucy.vim` # custom vim color scheme, derived from the lucifer color scheme. install under ~/.vim/colors

```
mkdir ~/.vim/colors && ln -s lucy.vim ~/.vim/colors

mkdir ~/.vim/tmp
mkdir ~/.vim/tmp/backup
mkdir ~/.vim/tmp/swap
```

To use pathogen plugins run the following and put plugins in ~/.vim/bundle
```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```
