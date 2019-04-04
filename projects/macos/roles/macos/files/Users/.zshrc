# If you come from bash you might have to change your $PATH.
  export PATH=$HOME/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/sbin:/usr/local/opt:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/Users/bilen/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# theme: powerlevel9k
  ZSH_THEME="powerlevel9k/powerlevel9k"
  POWERLEVEL9K_DISABLE_RPROMPT=true
  POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator kube_ps1 dir virtualenv vcs )
  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator kube_ps1 virtualenv dir vcs)
# kube-ps1 fix for powerlevel9k
  source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
  prompt_kube_ps1(){
     echo -n `kube_ps1`
  }
# To avoid VirtualEnvs activate command from interfering with Powerlevel9k
  VIRTUAL_ENV_DISABLE_PROMPT=1

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
  HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
  DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
  ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# plugin: fzf
  export FZF_BASE=~/.fzf
  export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*'"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_FIND_FILE_COMMAND="$FZF_DEFAULT_COMMAND"

# plugin: ssh-agent
# zstyle :omz:plugins:ssh-agent identities id_rsa id_rsa2 id_github
  zstyle :omz:plugins:ssh-agent agent-forwarding on

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
git
fzf
gnu-utils
ansible
kubectl
helm
kube-ps1
docker
docker-compose
ssh-agent
colored-man-pages
extract
zsh-dircolors-solarized
pip
tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

REPORTTIME=60

## FZF
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
## --files: List files that would be searched but do not search
## --no-ignore: Do not respect .gitignore, etc...
## --hidden: Search hidden files and folders
## --follow: Follow symlinks
## --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#
#if [ -r ~/.zshrc -a -r ~/.zshrc.global -a ! -r ~/.zshrc.local ] ; then
#    printf '-!-\n'
#    printf '-!- Looks like you are using the old zshrc layout of grml.\n'
#    printf '-!- Please read the notes in the grml-zsh-refcard, being'
#    printf '-!- available at: http://grml.org/zsh/\n'
#    printf '-!-\n'
#    printf '-!- If you just want to get rid of this warning message execute:\n'
#    printf '-!-        touch ~/.zshrc.local\n'
#    printf '-!-\n'
#fi

## ZLE tweaks ##
## use the vi navigation keys (hjkl) besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char        # left
bindkey -M menuselect 'k' vi-up-line-or-history   # up
bindkey -M menuselect 'l' vi-forward-char         # right
bindkey -M menuselect 'j' vi-down-line-or-history # bottom

# set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# activate main virtualenv
source ~/.venv/main/bin/activate

# docker aliases
alias dps="docker ps"
alias dpa="docker ps -a"
alias di="docker images"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
alias dex="docker exec -i -t"
alias drun="docker run --rm -i -t"
alias dl="docker logs -ft --tail=100"
# Remove all containers
drm() { docker rm $(docker ps -a -q); }
# Remove all images
dri() { docker rmi $(docker images -q); }
# Sh into running container
dsh() { docker exec -it "$1" /bin/sh; }
# Bash into running container
dbash() { docker exec -it "$1" /bin/bash; }
dins() { docker inspect "$1" | less; }

# personal git aliases
alias gs='gst'
alias gp='ggpush'
alias gh='glods'
alias gcb='git checkout --track -b'
alias gpf='git push --force origin $(git_current_branch)'
alias gup='git pull --verbose --rebase --prune --autostash origin "$(git_current_branch)"'

# personal aliases
alias c='~/bin/c.sh'
alias ssh='ssh -t'
alias atop='atop -a -c -A 3'
alias ncmpcpp='ncmpcpp -b ~/.config/ncmpcpp/bindings'
alias rg='rg --no-ignore --hidden --follow --glob "!.git/*"'
alias rsync='rsync -avz --progress -h'
alias rsync-sudo='rsync -avz --progress -h --rsync-path="sudo rsync"'
alias kcuc='kubectx'
alias kns='kubens'
alias ht="helm template . --set 'global.cluster=lw,global.env=test'"
alias test='nocorrect test'

# plugin: zsh-dircolors-solarized
export DIRCOLORTHEME='dircolors.256dark'
