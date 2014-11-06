#!/bin/sh -ex

rm -rf /tmp/*

zypper install -y cloud-init
systemctl enable cloud-config
systemctl enable cloud-final
systemctl enable cloud-init-local
systemctl enable cloud-init
sync
fstrim  -v /
nohup systemctl stop wicked.service &
systemctl poweroff


