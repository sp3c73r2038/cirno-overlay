#!/bin/bash

[[ -z "`command -v layman`" ]] && echo "please emerge layman first" && exit 1

[[ $UID != 0 ]] && echo "please run this script use root" && exit 1

if [[ -d "/etc/layman/overlays" ]]; then
  wget "https://raw.github.com/aleiphoenix/cirno-overlay/master/cirno.xml" -O /etc/layman/overlays/cirno.xml
  echo "cirno overlay installed! If you use eix, please now run eix-update :)"
fi
