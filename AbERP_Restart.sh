#!/bin/bash

# Script Purpose: Restart AbilityERP (iDempiere) service - restart
# Script Name: aberpquickrestart.sh
# Script Creater: Adam Sawtell
# Created: 12/02/2023
# Notes: 


echo "flamingologic.com.au"

echo "Stopping AbilityERP (iDempiere) Service: Action time 60 seconds."

sudo service idempiere stop

sleep 60

echo "Starting AbilityERP (iDempiere) Service: Action time 30 seconds."

sudo service idempiere start

Sleep 30

date

echo "Finished"

echo "flamingologic.com.au"
