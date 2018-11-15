#!/bin/bash

if [[ -z $1 ]]; then
    echo "Usage: $0 path/to/hosts"
    exit 1
fi

grep ansible_host $1 \
  | grep -v ';' \
  | awk '{print "host", $1, "\nhostname", $2, "\n"}' \
  | sed 's/ansible_host=//' > ~/.ssh/config.d/ansible_hosts
