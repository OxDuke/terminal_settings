# For setting up bash terminals.
# Weidong Sun <me@weidongsun.com>

set -e

# Bash settings
# TODO(Weidong): We need zsh support.

sudo apt update
sudo apt install -y tmux vim ack silversearcher-ag
# Install xsel or xclip for tmux-yank
sudo apt-get install -y xsel xclip


####################################
# Install Dracula theme for Terminal
####################################

# Ref: https://draculatheme.com/gnome-terminal
sudo apt-get -y install dconf-cli
git clone https://github.com/dracula/gnome-terminal
cd gnome-terminal
./install.sh
cd ..
rm -rf gnome-terminal


###############
# tmux settings
###############
# Install tpm
git clone "https://github.com/tmux-plugins/tpm" "~/.tmux/plugins/tpm"
cp "tmux.bill.conf" "~/.tmux.conf"
# tmux source ~/.tmux.conf

##############
# vim settings
##############
BASHRC_FILE="~/.bashrc"
# Add vi alias to bashrc if not added.
grep -qxF 'alias vi="vim"' ${BASHRC_FILE} || echo 'alias vi="vim"' >> ${BASHRC_FILE}

git clone --depth=1 "https://github.com/amix/vimrc.git" "~/.vim_runtime"
sh "~/.vim_runtime/install_awesome_vimrc.sh"
cp "bill_configs.vim" "~/.vim_runtime/my_configs.vim"

# Install Vundle, vim's plugin manager
# Ref: https://github.com/VundleVim/Vundle.vim
git clone "https://github.com/VundleVim/Vundle.vim.git" "~/.vim_runtime/bundle/Vundle.vim"
vim +PluginInstall +qall

##################
# Install starship
##################
sudo apt install -y wget curl
wget -q https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
mkdir "~/.fonts"
mv FiraCode.zip "~/.fonts/"
cd "~/.fonts" && unzip FiraCode.zip && rm FiraCode.zip && fc-cache -fv && cd -

# TODO(me@weidongsun.com) Show note.
# NOTE: To use firacode nerd font in gnome terminal, you have to set Terminal->Preference->Your default profile, and
# change the default font to Firacode Nerd Font. Otherwise, you are going to see strange characters in your terminal.

curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init bash)"' >> "~/.bashrc"
mkdir -p "~/.config" && touch "~/.config/starship.toml"


