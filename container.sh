#!/bin/bash
set -e

# Delete existing container
# docker stop basedev && docker rm basedev

# Run this first
# docker run -it -d --platform linux/arm64/v8 -p 2222:22 --name basedev debian:latest
# --platform can be left out

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
npm install -g quick-lint-js

ln -s ~/prog/dotfiles/.gitconfig ~/.gitconfig
sed -i 's/helper=osxkeychain//' ~/.gitconfig

ln -s ~/prog/dotfiles/biome.json ~/biome.json
ln -s ~/prog/dotfiles/rgignore ~/.rgignore

mkdir -p ~/.config/kitty
ln -s ~/prog/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# lazygit
git clone https://github.com/jesseduffield/lazygit.git
cd lazygit
go install
cd || exit

# zsh-autosuggestions
zsh
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions)/' ~/.zshrc

# asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
{
	echo ". $HOME/.asdf/asdf.sh"
	echo ". $HOME/.asdf/completions/asdf.bash"
} >>~/.zshrc
ln -s ~/prog/dotfiles/tool-versions ~/.tool-versions
asdf plugin add nodejs
asdf plugin add terraform
asdf plugin add java
asdf plugin add python
asdf install

echo "source ~/prog/dotfiles/.zsh_config" >>~/.zshrc
