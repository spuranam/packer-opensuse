#!/bin/sh -ex
nohup /bin/sh -c 'sleep 3s; systemctl stop wicked.service;' &
nohup /bin/sh -c 'sleep 3s; reboot;' &

