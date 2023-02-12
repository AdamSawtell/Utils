#!bin/bash

# Script Purpose: Install Snapd for install of SSL
# Script Creater: Adam Sawtell
# Created: 12/02/2023

echo "flamingologic.com.au"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "This script will install Snapd and classic certbot. You will need to register for SSL with certbot and Apache after the script is complete."

sleep 3

echo "Ïnstalling Snapd."

sudo apt install snapd

echo "*****Sleeping for 5 seconds to allow Snapd to install."

sleep 5

echo "Ïnstalling Snapd core."

sudo snap install core

echo "*****Sleeping for 5 seconds to allow Snapd core to install."

sleep 5

echo "Removing Certbot."

sudo apt-get remove certbot

echo "Installing classic Certbot."

sudo snap install --classic certbot

echo "*****Sleeping for 5 seconds to allow Snapd core to install."

sleep 5

sudo ln -s /snap/bin/certbot /usr/bin/certbot

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

sleep 1

echo "Finished"

echo "*"

echo "You will now need to register you web address with Certbot/ Apache, use command: sudo certbot --apache"

echo "*"

echo "Ensure you have your web address assigned to you IP via your DNS settings"

echo "*"

echo "Follow the prompts"

echo "*"

echo "Note: HTTP Port needs to be open for registration to complete."

sleep 2

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "flamingologic.com.au"

echo "*"
