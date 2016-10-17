#return ip of default route interface
ip addr show dev $(ip route get 8.8.8.8 | grep -Po '(?<=dev )[^ ]+') | grep -Po '(?<=inet )[^/ ]+'
