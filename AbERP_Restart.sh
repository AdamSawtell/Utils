#!/bin/bash

# Script Purpose: Restart AbilityERP (iDempiere) service - restart
# Script Name: aberpquickrestart.sh
# Script Creater: Adam Sawtell
# Created: 12/02/2023
# Notes: 


echo "flamingologic.com.au"

echo "Restarting AblityERP (iDempiere)"

echo "Stopping AbilityERP (iDempiere) Service."

sudo service idempiere stop

sleep 60

echo "Starting AbilityERP (iDempiere) Service."

sudo service idempiere start

echo "flamingologic.com.au"
