#!/bin/bash

VAULT_NS=vault
VAULT_STS_NAME=vault
SECRET_PATH=projects/galaxy-landing/regcred
REGISTRY='<your-registry-url>'
REGISTRY_USER='<your-registry-user>'
REGISTRY_PASSWORD='<your-registry-password>'
SECRET_DATA=$(echo "{\"auths\":{\"${REGISTRY}\":{\"auth\":\"$(printf "%s:%s" "${REGISTRY_USER}" "${REGISTRY_PASSWORD}" | base64 | tr -d '\n')\"}}}")

# CREATE SECRET
echo "Creating secret:"
kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault kv put secrets/${SECRET_PATH} dockerconfigjson=$SECRET_DATA
