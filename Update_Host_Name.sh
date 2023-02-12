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

echo " What type of environment will thes be: d for Development or t for Test? (d/t)"

read Test

if [[ $Test == "d" ]]; then

sudo hostnamectl set-hostname Dev
        echo "Host name changed to Dev"

else

sudo hostnamectl set-hostname Test
        echo "Host name changed to Test"

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
