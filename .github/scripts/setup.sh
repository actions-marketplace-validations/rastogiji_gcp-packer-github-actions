#!/bin/bash

cd ~
sudo apt-get -y update
sudo apt-get -y upgrade

git clone https://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@github.com/vatsanatech/stage-backend.git

sudo apt-get -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get -y install nodejs

node -v
npm -v

sudo npm install pm2 -g
cd ~/stage-backend

sudo npm install
pm2 start server.js