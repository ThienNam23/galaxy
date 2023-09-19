#!/bin/bash

playbook=add_user_and_key.yaml
inventory=inventory/hosts.yaml
ansible-playbook -i $inventory $playbook
