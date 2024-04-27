#!/usr/bin/env bash

aur_packages="../.packages-aur"
packages="../.packages"

git clone https://github.com/wsadev01/dotfiles /tmp/

rsync -avP /tmp/dotfiles/ /home/$USER/

echo "[+] Setting up YAY"
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si
sudo mv /usr/bin/yay /opt/
sudo ln -s /opt/yay /usr/bin/yay

if [ -f "$packages" ]; then
	echo "[+] Package not found, install them manually..."
	exit 1
fi

xargs -r sudo pacman -Sy --noconfirm < "$packages"

if [ -f "$aur_packages" ]; then
	echo "[+] Packages from AUR were not found, install them manually..."
	exit 1
fi

xargs -r yay -S < "$aur_package"
