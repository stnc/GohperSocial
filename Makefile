include .envrc
MIGRATIONS_PATH = ./cmd/migrate/migrations
DB_ADDR =  postgresql://postgres:changeme@localhost:5432/social?sslmode=disable


.PHONY: migrate-create
migration:
	@migrate create -seq -ext sql -dir $(MIGRATIONS_PATH) create_users


.PHONY: migrate-up
migrate-up:
	@migrate -path=$(MIGRATIONS_PATH)  -database=$(DB_ADDR) -verbose up

.PHONY: migrate-down


migrate-down:
	@migrate -path=$(MIGRATIONS_PATH) -database=$(DB_ADDR) down $(filter-out $@,$(MAKECMDGOALS))

.PHONY: seed
seed: 
	@go run cmd/migrate/seed/main.go

.PHONY: gen-docs
gen-docs:
	@swag init -g ./api/main.go -d cmd,internal && swag fmt

## Reading list part 

.PHONY: all build deps deps-cleancache

GOCMD=go
BUILD_DIR=build
BINARY_DIR=$(BUILD_DIR)/bin
CODE_COVERAGE=code-coverage

all: build

${BINARY_DIR}:
	mkdir -p $(BINARY_DIR)

build: ${BINARY_DIR} ## Compile the code, build Executable File
	mkdir -p $(BINARY_DIR)
	$(GOCMD) build -o $(BINARY_DIR) -v ./cmd/api

run: ## Start application
	$(GOCMD) run ./cmd/api
