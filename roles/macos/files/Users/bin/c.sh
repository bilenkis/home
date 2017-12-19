#!/bin/bash
if [[ -z $1 ]]; then
	echo "Usage: $0 hostname"
	exit 1
fi
mosh $1 -- sh -c "tmux a || tmux new"
if [[ $? != "0" ]]; then 
	ssh -t $1 "tmux a || tmux new" || ssh -t $1
fi
