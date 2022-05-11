#!/bin/bash

# This script will clean up locally provisioned resources
cd ../ && docker compose down
rm -rf terraform/terraform.tfstate*
rm -rf terraform/.terraform
rm -f docker-compose/scripts/vault.txt