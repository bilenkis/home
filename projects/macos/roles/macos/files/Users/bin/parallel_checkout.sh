#!/bin/bash
cd $1
git checkout master || true
git checkout main || true
git fetch --all --prune --jobs=10
git pull --verbose --rebase --prune --autostash --tags
cd -
