#return ip of default route interface
ip addr show dev $(ip route get 8.8.8.8 | grep -Po '(?<=dev )[^ ]+') | grep -Po '(?<=inet )[^/ ]+'
#return public ip if available
if ping -c 1 ns2.google.com &> /dev/null ; then \
echo $(dig TXT +short o-o.myaddr.l.google.com @ns2.google.com | sed "s/\"//g" ); \
else echo offline; fi
#test connect to specified host and exit when it gets online 
function online (){
     if [[ -z $1 ]]; then
         test_host=8.8.8.8
     else
         test_host=$1
     fi
     while true
          do
              ping -c 1 $test_host &> /dev/null 2>&1
              if [[ $? -eq 0 ]]; then
                  echo online;
                  break
              fi
          done
}

#setup ppp-tunnel through ssh-session and route whole traffic from server through client host in one command
pppd pty 'ssh -x -t -e none root@10.8.10.105 /usr/sbin/pppd passive noauth 9600 defaultroute' nodetach noauth 10.0.0.1:10.0.0.2

#find ripe netname by IP
curl -s "http://rest.db.ripe.net/search?source=ripe&query-string=87.240.182.224" | xmlstarlet sel -t -c 'string(//*[@name="netname"]/@value)'
