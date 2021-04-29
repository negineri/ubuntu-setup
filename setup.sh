#!/bin/sh

if [ $# -le 1 ]; then
  echo "require target ip" 1>&2
  exit 1
fi

if [ $# -ge 1 ]; then readonly TARGET_HOST=$1; fi
if [ $# -ge 2 ]; then readonly BECOME_USER=$2; fi
if [ $# -ge 3 ]; then readonly BECOME_PASSWORD=$3; fi
if [ $# -ge 3 ]; then readonly SSH_PASSWORD=$4; fi

if [ $# -eq 3 ]; then
ansible-playbook setup.yml -i $TARGET_HOST, -u $BECOME_USER -e ansible_become_pass=$BECOME_PASSWORD
fi
if [ $# -eq 4 ]; then
ansible-playbook setup.yml -i $TARGET_HOST, -u $BECOME_USER -e ansible_become_pass=$BECOME_PASSWORD -e ansible_ssh_pass=$SSH_PASSWORD
fi
