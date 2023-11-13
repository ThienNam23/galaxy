#!/bin/bash

playbook=install_rke2.yaml
inventory=inventory/hosts.yaml
ansible-playbook -i $inventory $playbook
