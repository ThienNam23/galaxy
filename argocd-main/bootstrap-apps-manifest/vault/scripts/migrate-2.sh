#!/bin/bash

set -e

DATA_PATH=/vault/data
RAFT_DATA_PATH=raft-data
NAMESPACE=vault-raft
VAULT_B_POD_NAME=vault-raft-0

echo "Pushing vault.db..."
kubectl cp ${RAFT_DATA_PATH}/vault.db ${NAMESPACE}/${VAULT_B_POD_NAME}:${DATA_PATH}
echo "vault.db pushed!"
echo "Pushing raft..."
kubectl cp ${RAFT_DATA_PATH}/raft ${NAMESPACE}/${VAULT_B_POD_NAME}:${DATA_PATH}
echo "raft pushed!"
echo "Pushing node-id..."
kubectl cp ${RAFT_DATA_PATH}/node-id ${NAMESPACE}/${VAULT_B_POD_NAME}:${DATA_PATH}
echo "node-id pushed!"

set +e