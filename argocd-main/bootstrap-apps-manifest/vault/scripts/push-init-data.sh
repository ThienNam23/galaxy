#!/bin/bash

DATA_PATH=/tmp
NAMESPACE=
VAULT_POD_NAME=

echo "Pushing init data script..."
kubectl cp init-data.sh ${NAMESPACE}/${VAULT_POD_NAME}:${DATA_PATH}
echo "init data script pushed!"