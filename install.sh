sudo cp .vimrc ~/
sudo cp -r .vim ~/
sudo sp .tmux.conf ~/

sudo apt-get install vim-gtk
sudo apt-get install cmake
sudo apt install build-essential cmake python3-dev

sudo vim -c 'PluginInstall' -c 'qa!'

cd ~/.vim/bundle/YouCompleteMe
sudo ython3 install.py --clangd-completer

