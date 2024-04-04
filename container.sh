# Run this first
docker run -it -d --platform linux/amd64 --name debian debian:latest

# Run rest inside the docker
# docker exec -it debian /bin/bash
# After installation is complete, start with docker exec -it debian /usr/bin/zsh
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

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
echo "export PATH=\$PATH:/opt/nvim-linux64/bin" >>~/.zshrc

cd || true
mkdir prog
cd prog/ || true
git clone https://github.com/vvartiainen/dotfiles.git

cd || true
rm -rf ~/.config
ln -s ~/prog/dotfiles/nvim ~/.config/nvim
npm install -g tree-sitter-cli
npm install -g neovim
npm install -g biome

# TODO: Fix incompatible gitconfig
#ln -s ~/prog/dotfiles/.gitconfig ~/.gitconfig

ln -s ~/prog/dotfiles/biome.json ~/biome.json
ln -s ~/prog/dotfiles/rgignore ~/.rgignore
mkdir -p ~/.config/kitty
ln -s ~/prog/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

echo "source ~/prog/dotfiles/.zsh_config" >>~/.zshrc
