#!/usr/bin/env bash

function batch {
    echo "NODE:" $1
    ssh $1 "sudo apt-get update ; apt-get upgrade -y ; apt-get dist-upgrade -y ; apt-get autoremove -y ; reboot now"
}

for NODE in {0..185}
do
    if [ ${NODE} -lt 10 ]; then
        batch 00${NODE}
    elif [ ${NODE} -lt 100 ]; then
        batch 0${NODE}
    else
        batch ${NODE}
    fi
    # sleep 10s
done

