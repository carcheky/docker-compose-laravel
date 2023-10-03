
include .env

.PHONY: default
default: up

.PHONY: up
up:
	docker compose up -d --progress plain --build app 
	git submodule update --init --recursive
	docker compose exec php composer install
	# docker compose exec php composer update
	docker compose exec php php artisan install