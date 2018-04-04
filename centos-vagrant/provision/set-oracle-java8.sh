#!/bin/bash

sudo /usr/sbin/alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_151/bin/java 20000
echo 3 | sudo /usr/sbin/alternatives --config java
