#!/bin/bash
mosh $1 -- sh -c "tmux a || tmux new"
if [[ $? != "0" ]]; then 
	ssh -t $1 "tmux a || tmux new"
fi
