#! /bin/bash
PAGER=""
r=$(gh search repos --visibility internal --match name $1)
echo -n "REPO: $1 -> github_repo: $r"
echo
