#!/bin/bash
clear
echo "starting"
#start of startup varibles

Version="saber_0.1a"
Support_link="linkgoeshere"
PACMAN_CONF="/etc/pacman.conf"


#end of start varibles
echo "started!"
clear
echo "                   █████                       "
echo "                  ▒▒███                        "
echo "  █████   ██████   ▒███████   ██████  ████████ "
echo " ███▒▒   ▒▒▒▒▒███  ▒███▒▒███ ███▒▒███▒▒███▒▒███"
echo "▒▒█████   ███████  ▒███ ▒███▒███████  ▒███ ▒▒▒ "
echo " ▒▒▒▒███ ███▒▒███  ▒███ ▒███▒███▒▒▒   ▒███     "
echo " ██████ ▒▒████████ ████████ ▒▒██████  █████    "
echo "▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒  ▒▒▒▒▒     "
echo "a arch linux rice"
sleep 0.5

#moves note down
echo ""
echo ""
echo ""

echo " note that this tool is ment to run on a clean install of arch linux"
echo " and most likely wont work on all desktop environments"
echo " please back up anything important before useing"
echo ""

read -p "Press [Enter] to continue..."
sleep 1
clear
#setup
echo "starting changes"
#chesks if useing sudo
sleep 0.5
clear
echo "checking if sudo"
if [ "$EUID" -ne 0 ]; then
    echo "this script must be run with sudo" >&2
    exit 1
fi
sleep 0.5
#checks if multilib is active
echo "progress"
echo "[----------------------]"
sleep 0.1

if grep -P "^\s*\[multilib\]" "$PACMAN_CONF" > /dev/null; then
	echo""
else
    clear
    echo "[#---------------------]"
    sed -i -e '/#\[multilib\]/,+1s/^#//' "$PACMAN_CONF"
    clear
    echo "[##--------------------]"
    if grep -P "^\s*\[multilib\]" "$PACMAN_CONF" > /dev/null; then
        clear
        echo "[###-------------------]"
        pacman -Sy --noconfirm
        clear
        echo "[####------------------]"
    else
        echo "failed to enable multilib please enable multilib manually."
        exit 1
    fi
fi
set -e
#install flatpak
echo "[#####-----------------]"
sudo pacman -S --needed --noconfirm flatpak
echo "[######----------------]"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "[#######---------------]"
sudo pacman -S --needed --noconfirm git base-devel
echo "[########--------------]"
sudo pacman -S --needed --noconfirm neovim fastfetch firefox
echo "[#########-------------]"

#rice install
