-include /opt/basics/common/common.mk

compose-setup: compose-build

compose:
	docker-compose up

compose-build:
	docker-compose build

code-lint:
	@(for i in $$(find . -type f -name main.cpp); do cpplint $$(dirname $$i) ; done)

compile:
	@(for i in $$(find . -type f -name main.cpp); do cd $$(dirname $$i) && g++ -std=c++17 -c *.cpp ; done)

compose-bash:
	docker-compose run exercises bash

compose-test:
	docker-compose run exercises make test

compose-description-lint:
	docker-compose run exercises make description-lint

compose-schema-validate:
	docker-compose run exercises make schema-validate

ci-check:
	docker-compose --file docker-compose.yml build
	docker-compose --file docker-compose.yml up --abort-on-container-exit