#!/bin/sh -ex

rm -rf /tmp/*

sync
fstrim  -v /
