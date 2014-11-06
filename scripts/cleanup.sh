#!/bin/sh -ex

rm -rf /tmp/*

zypper install -y cloud-init
systemctl enable cloud-config
systemctl enable cloud-final
systemctl enable cloud-init-local
systemctl enable cloud-init

sed -i '/.*SmartOS.*/d' /usr/lib/python2.7/site-packages/cloudinit/settings.py
sync
fstrim  -v /
nohup systemctl stop wicked.service &
systemctl poweroff


