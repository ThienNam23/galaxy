#!/bin/bash

NAMESPACE=vault
PODS=(
  vault-0
  vault-1
  vault-2
)
UNSEAL_KEYS=(
  f8d5d80a11befece41f0d7f7f427fe71f6b5432d3fc7d1eaafe48d70ffb7e9f64e
  11e675d6453b847327fb386453ee30d938366c2b5da2804eebf18c02ccf26b176e
  175f5e405b185d54278f922819e2a3cfde2a29560e441ef34c0605519fc1a189df
)
for POD in ${PODS[@]}; do
  for UNSEAL_KEY in ${UNSEAL_KEYS[@]}; do
    kubectl exec -it $POD -n $NAMESPACE -- vault operator unseal $UNSEAL_KEY
  done
done
