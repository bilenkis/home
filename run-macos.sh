#!/bin/bash
ansible-playbook -i localhost -K projects/macos/macos.yml
ansible-playbook -i localhost projects/dotfiles/dotfiles.yml
