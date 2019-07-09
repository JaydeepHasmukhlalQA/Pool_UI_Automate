#!/bin/bash

CYAN="\e[34m"
GREEN="\e[32"
DEFULT="\e[39m"
BLINK="\e[5m"
NOBLINK="\e[25m"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                   Updating and Upgrading                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo apt-get update -y && apt-get upgrade -y
sudo apt-get install curl python-software-properties
sudo curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "               Finished Updating and Upgrading               "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                   Installing Git, NodeJS                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo apt-get install -y git
sudo apt-get install -y nodejs
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "               Finished Installing Git, NodeJS               "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                   Installing API Service                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo cp ./poolui.service /etc/systemd/system/
sudo systemctl daemon-reload
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "                   Installed API Service                     "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                      Cloning Git Repo                       "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo git clone https://github.com/Nboaram/TeamAPoolProjectUI.git
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "                 Finished Cloning Git Repo                   "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                   Moving Project To Base                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo mv TeamAPoolProjectUI/ ../TeamAPoolProjectUI/
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "                  Finished Moving Project                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                      CD Into Project                        "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
cd ../TeamAPoolProjectUI

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                  Checking Into Developer                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo git checkout Developer
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "                   Checked Into Developer                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "              Installing Angular & Dependencies              "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo npm install -g @angular/cli
sudo npm install
echo -e "${BLINK}${GREEN}"
echo -e "#############################################################"
echo -e "                Finished Installing Angular                  "
echo -e "############################################################# \n"
echo -e "${DEFULT}${DEFULT}"

echo -e "${BLINK}${CYAN}"
echo -e "#############################################################"
echo -e "                   Starting Service File                    "
echo -e "############################################################# \n"
echo -e "${DEFULT}${NOBLINK}"
sudo systemctl start poolui