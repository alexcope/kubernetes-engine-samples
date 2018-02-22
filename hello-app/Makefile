hello-app: main.go
	go build -o hello-app main.go

container: hello-app
	docker build -t gcr.io/alexcope-gke-dev/myserver:v0.1 .

push: container
	gcloud docker -- push gcr.io/alexcope-gke-dev/myserver:v0.1

test: push
	kubectl delete pod --all
	EXTERNALIP=$(kubectl get services -o=json | jq '.items[] | select(.metadata.name == "myserver") | .status.loadBalancer.ingress[].ip ' | sed 's/\"//g')
	curl $EXTERNALIP:8080
# .PHONY: hello-app container push