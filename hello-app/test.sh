n=0
until [ $n -ge 5 ]
do
	kubectl delete pod --all && break
	EXTERNALIP=$(kubectl get services -o=json | jq '.items[] | select(.metadata.name == "myserver") | .status.loadBalancer.ingress[].ip ' | sed 's/\"//g') && break
	curl $EXTERNALIP:8080 && break
	n=$[$n+1]
done

