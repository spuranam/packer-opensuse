#!/bin/sh -ex

zypper refresh
zypper --non-interactive update --auto-agree-with-licenses --force-resolution
