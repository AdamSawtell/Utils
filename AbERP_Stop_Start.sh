#!/bin/bash

# Script Purpose: Restart AbilityERP (iDempiere) service - Stop and start
# Script Name: aberpstartstop.sh
# Script Creater: Adam Sawtell
# Created: 12/02/2023
# Notes: 


echo "flamingologic.com.au"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "You are about to stop and start your AbilityERP (iDempiere) service, ensure no active users are logged in."

sleep 2

echo "*****You have 10 seconds to abort process if not required."

sleep 5

echo "****4"
sleep 1
echo "***3"
sleep 1
echo "**2"
sleep 1
echo "*1"
sleep 1

echo "Stopping AbilityERP (iDempiere) Service."

sudo service idempiere stop

if [ $? -eq 0 ]
then
  echo "AbilityERP (iDempeire) was successfully Stopped"
  date
else
  echo "Process failed"
fi

echo "Starting AbilityERP (iDempiere) Service."

sleep 30

echo "Starting AbilityERP (iDempiere) Service."

sudo service idempiere start

if [ $? -eq 0 ]
then
  echo "AbilityERP (iDempeire) was successfully Started"
  date
else
  echo "Process failed"
fi

sleep 3

echo "Checking AbilityERP (iDempiere) status."

sleep 3

echo "AbilityERP (iDempiere) Service is Active and was started at:"

echo "*"

date

sleep 5

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

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
