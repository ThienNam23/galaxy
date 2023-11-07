#!/bin/bash

## Configuration ##
VAULT_NS=intern
VAULT_STS_NAME=vault-raft
SECRET_FILE=secrets.txt

echo "## Initializing vault..."
kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault operator init > $SECRET_FILE

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
for UNSEAL_KEY in ${UNSEAL_KEYS[@]}; do
  kubectl exec -n $VAULT_NS $VAULT_STS_NAME-0 -- vault operator unseal $UNSEAL_KEY
done

echo "Waiting for vault-0 ready..."
sleep 15

echo "## Joining vault nodes to vault cluster..."
for ((i=1; i<=2; i++)); do
  kubectl exec -n $VAULT_NS $VAULT_STS_NAME-$i -- vault operator raft join http://$VAULT_STS_NAME-0.$VAULT_STS_NAME-internal:8200
done

echo "## Unsealing vault..."
for ((i=1; i<=2; i++)); do
  for UNSEAL_KEY in ${UNSEAL_KEYS[@]}; do
    kubectl exec -n $VAULT_NS $VAULT_STS_NAME-$i -- vault operator unseal $UNSEAL_KEY
  done
done
