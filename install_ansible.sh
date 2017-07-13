#!/bin/bash
apt-get update
apt-get install -y python-pip python-setuptools libssl-dev python-dev
pip install --upgrade pip
pip install --upgrade ansible=="2.2.1.0"
