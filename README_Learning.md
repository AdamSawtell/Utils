The purpose of this file is to save known commands and information

Must start bash script with
- #!/bin/bash

Create a new excutable.sh file – 
nano ((script name).sh)
-	Example: nano bestdatever.sh

Time between actions – 
sleep (in time insec) 
-	Example: sleep 5

Save a nano file – 
CTRL x > Save buffer prompt (Y) > Do you want file name (Etr)

Run scrip prior to changing access – 
Bash (script name)

Check permissions to script
Ls -l

Change the access of script so it can execute – 
chmod +x (script name)

Run script – 
./(add script)

Set a variable - $
- Used the $ sign
- Set the variable by name
- Example: myname="Adam"
- To recall that variable in the script - Example: $myname

- To set a ENV variable
- Example: now=$(date)
- To recall that variable in the script - Example: $now 

Variables
- UPPER CASE - Environment variable (System)
- lower case - User defind

Delete an entire line
- CTRL k

Number: doing maths
- expr (add caculation)
- Example: expr 10 + 10

Equals
- value: -eq
Not Equal
- value: -ne
Greater than
- value: -gt

If statment
- Opens with: if
- Closes with: fi

Exit code
- Success of failure of command

Command: $?
- Success = 0
- Failure = 2

Example - 
if [ $? -eq 0 ]
then
  echo "AbilityERP (iDempeire) was successfully Stopped"
  date
else
  echo "Process failed"
fi






