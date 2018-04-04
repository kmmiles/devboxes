#!/bin/bash

sudo yum install cockpit -y
sudo systemctl enable --now cockpit.socket
#sudo firewall-cmd --add-service=cockpit
#sudo firewall-cmd --add-service=cockpit --permanent
