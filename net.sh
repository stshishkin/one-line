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
