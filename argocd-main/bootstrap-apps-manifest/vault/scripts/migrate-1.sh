#!/bin/bash

set -e

MIGRATE_CONFIG_FILE=migrate.hcl
RAFT_OUTPUT=raft-data
FILE_STORAGE_PATH=/vault/data
NAMESPACE=vault
VAULT_A_POD_NAME=vault-0
VAULT_B_POD_NAME=vault-raft-0
VAULT_B_INTERNAL_SVC=vault-raft

# Create `migrate.hcl`
if [ ! -f "${MIGRATE_CONFIG_FILE}" ]; then
  cat <<EOF >> ${MIGRATE_CONFIG_FILE}
storage_source "file" {
  path = "${FILE_STORAGE_PATH}"
}

storage_destination "raft" {
  path = "/tmp/${RAFT_OUTPUT}"
}

cluster_addr="https://${VAULT_B_POD_NAME}.${VAULT_B_INTERNAL_SVC}:8201"
EOF

echo "${MIGRATE_CONFIG_FILE} created!"
fi

# Push config to Vault A
echo "Pushing migration config file..."
kubectl cp $MIGRATE_CONFIG_FILE ${NAMESPACE}/${VAULT_A_POD_NAME}:/tmp
echo "Migration config file pushed!"

# Run migrate command
kubectl exec -it $VAULT_A_POD_NAME -- mkdir -p /tmp/${RAFT_OUTPUT}
echo "Raft output directory created!"
echo "Migrating ..."
kubectl exec -it $VAULT_A_POD_NAME -- vault operator migrate -config=/tmp/${MIGRATE_CONFIG_FILE}
echo "Migrate success!"

# Download Raft data to local
echo "Migration data downloading..."
kubectl cp ${NAMESPACE}/${VAULT_A_POD_NAME}:/tmp/${RAFT_OUTPUT} $RAFT_OUTPUT
echo "Download success!"

set +e