alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias agu='apt-get update'
alias agup='apt-get upgrade'
alias agi='apt-get install'
alias acs='apt-cache search'

alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"
alias dl="docker logs -ft --tail=100"
# Remove all containers
drm() { docker rm $(docker ps -a -q); }
# Remove all images
dri() { docker rmi $(docker images -q); }
# Sh into running container
dsh() { docker exec -it $(docker ps -aqf "name=$1") sh; }
# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }
