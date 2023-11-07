#!/bin/bash

## Configuration ##
SECRET_NAME=vault-raft-token-tprwz
NAMESPACE=intern
OUTPUT_DIR=./token

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Get the secret data and decode it
SECRET_DATA=$(kubectl get secret -n $NAMESPACE $SECRET_NAME -o jsonpath='{.data}')

# Loop through the data in the secret
for key in $(echo $SECRET_DATA | jq -r "keys[]"); do
  # echo $SECRET_DATA | jq ".\"$key\""
  value=$(echo $SECRET_DATA | jq -r ".\"$key\"" | base64 --decode)
  # echo $value
  echo "$value" > $OUTPUT_DIR/$key
done
