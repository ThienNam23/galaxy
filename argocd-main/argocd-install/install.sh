#!/bin/bash

# Define the environment variable you want to check
ENV_VAR="ARGOCD_GIT_TOKEN"

# Check if the environment variable exists and is not null
if [ -z "${!ENV_VAR}" ]; then
    echo -e "\e[1;31mError: Environment variable $ENV_VAR is not set or is empty\e[0m"
    exit 1
fi

helm template argocd . -n argocd \
    --set argocdGitSecret.token=$ARGOCD_GIT_TOKEN \
    --set argocdGitSecret.username=trungnam23032001 > install.yaml
