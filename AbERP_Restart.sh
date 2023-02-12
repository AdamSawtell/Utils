#!/bin/bash

# Script Purpose: Restart AbilityERP (iDempiere) service - restart
# Script Name: aberpquickrestart.sh
# Script Creater: Adam Sawtell
# Created: 12/02/2023
# Notes: 


echo "flamingologic.com.au"

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

echo "Finished"

echo "flamingologic.com.au"

