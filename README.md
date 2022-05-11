# Vault Terraform Demo with Docker Compose 

Stand up a 3 nodes Vault Enterprise environment using Docker compose.

# Quick Start
1. Obtain a Vault Enterprise license.
2. Install [Docker Compose](https://docs.docker.com/compose/install/#install-compose), it should come with Docker Desktop on Mac.
3. `make all` to start the docker containers.
3  `make token` copies the root token on your clip board that you can use to login.
4  `make ui` opens the Vault UI on your default browser.

# Resources

- [Vault Agent with Docker Compose](https://gitlab.com/kawsark/vault-agent-docker/)