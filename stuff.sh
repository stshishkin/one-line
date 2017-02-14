#generate a long random characters string 
echo $(cat /dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c32)
