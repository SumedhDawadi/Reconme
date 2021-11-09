
#!/bin/bash


RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
BLUE='\033[0;34m'

printf "${GREEN}\n"
echo """


██████╗ ███████╗ ██████╗ ██████╗ ███╗   ██╗███╗   ███╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗████╗  ██║████╗ ████║██╔════╝
██████╔╝█████╗  ██║     ██║   ██║██╔██╗ ██║██╔████╔██║█████╗
██╔══██╗██╔══╝  ██║     ██║   ██║██║╚██╗██║██║╚██╔╝██║██╔══╝
██║  ██║███████╗╚██████╗╚██████╔╝██║ ╚████║██║ ╚═╝ ██║███████╗
╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝╚══════╝
                          Author  : Sumedh Dawadi
                          Twitter : https://twitter.com/MrExpl0it/
                          Disclaimer: Use of this tool for attacking targets without prior mutual consent is illegal
"""

#ROOT PRIVELEX

if [[ $(id -u) != 0 ]]; then
    echo -e "\n[!] Install.sh requires root privileges"
    exit 0
fi

printf "${GREEN}\n"


#Input the domain
read -p "[+]Please enter the Target : " Domain

#Checking if the Target domain works or not : 
if nslookup $Domain  ; then
    echo "It works !!"
else
        echo "Host is dead"
fi


#Firewall information
echo "Checking Firewall information"
wafw00f $Domain

#Extracting subdomains
subfinder -d $Domain

#Extracting subdomains
assetfinder --subs-only $Domain


#Fetching URL's endpoint
echo $Domain | gau 






