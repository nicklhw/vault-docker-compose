terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "3.4.1"
    }
  }
}

provider "vault" {
  address = "http://localhost:8200"
}

resource "vault_generic_secret" "secret" {
  path      = "secret/foo"
  data_json = var.secret
}

resource "vault_generic_endpoint" "metadata" {
  depends_on = [vault_generic_secret.secret]
  path       = "secret/metadata/foo"
  data_json  = var.metadata
}