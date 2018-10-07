#!/bin/bash 

export PATH="$PATH:/root/sample.sh"
clear

#timestamp(time&date)
timestamp() 
 {
  date +"Scan-Date:-%x || Scan-Time:-%r"
  echo " "
 }
echo " "
/bin/echo -e '''\e[1;32m
                ########  ########   #######  ##    ##  #######  ##     ## ####  ######  
                ##     ## ##     ## ##     ## ###   ## ##     ##  ##   ##   ##  ##    ## 
                ##     ## ##     ## ##     ## ####  ## ##     ##   ## ##    ##  ##       
                ########  ########  ##     ## ## ## ## ##     ##    ###     ##   ######  
                ##        ##   ##   ##     ## ##  #### ##     ##   ## ##    ##        ## 
                ##        ##    ##  ##     ## ##   ### ##     ##  ##   ##   ##  ##    ## 
                ##        ##     ##  #######  ##    ##  #######  ##     ## ####  ###### \e[0m'''

echo " "
/bin/echo -e "                                          \e[1;31m`timestamp`\e[0m"
echo " "
echo " "
while [ 1 ]; do
{
read -p "Enter an ip address to scan : " ip
echo " "

#IP ADDRESS VALIDATION
if [ -z $ip ]; then
 {
  /bin/echo -e "\e[1;31mEnter Correct Address\e[0m"
  echo " "
  exit
  }
fi

if fping -r 1 $ip 
then
 {
  echo " "
  echo "IP Validated"
  break
 }
else
 {
  echo " "
  /bin/echo -e "\e[1;31mEnter Valid ip Address\e[0m"
  echo " "
 }
fi 
}
done 

#<!------NMAP Starts Here------!>
#Deleting the lock file.
ls -la /var/lib/apt/lists | grep lock 
opt=`echo $?`

#Deleting the lock file in the cache directory.
#Directory exists.
if [ "$opt" = "0" ]; then
 {
  sudo rm /var/lib/apt/lists/lock
  sudo rm /var/cache/apt/archives/lock 
  sudo rm /var/lib/dpkg/lock 
 }

#Directory doesn't exists.
elif [ "$opt" = "1" ]; then
 {
  echo " "
 }
fi

#locating the nmap package installed or not.
dpkg -l | grep nmap >/dev/null

#return code of the last executed command.
opt=`echo $?`

#return code is 0 means nmap package is installed.
if [ "$opt" = "0" ]; then
 {
  echo " "
 }

#return code is 1 package is not installed and installing the nmap package.
elif [ "$opt" = "1" ]; then 
 {
  sudo apt-get install nmap
 }
fi
/bin/echo -e "\e[1;31m!!!!!!!!!!!!!!!!!!-------------------Scanning Open Ports--------------------!!!!!!!!!!!!!!!!!\e[0m"
echo " "
res=`nmap --open $ip | grep -v 'Nmap'`
/bin/echo -e "\e[1;32m$res\e[0m"
echo " "
timestamp >>resopen.log
echo "$res\n" >>resopen.log
/bin/echo -e "\e[1;34m!!!========*************Scanning for Service and Version Detection***************==========!!!\e[0m"

#including nse script of cve to fetch details from cve. 
rescve=`nmap -sV --script vulners --script smb --script http --script ftp1 --script vulscan $ip | grep -v 'Nmap'| grep -v 'Service detection performed.'`
echo " "
/bin/echo -e "\e[1;32m$rescve\e[0m"
timestamp >>rescve.log
echo "$rescve" >>rescve.log
echo " "

#<!------NIKTO Starts Here------!>

#locating the nikto package installed or not.
dpkg -l | grep nikto >/dev/null 

#return code of the last executed command.
opt=`echo $?`

#return code is 0 means nikto package is installed.
if [ "$opt" = "0" ]; then
 {
  echo " "
 }

#return code is 1 package is not installed and installing the nikto package.
elif [ "$opt" = "1" ]; then 
 {
  sudo apt-get install nikto
 }
fi
/bin/echo -e "\e[1;33m##################***********Vulnerability Checker**********########################\e[0m"
echo " "
res=`nikto -host $ip | grep 'Nikto'`
/bin/echo -e "\e[1;32m$res\e[0m"
timestamp >>vuln.log
echo "$res" >>vuln.log
echo " " 
echo "\e[1;32m======================!!!!!!!!!!!!!!!!!Scan Completed!!!!!!!!!!!!!!!!=======================\e[0m"



