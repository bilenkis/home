#!/bin/bash
set -xe
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python3 virtualenv
curl -Lo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
python3 /tmp/get-pip.py
rm /tmp/get-pip.py
python3 -m venv ~/.venv/main
source ~/.venv/main/bin/activate
pip3 install --upgrade pip3
pip3 install -r requirements.txt
git submodule init
git submodule update
