


#!/bin/bash
home='cd /opt'
'echo $home'

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
                          Disclaimer: I dont promote any illegal activity
"""

echo "Tools that will be installed in your system are : "
printf "${BLUE}\n"
echo "GO-land"
echo "Nuclei"
echo "Sublist3r"
echo "Assetfinder"

printf "${GREEN}\n"

if [ ! command -v go  -o  ! command -v golang   &> /dev/null
then
        apt install golang
fi

echo "Checking if the Tool called Nuclei is installed in your system or not"
echo
if ! command -v nuclei &> /dev/null
then
        GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
else
echo
        echo "Nuclie is already installed in your system."

fi
echo
echo "Checking if the Sublist3r is installed in your system or not"
if ! command -v sublist3r &> /dev/null
then
        git clone  https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && python3 setup.py install &&cd $OLDPWD && rm -rf Sublist3r

else
        echo "Sublist3r is alreay installed in your system"

fi


echo "Checking if assertfinder is installed in your system or not"
if ! command -v assetfinder &> /dev/null
then
        go get -u github.com/tomnomnom/assetfinder && cp assetfinder
else
        echo "Assetfinder is alreay installed in your system"
fi
