#!/usr/bin/env bash

# Update and upgrade system
sudo apt-get update
sudo apt-get upgrade -y

# Install Git
sudo apt install git -y

#General Packages
sudo apt install wget curl htop vim tree vlc default-jre -y

# Install php latest version
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update
sudo apt install -y php8.1

# Install Node.js and npm
sudo apt install -y nodejs npm
sudo npm install -g n
sudo n 16.14.0
sudo ln -sf /usr/local/n/versions/node/16.14.0/bin/node /usr/bin/nodejs

# Install Visual Studio Code
CODE_URL="https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
CODE_FILE="${HOME}/Downloads/vscode.deb"
wget -O "${CODE_FILE}" "${CODE_URL}" && sudo apt install -y "${CODE_FILE}" && rm "${CODE_FILE}"

# Install Docker
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Oh My Zsh and plugins
sudo apt install -y zsh fonts-powerline
sudo chsh -s $(which zsh) $USER
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc

# Install DBeaver
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update
sudo apt install -y dbeaver-ce

# Install Spotify
sudo snap install spotify

# Install Telegram
sudo snap install telegram-desktop

# Install Microsoft Teams
sudo snap install teams-for-linux

# Install Discord
sudo snap install discord

# Install Anki
sudo apt-add-repository universe -y
sudo apt-get update
sudo apt-get install -y anki

# Install qBittorrent
sudo add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable
sudo apt update
sudo apt install -y qbittorrent

read -p "Press Y and restart(Recommended) or ESC to exit execution." -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo reboot
fi
