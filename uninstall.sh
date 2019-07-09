CYAN="\033[0;36"
GREEN="\033[0;32m"
DEFULT="\e[39mDefault"
BLINK="\e[5mBlink"
NOBLINK="\e[25mNormal"

echo -e "${BLINK} ${CYAN} Removing Files. ${DEFULT} ${NOBLINK}"
sudo systemctl stop poolui
sudo systemctl disable poolui

sudo rm -fR ../TeamAPoolProjectUI
sudo rm -fR /etc/systemd/system/poolui.service