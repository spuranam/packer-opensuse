#!/bin/sh -ex

rm -f /etc/zypp/repos.d/openSUSE-13.2-0.repo /etc/zypp/repos.d/http-mirror*

rpm --import http://download.opensuse.org/distribution/13.2/repo/oss/gpg-pubkey-3dbdc284-53674dd4.asc
rpm --import http://download.opensuse.org/distribution/13.2/repo/oss/gpg-pubkey-307e3d54-4be01a65.asc
zypper ar http://download.opensuse.org/distribution/13.2/repo/oss/ opensuse-13.2-oss
zypper ar http://download.opensuse.org/distribution/13.2/repo/non-oss/ opensuse-13.2-non-oss
zypper ar -t rpm-md -c -n opensuse-13.2-update -g -f http://download.opensuse.org/update/13.2/ opensuse-13.2-update
zypper ar -t rpm-md -c -n opensuse-13.2-update-non-oss  -g -f http://download.opensuse.org/update/13.2-non-oss/ opensuse-13.2-update-non-oss
zypper refresh
zypper update -y --auto-agree-with-licenses --force-resolution
systemctl enable sshd
systemctl enable wicked
echo "UseDNS no" >> /etc/ssh/sshd_config
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config
