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

mkdir /opt/tool
echo "done"

#Installing Go-Language
mkdir /opt/tool
echo "done"

#Installing Go-Language

if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

                                        echo "Installing Golang"
                                        wget https://dl.google.com/go/https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
                                        sudo tar -xvf https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
                                        sudo mv go /usr/local
                                        export GOROOT=/usr/local/go
                                        export GOPATH=$HOME/go
                                        export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
                                        echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
                                        echo 'export GOPATH=$HOME/go'   >> ~/.bash_profil
                                        echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
                                        source ~/.bash_profile
                                        sleep 1
                                        break
                                        ;;
                                no)
                                        echo "Please install go and rerun this script"
                                        echo "Aborting installation..."
                                        exit 1
                                        ;;
        esac
done
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
