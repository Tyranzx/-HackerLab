#!/bin/bash

function pythonS3()
{
sudo apt-get upgrade -y
wget https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tgz
tar xvf Python-3.6.4.tgz
cd Python-3.6.4
./configure --enable-optimizations
make -j8
sudo make altinstall
}
pythonS3
# Try it then.
