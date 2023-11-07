#!/bin/bash

DATA_PATH=/vault/data
RAFT_DATA_PATH=raft-data
VAULT_POD_NAME="vault-raft"
REPLICAS=3
DATA_FILE="vault.db raft node-id"
NAMESPACE=vault-raft
VAULT_B_POD_NAME=vault-raft-0
for  (( i=0; i<=2; i++ ))
  do
    for FILE in $DATA_FILE
      do
        kubectl exec -ti $VAULT_POD_NAME-$i -- rm -rf ${DATA_PATH}/$FILE
      done
  done
