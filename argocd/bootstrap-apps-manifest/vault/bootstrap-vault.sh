#!/bin/bash

## Configuration ##
VAULT_NS=vault
VAULT_STS_NAME=vault
SECRET_FILE=secrets.txt

echo "## Initializing vault..."
# kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault operator init > $SECRET_FILE

echo "## Retrieving unseal key"
if [ -f "$SECRET_FILE" ]; then
  UNSEAL_KEYS=(
  $(awk '/Unseal Key 1:/ {print $NF}' $SECRET_FILE)
  $(awk '/Unseal Key 2:/ {print $NF}' $SECRET_FILE)
  $(awk '/Unseal Key 3:/ {print $NF}' $SECRET_FILE)
  )
  ROOT_TOKEN=$(awk '/Initial Root Token:/ {print $NF}' $SECRET_FILE)
else
  echo -e "\e[31mFile $SECRET_FILE not found.\e[0m"
  exit 1
fi

echo "## Unsealing vault..."
# for UNSEAL_KEY in ${UNSEAL_KEYS[@]}; do
#   kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault operator unseal $UNSEAL_KEY
# done

KUBERNETES_CA=$(kubectl config view --raw -o jsonpath='{.clusters[0].cluster.certificate-authority-data}' |base64  -d)
KUBERNETES_TOKEN=$(kubectl create token vault -n vault --duration=8760h) # 1 year

echo "## Enabled Kubernetes auth method"
# kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault login $ROOT_TOKEN
# kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault auth enable kubernetes
# kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault write auth/kubernetes/config \
#     token_reviewer_jwt="$KUBERNETES_TOKEN" \
#     kubernetes_host=https://kubernetes.default.svc.cluster.local \
#     kubernetes_ca_cert="$KUBERNETES_CA"

echo "## Enabled KV secret engine"
# kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault secrets enable -path=secrets kv-v2

SECRET_PATH=projects/galaxy-landing/regcred
ROLE_NAME=galaxy-landing-regcred-ro
SERVICE_ACCOUNT=external-secrets,galaxy-landing-dev,galaxy-landing
NAMESPACE=external-secrets,galaxy-landing-dev,galaxy-landing
POLICY_NAME=$ROLE_NAME

# CREATE POLICY
echo "Creating policy:"
POLICY=$(cat <<EOF
path "secrets/data/${SECRET_PATH}" {
  capabilities = ["read"]
}
EOF
)
# kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- /bin/sh -c "echo '${POLICY}' | vault policy write $POLICY_NAME -"

# CREATE ROLE
echo "Creating role:"
kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault write auth/kubernetes/role/${ROLE_NAME} \
  bound_service_account_names=$SERVICE_ACCOUNT \
  bound_service_account_namespaces=$NAMESPACE \
  policies=$POLICY_NAME \
  ttl=1h
