#generate a long random characters string 
echo $(cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c32)

#Linux Network Troubleshooting script
echo -en '\n'
echo -en '\n'
echo "Linux: Network Troubleshooting Script"
echo "-------------------------------------"
echo -en '\n'
options=("Ping Google" "Ping IP or URL" "Display ARP" "Find your IP address" "Find your external IP address" "Display network services" "Traceroute" "Flush DNS" "Renew IP Address" "Quit")
select option in "${options[@]}"
do
echo -en '\n'
case $option in
"Ping Google" )
ping -w 4 8.8.8.8
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Ping IP or URL" )
echo "Enter IP address or URL"
read target
ping -w 4 $target
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Display ARP" )
arp -a
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Find your IP address" )
ifconfig | grep inet
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Find your external IP address" )
dig +short myip.opendns.com @resolver1.opendns.com
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Display network services" )
lspci | egrep -i --color 'network|ethernet'
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Traceroute" )
echo "Enter IP address or URL"
read target
traceroute $target
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Flush DNS" )
sudo service dns-clean restart
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Renew IP Address" )
sudo dhclient -r
echo -en '\n'
echo "The command completed successfully."
read -n1 -r -p "Press any key to continue..." key
clear
;;
"Quit" )
break
;;
*)
break
;;
esac
REPLY=
done
