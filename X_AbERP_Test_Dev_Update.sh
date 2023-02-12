#!bin/bash

# Script Purpose: To update a clone of Production into a Test or Development environment
# Script Name: aberp_environemnt_update_test_dev.sh
# Script Creater: Adam Sawtell
# Created: 
# Notes: 

echo "flamingologic.com.au"

echo "***"
sleep 1
echo "**"
sleep 1
echo "*"




echo "This script will change this environment int a test or development build."


#Environment changes 

-#


#Database changes

-#SSO off: Update from Y to N
	system configurator> ENABLE_SSO> Confugured value: N
-#Email login:Update from Y to N
	system configurator> USE_EMAIL_FOR_LOGIN> Confugured value: N
-#Webname
	system configurator> ZK_BROWSER_TITLE> Confugured 
