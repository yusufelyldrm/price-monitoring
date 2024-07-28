postgres:
	    docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root pricemonitoring

dropdb:
	docker exec -it postgres12 dropdb pricemonitoring

up:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/pricemonitoring?sslmode=disable" -verbose up

down:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/pricemonitoring?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb up down sqlc