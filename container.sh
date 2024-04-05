#!/bin/bash
set -e

# Delete existing container
# docker stop basedev && docker rm basedev

# Run this first
# docker run -it -d --platform linux/arm64/v8 -p 2222:22 --name basedev debian:latest

# Run rest inside the docker
# docker container exec -it debian /bin/bash
# After installation is complete, start with docker container exec -it debian /usr/bin/zsh
cd || exit
apt update
apt upgrade -y
apt install apt-utils -y
apt install git -y
apt install curl -y
apt install wget -y
apt install gcc -y
apt install nodejs -y
apt install npm -y
apt install zsh -y
apt install zsh-autosuggestions -y
apt install ripgrep -y
apt install unzip -y
apt install python3-full -y
apt install pip -y
apt install golang -y
apt install unzip -y
apt install fd-find -y
apt install thefuck -y
apt install ninja-build gettext cmake unzip curl build-essential -y
apt install cargo composer php -y
apt install sqlite3 -y
apt install fswatch -y

apt install openssh-server -y
mkdir /var/run/sshd
echo 'root:root' | chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
/usr/sbin/sshd
sed -i 's/\/bin\/bash/\/usr\/bin\/zsh/' /etc/passwd

apt install luarocks -y
luarocks install jsregexp

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone https://github.com/neovim/neovim
cd neovim || exit
rm -rf ./build/
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo
make install
echo "export PATH=\"\$HOME/neovim/bin:\$PATH\"" >>~/.zshrc

cd || exit
mkdir prog
cd prog/ || exit
git clone https://github.com/vvartiainen/dotfiles.git

cd || exit
rm -rf ~/.config
mkdir ~/.config
ln -s ~/prog/dotfiles/nvim ~/.config/nvim
npm install -g tree-sitter-cli
npm install -g neovim
npm install -g biome
npm install -g prettier

# TODO: Fix incompatible gitconfig
#ln -s ~/prog/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/prog/dotfiles/biome.json ~/biome.json
ln -s ~/prog/dotfiles/rgignore ~/.rgignore
mkdir -p ~/.config/kitty
ln -s ~/prog/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_arm64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin

echo "source ~/prog/dotfiles/.zsh_config" >>~/.zshrc
