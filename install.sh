
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
echo "Tools that will be installed in your system are : "
printf "${BLUE}\n"


printf "${GREEN}\n"



#Installing Go-Language

if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

                                        echo "Installing Golang"
                                        wget https://dl.google.com/go/https://golang.org/dl/go1.17.3.linux-amd64.tar.gz  
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


echo "Installing Subfinder"

if [ ! -e /root/go/bin/subfinder ];then
          go get -u github.com/projectdiscovery/subfinder/v2/cmd/subfinder

        ln -sfv /root/go/bin/./subfinder /usr/bin/sunfinder
else
        echo "subfinder is already Installed"
fi


#Installing httprobe
echo "Installing httprobe"
if [ ! -e /usr/bin/httprobe ];then
        go get -u github.com/tomnomnom/httprobe
        ln -sfv /root/go/bin/./httprobe /usr/bin/httprobe
else
        echo "Httprobe is already installed"
fi

#Installing asserfinder
echo "Installing assetfinder"
if [ ! -e /root/go/bin/assetfinder ];then
        go get -u github.com/tomnomnom/assetfinder
        ln -sfv /root/go/bin/./assetfinder /usr/bin/assetfinder
else
        echo "Assetfinder is already Installed"
fi


#Installing AMASS
if [ ! -e /usr/bin/amass ];then
        go get -v github.com/OWASP/Amass/v3/...
else
        echo "Amass is already installed"
fi

#Installing Dalfox
echo "Installing Dalfox"
if [ ! -e /root/go/bin/assetfinder ];then
         go get -u github.com/hahwul/dalfox

        ln -sfv /root/go/bin/./dalfox /usr/bin/dalfox
else
        echo "Dalfox is already Installed"
fi

#Installing GAU
echo "Installing gau"
if [ ! -e /root/go/bin/gau ];then
          go get -u  github.com/lc/gau

        ln -sfv /root/go/bin/./gau /usr/bin/gau
else
        echo "GAU is already Installed"
fi





