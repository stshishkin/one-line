#!/bin/bash

#collection useful conveyor with `find`

#there are two folders with identical files. but in one of them rights were broken accidentally.
cd ./one && find . -exec chmod --reference=../two/{} {} \;

#find files and folders withour write permission for group and add this bit (yep, I know about chmod -R :)
find . ! -perm -g+w -exec chmod g+w {} \;

# recursive find
#when you need to find differences between files in two directories and extract these changes to the third directory for analysis:
mkdir -p ./diff && cd ./one && find . -type f -exec sh -c 'if [[ ! -e "$(dirname ./diff/$0)" ]]; then mkdir -p $(dirname ./diff/$0); fi; diff -y --suppress-common-lines $0 ./two/$0 > ./diff/$0' {} \;

#in according our backup reglament there are such files must be provided:
#everyday for the last 7 days
#for each monday for the last month
#for each monday of every odd week for the last 3 month
#
#folowing 2 finds deletes backups which excludes this logic:

find $DEST -maxdepth 1 -type f -name \*.dump.gz \( -atime 7 -o \( -atime +7 -a -atime -30 \) \)\ 
-exec bash -c 'if [[ "$(date "+%u" --date="$(stat -c%x $0)")" != 1 ]]; then rm $0; fi' {} \;
find $DEST -maxdepth 1 -type f -name \*.dump.gz \( -atime 30 -o \( -atime +30 -a -atime -90 \)\ 
-o -atime 90 \)\ 
-exec bash -c\ 
'if [[ $(($(date "+%W" --date="$(stat -c%x $0)") % 2)) != 0 || "$(date "+%u" --date="$(stat -c%x $0)")" != 1 ]]; then rm $0; fi' {} \; 
