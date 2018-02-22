hello-app: main.go
	go build -o hello-app main.go

container: hello-app
	docker build -t gcr.io/alexcope-gke-dev/myserver:v0.1 .

push: container
	gcloud docker -- push gcr.io/alexcope-gke-dev/myserver:v0.1

test: push test.sh
	./test.sh
# .PHONY: hello-app container push