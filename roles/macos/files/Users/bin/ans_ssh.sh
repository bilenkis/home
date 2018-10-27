#!/bin/bash

grep ansible_host ~/src/hosts \
  | grep -v ';' \
  | awk '{print "host", $1, "\nhostname", $2, "\n"}' \
  | sed 's/ansible_host=//' > ~/.ssh/config.d/additional_hosts
