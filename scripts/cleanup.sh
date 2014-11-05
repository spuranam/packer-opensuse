#!/bin/sh -ex

rm -rf /tmp/*

fstrim -a -v
