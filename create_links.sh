#!/bin/bash
PATH=/usr/local/bin:/usr/bin:/bin

bak=`find conf/ -type f | sed s";^conf/;$HOME/;g"`

# do backup
for i in $bak; do
    mv $i{,.bak}
done
mv $HOME/.vim{,.bak}

for i in `find conf/ -type f`; do
     src=`pwd`/$i
     dst=`echo "$i" | sed s";^conf/;$HOME/;g"`
     ln -s $src $dst
done
ln -s `pwd`/conf/.vim $HOME/.vim
