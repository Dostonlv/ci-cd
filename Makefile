
build:
	docker build -t golang-ci-cd .

run:
	docker run --rm -p 8080:8080 golang-ci-cd

lint:
	golangci-lint run

test:
	go test ./...
