#!/bin/bash
softwareVersion=$(git describe --long)

echo -e "\e[1;4;246mRoadApplePi Setup $softwareVersion\e[0m
This script will push the existing db to github, beaware that this can be dangerous or be the source of faults"


###########################################
# Getting latest version from GitHub      #
###########################################
echo -e "\e[1;4;93mStep 2. Getting latest version from GitHub\e[0m"
cd ~/PureSuperbRapi
git pull

#######################
# Install RoadApplePi #
#######################
echo -e "\e[1;4;93mStep 4. Building and installing RoadApplePi\e[0m"
#cd ~/PureSuperbRapi
make
sudo make install

sudo cp -r html /var/www/
sudo rm /var/www/html/index.html
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 0755 /var/www/html
sudo cp raprec.service /lib/systemd/system
sudo chown root:root /lib/systemd/system/raprec.service
sudo chmod 0755 /lib/systemd/system/raprec.service
sudo systemctl daemon-reload
sudo systemctl enable raprec
sudo cp hostapd-rap.conf /etc/hostapd
sudo cp dnsmasq.conf /etc
sudo mkdir /var/www/html/vids
sudo chown -R www-data:www-data /var/www/html

installDate=$(date)

echo installDate
echo "Done! Please reboot your Raspberry Pi now"
