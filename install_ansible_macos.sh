#!/bin/bash
curl -sLo /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
sudo -H python /tmp/get-pip.py
sudo -H pip install --upgrade ansible=="2.2.1.0"
rm /tmp/get-pip.py

