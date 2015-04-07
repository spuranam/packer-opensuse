#!/bin/sh -ex

rm -rf /tmp/*

sync
fstrim  -v /
nohup systemctl stop wicked.service &
systemctl poweroff


