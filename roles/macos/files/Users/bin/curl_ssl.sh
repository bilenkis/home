#!/bin/sh
if [[ -n $1 ]] && [[ -n $2 ]]; then
  if [[ -n $3 ]]; then
  	curl -XGET --resolve "$1:80:$2" --resolve "$1:443:$2" -A 'devops-bilen' -LIv https://$1$3
  else
  	curl -XGET --resolve "$1:80:$2" --resolve "$1:443:$2" -A 'devops-bilen' -LIv https://$1
  fi
else
	echo "Usage: domain ip [path]"
fi
