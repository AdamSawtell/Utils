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

echo "Please enter client id:"
read var1

echo "Please enter Envirnment IP address:"
read var2

echo "Please enter browser title:"
read var3

echo "Is this a Test or Development environment:"
read var4

echo "The values you entered are: $var1, $var2, $var3, and $var4"

# Environment Variables
export ad_client_id=var1
export environment_ip=var2
export browser_title=var3
export environment_type=var4

# Set Ubuntu Bash Host Name

echo "What type of environment will thes be: d for Development or t for Test? (d/t)"

read Test

if [[ $Test == "d" ]]; then

sudo hostnamectl set-hostname Dev
        echo "Host name changed to Dev"

else

sudo hostnamectl set-hostname Test
        echo "Host name changed to Test"


# Update System Config Value

echo "Updating AbilityERP (iDempiere) System Configuration to a ${environment_type} Environment"

PGUSER = adempiere
PGPASSWORD = flamingo
PGHOST = ${environment_ip}
PGPORT = 5432
PGDATABASE = idempiere

psql "postgresql://${PGUSER}:${PGPASSWORD}@${PGHOST}:${PGPORT}/${PGDATABASE}" << EOF

echo "Updating AbilityERP (iDempiere) System Configuration"

# Disable Single Sign On (SSO)
echo "Disable SSO"
UPDATE ad_sysconfig SET value = 'N' WHERE ad_sysconfig_id = 200205;

# Disable Client Email Host/ Server
echo "Disable Email Client"
UPDATE ad_client SET smtphost = 'Disabled' WHERE ad_client_id = ${ad_client_id};
UPDATE ad_client SET description = 'Email Host Disabled - This is a Test site' WHERE ad_client_id = ${ad_client_id};

# Update Use Email For Login to No
echo "Disable Email Login"
UPDATE ad_sysconfig SET value = 'N' WHERE ad_sysconfig_id = 200014;

# Update the ZK Browser title
echo "Updating Browser Title"
UPDATE ad_sysconfig SET value = '${browser_title}' WHERE ad_sysconfig_id = 1000003;

# Update ZK Logo Small (Menu Page) Image
echo "Updating Logos"
UPDATE ad_sysconfig SET value = 'https://fllogo.s3.us-east-2.amazonaws.com/test+Flamingo+Logic+1+pic.jpg' WHERE ad_sysconfig_id = 1000001;

# Update ZL Logo Large (Login Page)  Image
UPDATE ad_sysconfig SET value = 'https://fllogo.s3.us-east-2.amazonaws.com/test+Flamingo+Logic+1+pic.jpg' WHERE ad_sysconfig_id = 1000000;


# Restarting AbilityERP (iDempiere) Service

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

echo "Finished"

echo "*"

sleep 2

echo "flamingologic.com.au"

echo "*"

EOF
