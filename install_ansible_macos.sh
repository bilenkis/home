#!/bin/bash
set -xe
xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install python3 virtualenv pyenv
curl -Lo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
python3 /tmp/get-pip.py
rm /tmp/get-pip.py
pyenv virtualenv 3.7.5 main
pyenv activate main
pip3 install --upgrade pip3
pip3 install -r requirements.txt
git submodule update
