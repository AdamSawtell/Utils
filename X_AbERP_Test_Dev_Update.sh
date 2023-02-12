#!/bin/bash

# Script Purpose: Learnning script to update database
# Script Name: updateenv.sh
# Script Creater: Adam Sawtell
# Created: 12/02/2023
# Notes:

echo "flamingologic.com.au"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "This script will update your build from a Production/ Pristine clone to a test/ Dev environment."

sleep 2

echo "*"

# Change the name build on browser tab
        echo "Updating browser name"

update ad_sysconfig set value = "Build Test AS" where ad_sysconfig_id = "1000003";


# Update from using email login to name
        echo "Updating from emil login to name login"

update ad_sysconfig set value = "N" where ad_sysconfig_id = "200014";

# Turn of SSO
        echo "Updating SSO value to No"

update ad_sysconfig set value = "N" where ad_sysconfig_id = "200205";

# Updating host name
        echo "Updating host name" 

echo " What type of environment will thes be: d for Development or t for Test? (d/t)"

read Test

if [[ $Test == "d" ]]; then

sudo hostnamectl set-hostname Dev
        echo "Host name changed to Dev, Please re log into environment"

else

sudo hostnamectl set-hostname Test
        echo "Host name changed to Test, Please re log into environment"

fi


# Restarting AbilityERP
        echo "AbilityERP (iDempiere) requires a restart fro updated items to configure"

echo "Stopping AbilityERP (iDempiere) Service."

sudo service idempiere stop

if [ $? -eq 0 ]
then
  echo "AbilityERP (iDempeire) was successfully Stopped"
  date
else
  echo "Stop process failed"
fi

echo "Starting AbilityERP (iDempiere) Service."

sleep 30

sudo service idempiere start

if [ $? -eq 0 ]
then
  echo "AbilityERP (iDempeire) was successfully Started"
  date
else
  echo "Start process failed"
fi

sleep 1

echo "Please wait 60 seconds for AbilityERP (iDempiere) to become available, check your AbilityERP (iDempiere) service is active by."

sleep 3

echo "1 - using command: sudo systemctl status idempeire"

sleep 1

echo "2 - Logging in via your WebUI"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

sleep 1

echo "Finished"

echo "*"

sleep 2

echo "flamingologic.com.au"

echo "*"


