#!/bin/bash
set -xe
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python
curl -Lo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
python /tmp/get-pip.py
rm /tmp/get-pip.py
pip install --upgrade ansible=="2.6.4"
git submodule init
git submodule update
