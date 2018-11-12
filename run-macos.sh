#!/bin/bash
ansible-playbook -i localhost -K macos.yml
ansible-playbook -i localhost projects/dotfiles/dotfiles.yml
