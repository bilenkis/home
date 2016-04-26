#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

bak=`find conf/ -type f | sed s";^conf/;$HOME/;g"`

# do backup
for i in $bak; do
    mv $i{,.bak}
done
# vim backup
mv $HOME/.vim{,.bak}
mkdir -p $HOME/.vim/autoload
mv $HOME/.zsh{,.bak}
mkdir -p $HOME/.zsh/completion

# create links to new config
for i in `find conf/ -type f`; do
     src=`pwd`/$i
     dst=`echo "$i" | sed s";^conf/;$HOME/;g"`
     ln -s $src $dst
done
