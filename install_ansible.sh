#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

apt-get update -y && apt-get upgrade  -y
apt-get install -y \
	ansible
