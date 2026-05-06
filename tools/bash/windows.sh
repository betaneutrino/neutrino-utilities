#!/bin/bash
cat << 'EOF'
# # # # # # # # # # # # # # #
#                           #
#           WinRB           #
#  Reboot to Windows 10/11  #
#         UEFI Only         #
# Developed by Betaneutrino #
#                           #
# # # # # # # # # # # # # # #
EOF

echo -e "Are you sure you want to continue ?(y/n)\n"
read -p "" confirm

if [[ $confirm == y ]]; then
    win_bootnum=$(efibootmgr | grep -i "windows boot manager" | head -n1 | grep -o 'Boot[0-9A-F]\{4\}' | sed 's/Boot//')
    if [ -z "$win_bootnum" ]; then
        echo "Windows Boot Manager entry not found."
        exit 1
    fi
    sudo efibootmgr -n "$win_bootnum"
    sudo reboot
elif [[ $confirm == n ]]; then
    echo "Abort."
    exit 0
else
    echo "Wrong choice!"
fi
