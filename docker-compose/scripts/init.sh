#!/bin/bash

# Setup VAULT_ADDR and VAULT_TOKEN
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

# Enable the kv Secrets engine and store a secret
vault secrets enable -version=2 kv