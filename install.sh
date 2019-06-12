sudo cp .vimrc ~/
sudo cp -r .vim ~/
sudo sp .tmux.conf ~/

sudo apt-get install vim-gtk
sudo apt-get install cmake
sudo apt install build-essential cmake python3-dev

sudo vim -c 'PluginInstall' -c 'qa!'

cd ~/.vim/bundle/YouCompleteMe
sudo python3 install.py --clangd-completer


# adds the grep stuff to .bash_profile -  the spaces are required.
cat <<"EOF" >> ~/.bash_profile


# Adds fzf grep functionality
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
bind -x '"\C-p": vim $(fzf);'
EOF
