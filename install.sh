#!/bin/bash

set -e

LIGHTBLUE='\033[94m'
BOLD='\033[1m'
RESET='\033[0m'

echo ""
echo -e "${LIGHTBLUE}╭─────────────────────────────────────────╮${RESET}"
echo -e "${LIGHTBLUE}│    ✿ ${BOLD}ShoreFetch Installer${RESET}${LIGHTBLUE}          ✿    │${RESET}"
echo -e "${LIGHTBLUE}│                                         │${RESET}"
echo -e "${LIGHTBLUE}│      Author : @KangSantuy17             │${RESET}"
echo -e "${LIGHTBLUE}│      GitHub : github.com/KangSantuy17   │${RESET}"
echo -e "${LIGHTBLUE}│                                         │${RESET}"
echo -e "${LIGHTBLUE}│    ✿ Fastfetch aseli blackshore    ✿    │${RESET}"
echo -e "${LIGHTBLUE}╰─────────────────────────────────────────╯${RESET}"
echo ""

install_fastfetch() {
    if command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm fastfetch

    elif command -v apt &> /dev/null; then
        sudo apt install -y fastfetch

    elif command -v dnf &> /dev/null; then
        sudo dnf install -y fastfetch

    elif command -v zypper &> /dev/null; then
        sudo zypper install -y fastfetch

    elif command -v xbps-install &> /dev/null; then
        sudo xbps-install -Sy fastfetch

    elif command -v apk &> /dev/null; then
        sudo apk add fastfetch

    elif command -v nix-env &> /dev/null; then
        nix-env -iA nixpkgs.fastfetch

    else
        echo "❌ Distro / package manager tidak didukung oleh ShoreFetch"
        exit 1
    fi
}

echo "🚀 Installing Fastfetch..."
# Install fastfetch
install_fastfetch

# Pasang config
echo "📁 Installing config..."
mkdir -p ~/.config/fastfetch
cp config.jsonc ~/.config/fastfetch/config.jsonc
cp shore.txt ~/.config/fastfetch/shore.txt

echo "✅ Selesai! "
fastfetch
