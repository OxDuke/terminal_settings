# For setting up bash terminals.
# Weidong Sun <me@weidongsun.com>

set -e

# Bash settings
# TODO(Weidong): We need zsh support.

# Install Dracula theme for Terminal
# https://draculatheme.com/gnome-terminal
sudo apt-get -y install dconf-cli
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
rm -rf gnome-terminal


# tmux settings
# Install tpm
cd
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp tmux.bill.conf ~/.tmux.conf
tmux source ~/.tmux.conf

# vim settings
BASHRC_FILE="~/.bashrc"
# Add vi alias to bashrc if not added.
grep -qxF 'alias vi="vim"' ${BASHRC_FILE} || echo 'alias vi="vim"' >> ${BASHRC_FILE}

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
cp bill_configs.vim ~/.vim_runtime/my_configs.vim
