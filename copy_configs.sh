#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

mkdir $HOME/.bak 2>&1 > /dev/null
rsync -a --backup --backup-dir=$HOME/.bak conf/ $HOME/

echo "Your old files in ~/.bak"
