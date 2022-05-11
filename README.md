# Vault Enterprise Demo with Docker Compose 

**THIS REPO IS NOT FOR PRODUCTION USE**

Stand up a 3 nodes Vault Enterprise demo environment quickly using Docker compose.

# Quick Start
1. Obtain a Vault Enterprise license, put the license file with the name `vault.hclic` under `docker-compose/vault/vault_s*`
2. Install [Docker Compose](https://docs.docker.com/compose/install/#install-compose), it should come with Docker Desktop on Mac.
3. `make all` to start the docker containers.
4.  `make token` copies the root token on your clip board that you can use to login.
5.  `make ui` opens the Vault UI on your default browser.
6. `make clean` to tear down the environment

# Resources

- [Vault Agent with Docker Compose](https://gitlab.com/kawsark/vault-agent-docker/)