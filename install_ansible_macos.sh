#!/bin/bash
set -xe

PYTHON_VERSION="3.11.3"

#xcode-select --install
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#brew install zsh pyenv pyenv-virtualenv
#pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

curl -Lo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
python3 /tmp/get-pip.py
rm /tmp/get-pip.py

pyenv virtualenv $PYTHON_VERSION main
pyenv activate main
pip3 install --upgrade pip3
pip3 install -r requirements.txt
git submodule update
