#!/bin/bash

# Setup VAULT_ADDR and VAULT_TOKEN
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

vault policy write learn-admin ./admin-policy.hcl

vault token create -policy=learn-admin