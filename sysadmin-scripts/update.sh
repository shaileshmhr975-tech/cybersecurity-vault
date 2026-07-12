#!/bin/bash

release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_errors.log

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo "An error occured, please check the $errorlog file."
    fi
}

if grep -q "Arch" $release_file
then
    # The hose is based on Arch,run the pacman update command
    sudo pacman -Syu 1>>$logfile 2>>$errorlog
    check_exit_status

elif grep -q "Pop" "$release_file" || grep -q "Ubuntu" "$release_file" || grep -q "Kali" "$release_file" || grep -q "Debian" "$release_file"
then
    # The host is based on Ubuntu/Debian/Kali
    # Run the apt version of the command.
    sudo apt update 1>>$logfile 2>>$errorlog
    check_exit_status

    sudo apt dist-upgrade -y 1>>$logfile 2>>$errorlog
    check_exit_status

else
    echo "Unsupported distribution."
fi
