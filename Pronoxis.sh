#!/bin/bash 

clear
#timestamp(time&date)
timestamp() 
 {
  date +"Scan-Date:-%x || Scan-Time:-%r"
  echo " "
 }


function _exterscan {

/bin/echo -e "\033[1;31m ███████╗██╗  ██╗████████╗███████╗██████╗ ███╗   ██╗ █████╗ ██╗         ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ███████╗ ██████╗ █████╗ ███╗   ██╗\033[0m"
/bin/echo -e "\033[1;31m ██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██╔══██╗██║         ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ██╔════╝██╔════╝██╔══██╗████╗  ██║\033[0m"
/bin/echo -e "\033[1;31m █████╗   ╚███╔╝    ██║   █████╗  ██████╔╝██╔██╗ ██║███████║██║         ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    ███████╗██║     ███████║██╔██╗ ██║\033[0m"
/bin/echo -e "\033[1;31m ██╔══╝   ██╔██╗    ██║   ██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║         ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ╚════██║██║     ██╔══██║██║╚██╗██║\033[0m"
/bin/echo -e "\033[1;31m ███████╗██╔╝ ██╗   ██║   ███████╗██║  ██║██║ ╚████║██║  ██║███████╗    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ███████║╚██████╗██║  ██║██║ ╚████║\033[0m"
/bin/echo -e "\033[1;31m ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝\033[0m"  
echo " "

#nikto package
 #statements
#locating the nmap package installed or not.
locate nmap >/dev/null ||  brew info nmap >/dev/null


#return code is 0 means nmap package is installed.
if [ $? -eq 0 ]; then
 {
  echo " "
 }

#return code is 1 
else
 {
  sudo apt-get install nmap >/dev/null || brew install nmap >/dev/null
 }
fi



while [ 1 ]; do
{
read -p "Enter an ip address to scan : " ip
echo " "
#IP ADDRESS VALIDATION
if [ -z $ip ]; then
 {
  /bin/echo -e  "\033[1;31mEnter Correct Address\033[0m"
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
 /bin/echo -e "\033[1;31mEnter Valid ip Address\033[0m"
  echo " "
 }
fi 
}
done 
#<!------Nikto Starts Here-----!>
#/bin/echo -e "\033[1;32m*******************************\033[0m\033[1;32;47m+++++Server Scanning is on process\033[0m\033[1;32m+++****************************\033[0m"
#echo " "
#apt-get upgrade nikto >/dev/null
#timestamp >>Nikto.log
#nikto -h $ip | grep -v 'Nikto' | tee a Nikto.log
#echo " "
#<!------NMAP Starts Here------!>

/bin/echo -e "\033[1;31m--------------------------+++++\033[0m\033[1;31;47m+++++Scanning Open Ports+++++\033[0m\033[1;31m++++-----------------------------\033[0m"
echo " "
timestamp >>resopen.log
nmap --open $ip | grep -v 'Nmap' | tee a resopen.log
echo " "
/bin/echo -e "\033[1;34m%%%%%%%*******\033[0m\033[1;34;43m******Scanning for Service and Version Detection*******\033[0m\033[1;34m********%%%%%%%%%%%%%\033[0m"

#including nse script of cve to fetch details from cve. 
timestamp >>rescve.log
nmap -sV --script vulners --script smb --script http --script ftp1 --script vulscan $ip | grep -v 'Nmap'| grep -v 'Service detection performed.' | tee a rescve.log
echo " "
/bin/echo -e "\033[1;32m======================!!!!!!!!!!!\033[0m\033[1;34;43m!!!!!!Scan Completed!!!!!!\033[0m\033[1;32m!!!!!!!!!!=======================\033[0m"
}

