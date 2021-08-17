PROXY = proxy.nagaokaut.ac.jp:8080
RUN = api ls
GET = none

.PHONY: up
up:
	docker-compose up

.PHONY: build
build:
	docker-compose build --build-arg http_proxy=${PROXY} --build-arg https_proxy=${PROXY}

.PHONY: run
run:
	docker-compose run --rm -e http_proxy=${PROXY} -e https_proxy=${PROXY} ${RUN}

.PHONY: tidy
tidy:
	docker-compose run --rm -e http_proxy=${PROXY} -e https_proxy=${PROXY} api go mod tidy

.PHONY: get
get:
	docker-compose run --rm -e http_proxy=${PROXY} -e https_proxy=${PROXY} api go get ${GET}
