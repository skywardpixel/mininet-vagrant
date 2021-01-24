#!/bin/bash

QTR=21wi
MININET_VERSION="2.3.0d6"
POX_VERSION=fangtooth

sudo apt-get update
sudo apt-get install -y python2 python-is-python2 unzip net-tools
git clone https://github.com/mininet/mininet
(cd mininet && git checkout $MININET_VERSION)
sed -i 's/cgroup-bin/cgroup-tools/g' mininet/util/install.sh
mininet/util/install.sh -nfvp
(cd pox && git checkout $POX_VERSION)
wget https://courses.cs.washington.edu/courses/cse461/$QTR/assignments/project2/project2.zip
unzip project2.zip
ln -s ~/461_mininet/pox/* ~/pox/pox/misc/

