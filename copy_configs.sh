#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

function make_backup_dir {
    # create backup directory if not exists
    if [[ ! -d $HOME/.bak ]] ; then
        mkdir $HOME/.bak
    fi
}

make_backup_dir
rsync -a --backup --backup-dir=$HOME/.bak conf/ $HOME/

echo "Your old files in ~/.bak"
