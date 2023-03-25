#!/bin/bash

# Script Purpose:  To update the hostname for a Test or Development environment
# Script Name: updatehostname.sh
# Script Creater: Adam Sawtell
# Created: 12/02/2023
# Notes:

echo "flamingologic.com.au"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "What type of environment will this be: d for Development or t for Test? (d/t)"

read environment

if [[ "$environment" == "d" ]]; then
  sudo hostnamectl set-hostname Dev
  echo "Host name changed to Dev"
  
elif [[ "$environment" == "t" ]]; then
  sudo hostnamectl set-hostname Test
  echo "Host name changed to Test"
  
else
  echo "Invalid environment specified: $environment"
  exit 1
fi

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

sleep 1

echo "You will need to log out and back into enviroment for change to update" 

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
