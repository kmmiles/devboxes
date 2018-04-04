#!/bin/bash

# add elrepo repository
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm 

# remove old kernel headers and tools
sudo yum -y remove kernel-headers kernel-tools kernel-tools-libs

# install new kernel, kernel headers, and tools
sudo yum -y --enablerepo=elrepo-kernel install kernel-ml kernel-ml-devel kernel-ml-headers kernel-ml-tools kernel-ml-tools-libs

# set grub to boot new kernel by default
sudo grub2-set-default 0
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
