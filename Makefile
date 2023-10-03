shellflags = -eux -o pipefail -c
include .env

.PHONY: default
default: setup

.PHONY: up
up:
	docker compose up -d --remove-orphans --force-recreate app

.PHONY: down
down:
	docker compose kill
	docker compose down -v

.PHONY: build
build:
	docker compose build app --progress plain

.PHONY: setup
setup:
	@make down
	@make build
	make up
	docker compose exec php composer install
	docker compose exec php php artisan install