#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

aptitude update -qq && aptitude upgrade -qq
aptitude install -qq \
    vim \
    zsh \
    openbox \
    tint2 \
    keepassx

sh copy_configs.sh
