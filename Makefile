RUN = api ls
GET = none

.PHONY: up
up:
	docker compose up

.PHONY: build
build:
	docker compose build

.PHONY: run
run:
	docker compose run --rm ${RUN}

.PHONY: exec
exec:
	docker compose exec api bash

.PHONY: migrate
migrate:
	docker compose run --rm api go run migrations/migrate.go up

.PHONY: tidy
tidy:
	docker compose run --rm api go mod tidy

.PHONY: get
get:
	docker compose run --rm api go get -u ${GET}

.PHONY: vendor
vendor:
	docker compose run --rm api go mod vendor
