.DEFAULT_GOAL := info

all: clean up-detach init

.PHONY: clean up up-detach init info admin

info:
	$(info Targets are: all, up, up-detach, init, clean. Run all to execute them in order.)
	$(info up will block and docker compose in foreground, up-detach will run docker compose in background.)

admin:
	cd scripts && ./admin.sh

up:
	docker-compose up

up-detach:
	cd docker-compose \
	  && docker-compose up --detach

init:
	cd docker-compose/scripts \
	  && ./00-init.sh

clean:
	cd docker-compose \
	  && docker-compose down

secret:
	cd terraform && terraform init && terraform apply -var-file="secrets.tfvars" --auto-approve

clean-secret:
	cd terraform && terraform destroy -var-file="secrets.tfvars" --auto-approve

show-metadata:
	export VAULT_ADDR=http://localhost:8200 \
	&& export VAULT_TOKEN=root \
	&& vault kv metadata get -format=json secret/foo

show-members:
	export VAULT_ADDR=http://localhost:8200 \
	&& export VAULT_TOKEN=$$(cat docker-compose/scripts/vault.txt | jq -r '.root_token') \
	&& vault operator raft list-peers

ui:
	open http://localhost:8200

token:
	cat docker-compose/scripts/vault.txt | jq -r '.root_token' | pbcopy
