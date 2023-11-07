#!/bin/bash

set -e

VAULT_ADDR=
MINIO_ALIAS=
MINIO_URL=
MINIO_ACCESS_KEY=
MINIO_SECRET_KEY=
MINIO_BUCKET=
NAMESPACE=
VAULT_BACKUP_ROLE_NAME=vault-backup
VAULT_BACKUP_SECRET_NAME=vault-backup
VAULT_BACKUP_RO=vault-backup-ro
SA_NAME=vault-backup

vault login -no-print

vault policy write $VAULT_BACKUP_ROLE_NAME - <<EOF
path "sys/storage/raft/snapshot" {
  capabilities = ["read"]
}
EOF

vault write auth/token/roles/${VAULT_BACKUP_ROLE_NAME} \
	allowed_policies="${VAULT_BACKUP_ROLE_NAME}" \
	orphan=true \
	period=365d

vault policy write $VAULT_BACKUP_RO - <<EOF
path "secret/data/${VAULT_BACKUP_SECRET_NAME}" {
  capabilities = ["read"]
}

path "secret/metadata/${VAULT_BACKUP_SECRET_NAME}" {
  capabilities = ["list"]
}
EOF

vault auth enable kubernetes

vault write auth/kubernetes/config \
	token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
	kubernetes_host=https://${KUBERNETES_PORT_443_TCP_ADDR}:443 \
	kubernetes_ca_cert=@/var/run/secrets/kubernetes.io/serviceaccount/ca.crt

vault write auth/kubernetes/role/${VAULT_BACKUP_RO} \
	bound_service_account_names=${SA_NAME} \
	bound_service_account_namespaces=${NAMESPACE} \
	policies=${VAULT_BACKUP_RO} \
	ttl=24h

vault token create -role=${VAULT_BACKUP_ROLE_NAME}

read -s -p "Enter vault backup token (will be hidden): " VAULT_BACKUP_TOKEN

vault secrets enable -path=secret kv-v2

vault kv put /secret/${VAULT_BACKUP_SECRET_NAME} \
	master_pass="${VAULT_BACKUP_TOKEN}" \
	vault_addr="${VAULT_ADDR}" \
	minio_alias="${MINIO_ALIAS}" \
	minio_url="${MINIO_URL}" \
	minio_access_key="${MINIO_ACCESS_KEY}" \
	minio_secret_key="${MINIO_SECRET_KEY}" \
	minio_bucket="${MINIO_BUCKET}"
set +e