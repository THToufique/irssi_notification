#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${CYAN}${BOLD}"
echo "  ___  ____  ____  ____  ____"
echo " |_ _||  _ \/ ___||  _ \|_ _|"
echo "  | | | |_) \___ \| |_) || | "
echo "  | | |  _ < ___) |  __/ | | "
echo " |___||_| \_\____/|_|   |___|"
echo -e "${NC}"

echo -e "${YELLOW}[*] Updating packages...${NC}"
pkg update -y && pkg upgrade -y

echo -e "${YELLOW}[*] Installing irssi and termux-api...${NC}"
pkg install -y irssi termux-api

echo -e "${YELLOW}[*] Setting up notification script...${NC}"
mkdir -p ~/.irssi/scripts/autorun

curl -fsSL "https://raw.githubusercontent.com/THToufique/irssi_notification/refs/heads/main/termux_notify.pl" \
  -o ~/.irssi/scripts/termux_notify.pl

ln -sf ~/.irssi/scripts/termux_notify.pl ~/.irssi/scripts/autorun/termux_notify.pl

echo -e "${GREEN}${BOLD}[✓] Done! Open IRSSI and you're set.${NC}"
