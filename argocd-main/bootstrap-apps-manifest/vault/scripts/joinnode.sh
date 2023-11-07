#!/bin/bash

VAULT_POD_NAME="vault"
NAMESPACE=vault
for  (( i=0; i<=1; i++ ))
  do
    kubectl exec -ti $VAULT_POD_NAME-$i -n $NAMESPACE -- vault operator raft join http://$VAULT_POD_NAME-2.$VAULT_POD_NAME-internal:8200
  done
