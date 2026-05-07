#!/bin/bash
echo -e "Do you want to install all the tools present in Neutrino Utilities? (y(es)/n(o))\n"
read -p "" choice
if [[ $choice == y ]]; then
    mkdir -p /opt/clss/ #clss stands for Command Line Software Stuff - Idk why its that, but i chose it when i first made the folder lol
    mv *.sh /opt/clss/
    cd /opt/clss/ && chmod +x *.sh
    echo "alias netcheck='/opt/clss/netcheck.sh'" >> $HOME/.bashrc
    echo "alias winrb='/opt/clss/windows.sh'" >> $HOME/.bashrc
    # echo "alias aliasname='./opt/clss/script.sh'" >> $HOME/.bashrc
    echo "🛈 All done, The scripts are kept on /opt/clss for your information."
    exit 0
elif [[ $choice == n ]]; then
    echo "Abort"
    exit 1
else
    echo "Wrong choice, choose y or n"
fi
