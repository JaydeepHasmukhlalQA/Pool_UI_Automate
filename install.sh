#!/bin/bash

CYAN="\033[0;36"
GREEN="\033[0;32m"
DEFULT="\e[39mDefault"
BLINK="\e[5mBlink"
NOBLINK="\e[25mNormal"

echo -e "${BLINK}${CYAN}Updateing."
sudo apt-get update -y && apt-get upgrade -y

sudo apt-get install curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo -e "${BLINK}${GREEN} Finished updating."

echo -e "${BLINK}${CYAN} Installing Git, NodeJs."
sudo apt-get install -y git
sudo apt-get install -y nodejs
echo -e "${BLINK}${GREEN} Finished Installing."

sleep 15

echo -e "${BLINK}${CYAN} Installing API Service."
sudo cp ./poolui.service /etc/systemd/system/
sudo systemctl daemon-reload
echo -e "${BLINK}${GREEN}Finished installing API Service."

sleep 15

echo -e "${BLINK}${CYAN}Cloning GIT repo."
sudo git clone https://github.com/Nboaram/TeamAPoolProjectUI.git

sleep 15

echo -e "${BLINK}${CYAN}Moving project to base."
sudo mv TeamAPoolProjectUI/ ../TeamAPoolProjectUI/

sleep 15

echo -e "${BLINK}${CYAN}CD into project."
cd ../TeamAPoolProjectUI

sleep 15

echo -e "${BLINK}${CYAN}Checking into Developer."
sudo git checkout Developer

sleep 15

echo -e "${BLINK}${CYAN}Installing angular and dependencies."
sudo npm install -g @angular/cli
sudo npm install

sleep 15

echo -e "${BLINK}${CYAN}Starting poolui.service.${DEFULT}${NOBLINK}"
sudo systemctl start poolui