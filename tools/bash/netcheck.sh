#!/bin/bash

cat << 'EOF'
# # # # # # # # # # # # # # #
#                           #
#         Netcheck          #
# Developed by betaneutrino #
#                           #
# # # # # # # # # # # # # # #
EOF

echo -e "Echo, Choose usual server(google)?(y/n) \n"
read -p "" option

if [[ $option == y ]]; then
    while true; do
        if ping -c 1 google.com &>/dev/null; then
            echo "Stable ping from server 'google.com' detected, Aborting with code 0"
            exit 0
        else
            echo "No ping from server 'google.com' detected"
        fi
        sleep 1
    done
elif [[ $option == n ]]; then
    echo -e "Enter the server you wanna ping repeatedly \n For example site.com"
    read -p "" server
    while true; do
        if ping -c 1 $server &>/dev/null; then
            echo "Stable ping from server '$server' detected, Aborting with code 0"
            exit 0
        else
            echo "No ping from server '$server' detected"
        fi
        sleep 1
    done
else
    echo "Invalid option, Try again"
    exit 0
fi
