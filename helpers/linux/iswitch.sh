#!/bin/bash
E_NOTROOT=87

if ! $(sudo -l &>/dev/null); then
    echo 'Error: You must be root to perform this action.'
    exit $E_NOTROOT
fi

pushd /etc/ >> /dev/null
sudo ./iswitch $1
popd >> /dev/null
