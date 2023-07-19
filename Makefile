#!make
include .env

build:
	docker compose build

deps_get:
	docker compose run --rm -v ~/.ssh:/root/.ssh ms_clients_api mix deps.get

ecto_migrate:
	docker compose run --rm ms_clients_api mix ecto.migrate

ecto_seed:
	docker compose run --rm ms_clients_api mix run priv/repo/seeds.exs

ecto_reset:
	docker compose run --rm ms_clients_api mix ecto.reset

start:
	make deps_get && make ecto_migrate && docker compose up -d

remove:
	docker compose stop && docker-compose rm -f

recreate:
	make build && docker compose up --force-recreate -d

exec:
	docker exec -it ms_clients_api bash

attach:
	docker attach ms_clients_api

logs:
	docker logs -f ms_clients_api