function _interscan {


/bin/echo -e "\033[37m ██╗███╗   ██╗████████╗███████╗██████╗ ███╗   ██╗ █████╗ ██╗         ███████╗███████╗██████╗ ██╗   ██╗███████╗██████╗     ███████╗ ██████╗ █████╗ ███╗   ██╗  \033[0m"
/bin/echo -e "\033[37m ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗████╗  ██║██╔══██╗██║         ██╔════╝██╔════╝██╔══██╗██║   ██║██╔════╝██╔══██╗    ██╔════╝██╔════╝██╔══██╗████╗  ██║ \033[0m"
/bin/echo -e "\033[37m ██║██╔██╗ ██║   ██║   █████╗  ██████╔╝██╔██╗ ██║███████║██║         ███████╗█████╗  ██████╔╝██║   ██║█████╗  ██████╔╝    ███████╗██║     ███████║██╔██╗ ██║ \033[0m"
/bin/echo -e "\033[37m ██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗██║╚██╗██║██╔══██║██║         ╚════██║██╔══╝  ██╔══██╗╚██╗ ██╔╝██╔══╝  ██╔══██╗    ╚════██║██║     ██╔══██║██║╚██╗██║ \033[0m"
/bin/echo -e "\033[37m ██║██║ ╚████║   ██║   ███████╗██║  ██║██║ ╚████║██║  ██║███████╗    ███████║███████╗██║  ██║ ╚████╔╝ ███████╗██║  ██║    ███████║╚██████╗██║  ██║██║ ╚████║ \033[0m"
/bin/echo -e "\033[37m ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝    ╚══════╝╚══════╝╚═╝  ╚═╝  ╚═══╝  ╚══════╝╚═╝  ╚═╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝ \033[0m"


locate lynis >/dev/null || brew install lynis >/dev/null || brew info lynis >/dev/null
if [ $? -eq 0 ]; then
 {
  echo " "
  touch intern.log
  timestamp >intern.log
  cd pronoxis; ./pronoxis audit system | tee a intern.log | grep -v 'unexpected operator'
 } 
fi
}
Quit()
{
break
}


/bin/echo -e '''\033[37m                     ██████╗ ██████╗  ██████╗ ███╗   ██╗ ██████╗ \033[0m\033[31m██╗  ██╗\033[0m\033[37m██╗███████╗ \033[0m'''
/bin/echo -e '''\033[37m                     ██╔══██╗██╔══██╗██╔═══██╗████╗  ██║██╔═══██╗\033[0m\033[31m╚██╗██╔╝\033[0m\033[37m██║██╔════╝ \033[0m'''
/bin/echo -e '''\033[37m                     ██████╔╝██████╔╝██║   ██║██╔██╗ ██║██║   ██║\033[0m\033[31m ╚███╔╝ \033[0m\033[37m██║███████╗ \033[0m'''
/bin/echo -e '''\033[37m                     ██╔═══╝ ██╔══██╗██║   ██║██║╚██╗██║██║   ██║\033[0m\033[31m ██╔██╗ \033[0m\033[37m██║╚════██║ \033[0m'''
/bin/echo -e '''\033[37m                     ██║     ██║  ██║╚██████╔╝██║ ╚████║╚██████╔╝\033[0m\033[31m██╔╝ ██╗\033[0m\033[37m██║███████║ \033[0m'''
/bin/echo -e '''\033[37m                     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ \033[0m\033[31m╚═╝  ╚═╝\033[0m\033[37m╚═╝╚══════╝ \033[0m'''
/bin/echo -e '''\033[37m                                                                 \033[0m\033[31mSecurity\033[0m\033[37m at its Basic form \033[0m'''
echo " "
/bin/echo -e '''\033[37m                                              Developed by team heller$ \033[0m'''
echo " "
/bin/echo -e "                                                                                            \033[1;31m`timestamp`\033[0m"
echo " "
echo " "
while [ 1 ]; do
{
  /bin/echo -e "\033[31m1.)EXTERNAL SERVER SCAN \033[0m"
  /bin/echo -e "\033[31m2.)INTERNAL SERVER SCAN\033[0m"
  /bin/echo -e "\033[31m3.)Exit\033[0m"
  /bin/echo -e "\033[31mselect an option : \033[0m" 
  read option
if [ "$option" = "1" ]; then
 {
   _exterscan
 }
fi
if [ "$option" = "2" ]; then 
 {
  _interscan
 }
fi
if [ "$option" = "3" ]; then
{
 Quit
}
fi
}  
done                  

