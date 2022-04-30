#!/bin/bash

QTR=21wi
MININET_VERSION="2.3.1b1"
POX_VERSION=fangtooth

sudo apt-get update
sudo apt-get install -y python2 python-is-python2 unzip net-tools
git clone https://github.com/mininet/mininet
(cd mininet && git checkout $MININET_VERSION)
sed -i 's/cgroup-bin/cgroup-tools/g' mininet/util/install.sh
sudo PYTHON=python2 mininet/util/install.sh -nfvp
(cd pox && sudo git checkout $POX_VERSION)
wget https://courses.cs.washington.edu/courses/cse461/$QTR/assignments/project2/project2.zip
unzip project2.zip
sudo ln -s ~/461_mininet/pox/* ~/pox/pox/misc/
