all: gen-certs build up

clean-all: down clean-certs

gen-certs:
	pushd http-server/certs && ./generate-certificates.sh && popd

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down -v

clean-certs:
	rm -rf ./http-server/certs/ca/**
	rm -rf ./http-server/certs/md.example.com/**