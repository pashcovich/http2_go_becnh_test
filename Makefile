build:
	docker build -t benchmark:v1 .

run: build
	docker run --rm -d --add-host=benchmark.test:127.0.0.1 --name go_benchmark benchmark:v1

bench: run
	docker exec -it go_benchmark ./benchmark -u https://benchmark.test/bench -c 100 -n 10000
	docker rm -f go_benchmark 2>&1 1>/dev/null
