#!/bin/bash
set -euo pipefail

# Docker compose IP address fix
./api_addr.sh

export VAULT_S1_IP=$(docker inspect vault_s1 -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}')

# Init vault_s1
echo "Init and unseal vault_s1"
export VAULT_ADDR=http://localhost:8200
sleep 5
vault operator init -format=json -n 1 -t 1 > vault.txt

export VAULT_TOKEN=$(cat vault.txt | jq -r '.root_token')
echo "Root VAULT TOKEN is: $VAULT_TOKEN"

# Unseal vault_s1
echo "Unseal vault_s1"
export VAULT_ADDR=http://localhost:8200

export unseal_key=$(cat vault.txt | jq -r '.unseal_keys_b64[0]')
vault operator unseal ${unseal_key}

sleep 5

# Join vault_s2
echo "Join vault_s2"
export VAULT_ADDR=http://localhost:18200
vault operator raft join http://${VAULT_S1_IP}:8200

# Unseal vault_s2
echo "Unseal vault_s2"
vault operator unseal ${unseal_key}

# Join vault_s3
echo "Join vault_s3"
export VAULT_ADDR=http://localhost:28200
vault operator raft join http://${VAULT_S1_IP}:8200

# Unseal vault_s3
echo "Unseal vault_s3"
vault operator unseal ${unseal_key}

# Reset vault addr and add vault token
export VAULT_ADDR=http://localhost:8200

sleep 5

echo "*** Cluster members ***"
vault operator members

export VAULT_TOKEN=$(cat vault.txt | jq -r '.root_token')
#vault token lookup

echo "*** Please Run: export VAULT_TOKEN=${VAULT_TOKEN}"