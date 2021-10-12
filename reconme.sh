


#!/bin/bash

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'
BLUE='\033[0;34m'

printf "${RED}\n"
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
printf "${GREEN}\n"
read -p "Please Enter The Target Domain [Without http or https] : " Domain
read -p "Do you want to save the result : " save
case $save in
        yes)
                mkdir -p Result; cd Result ; touch result.txt;

                ;;
        no)
                printf "${GREEN}\n"
                echo "You result wont be saved"
                ;;
        *)
                printf "${RED}\n"
                echo "Invalid"
                exit
                        ;;
esac
echo
echo "---------------------------------------------------"
echo "Checking if your is alive or dead                  |"
echo "---------------------------------------------------"
if host $Domain &> /dev/null ; then
        echo "-------------"
        echo "Host is alive"
        echo "-------------"
else
        echo "-------------"
        echo "Host is dead "
        echo "-------------"
fi
echo
printf "${GREEN}\n"
echo "Gathering information about target's firewall"
wafw00f -a $Domain
echo
printf "${GREEN}\n"
echo "Gathering information about server and other technologies"
printf "${GREEN}\n"
whatweb -v $Domain
echo

dork.sh $Domain

echo

printf "${GREEN}\n"
echo "Getting Target's IPv4-Address and IPv6-Address"
printf "${GREEN}\n"
nslookup $Domain
echo
printf "${GREEN}\n"
echo "Fetching Subdomains of the Target"
assetfinder --subs-only $Domain
echo
