#!/bin/bash

kubectl delete pod --all

n=0
until [ $n -ge 15 ]
do
	EXTERNALIP=$(kubectl get services -o=json | jq '.items[] | select(.metadata.name == "myserver") | .status.loadBalancer.ingress[].ip ' | sed 's/\"//g') || (echo $? && continue)
	curl ${EXTERNALIP}:8080 && break
	n=$[$n+1]
done

