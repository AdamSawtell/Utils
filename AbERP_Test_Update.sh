#!/bin/bash

# Script Purpose: To create a test or dev enviroment from a Production enviroment
# Script Name: AbERP Test Update
# Script Creater: Adam Sawtell
# Created: 25/03/2023
# Notes: 
# Outcomes:
# - Set Ubuntu bash Host Name
# - Disable Sigles Sign On (SSO)
# - Disable Client Email Host/ Server
# - Update Use Email For Login to No
# - Update the Browser title
# - Update ZK Logo Small (Menu Page) Image
# - Update ZL Logo Large (Login Page)  Image
# - Restarts AbilityERP (iDempiere ) Service


echo "flamingologic.com.au"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "Please enter client id - this is unique to the customers build:"
read var1

echo "Please enter envirnment IP address:"
read var2

echo "Ensure you have opened port 5432 in the enviroments security group to this IP, It is required to update Posgres Db"

echo "Please enter browser title for new site:"
read var3


echo "The values you entered are: $var1, $var2, $var3"

# Environment Variables
export ad_client_id=$var1
export environment_ip=$var2
export browser_title=$var3

# Set Ubuntu Bash Host Name

echo "What type of environment will thes be: d for Development or t for Test? (d/t)"

read var4

if [[ "$var4" == "d" ]]; then
  sudo hostnamectl set-hostname Dev
  echo "Host name changed to Dev"
  
elif [[ "$var4" == "t" ]]; then
  sudo hostnamectl set-hostname Test
  echo "Host name changed to Test"
  
else
  echo "Invalid environment specified: $var4"
  exit 1
fi

echo "Bash updated for developer"

# Update System Config Value

echo "Updating AbilityERP (iDempiere) System Configuration to a non production environment"

sleep 3

echo "Disable SSO"
echo "Disable Email Client"
echo "Disable Email Login"
echo "Updating Browser Title"
echo "Updating Logos"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

PGUSER=adempiere
PGPASSWORD=flamingo
PGHOST=${environment_ip}
PGPORT=5432
PGDATABASE=idempiere

psql "postgresql://${PGUSER}:${PGPASSWORD}@${PGHOST}:${PGPORT}/${PGDATABASE}" << EOF

UPDATE ad_sysconfig SET value = 'N' WHERE ad_sysconfig_id = 200205;

UPDATE ad_client SET smtphost = 'Email Host Disabled - This is a Test site' WHERE ad_client_id = ${ad_client_id};
UPDATE ad_client SET description = 'Email Host Disabled - This is a Test site' WHERE ad_client_id = ${ad_client_id};

UPDATE ad_sysconfig SET value = 'N' WHERE ad_sysconfig_id = 200014;

UPDATE ad_sysconfig SET value = '${browser_title}' WHERE ad_sysconfig_id = 1000003;

UPDATE ad_sysconfig SET value = 'https://fllogo.s3.us-east-2.amazonaws.com/FL+Test+New+Small.jpg' WHERE ad_sysconfig_id = 1000001;

UPDATE ad_sysconfig SET value = 'https://fllogo.s3.us-east-2.amazonaws.com/FL+Test+New+Large+Updated.jpg' WHERE ad_sysconfig_id = 1000000;

EOF

# Restarting AbilityERP (iDempiere) Service

echo "Updates to environment require a restart"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"

echo "Restarting AbilityERP (iDempiere) Service"

echo "Stopping AbilityERP (iDempiere) Service."

sudo service idempiere stop

if [ $? -eq 0 ]
then
  echo "AbilityERP (iDempeire) was successfully Stopped"
  date
else
  echo "Stop process failed"
fi

echo "Starting AbilityERP (iDempiere) Service - This may take 30 sec."

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

echo "Finished"

echo "*"

echo "Your envbironment is now available to test"

sleep 2

echo "flamingologic.com.au"

echo "*"

EOF
