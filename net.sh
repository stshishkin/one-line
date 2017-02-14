#return ip of default route interface
ip addr show dev $(ip route get 8.8.8.8 | grep -Po '(?<=dev )[^ ]+') | grep -Po '(?<=inet )[^/ ]+'
#return public ip if available
if ping -c 1 ns2.google.com &> /dev/null ; then \
echo $(dig TXT +short o-o.myaddr.l.google.com @ns2.google.com | sed "s/\"//g" ); \
else echo offline; fi
