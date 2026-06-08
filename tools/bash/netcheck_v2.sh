#!/bin/bash
cat << 'EOF'
# # # # # # # # # # # # # # #
#                           #
#       Netcheck v2         #
# Developed by betaneutrino #
# ========================= #
# Use it to monitor network #
# availability and test     #
# internet connectivity.    #
#                           #
# # # # # # # # # # # # # # #
EOF

echo -n "Choose default server(google.com)? [y/n] "
read option

if [[ $option == y  ]]; then
	while true; do 
		if ping -c 1 google.com &>/dev/null; then
			echo "Server reachable."
			exit 0
		else
			echo "Server unreachable, trying again."
		fi
		sleep 1
	done
elif [[ $option == n  ]]; then
	echo -n "Choose your server: "
	read server 
	  while true; do
                if ping -c 1 "$server" &>/dev/null; then
                        echo "Server reachable."
                        exit 0
                else
                        echo "Server unreachable, trying again."
                fi
                sleep 1
        done

else "Invalid option, choose either y or n."	
fi 
