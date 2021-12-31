kubectl create -f 3.service.yml 

kubectl get svc
kubectl describe service helloworld-service
# IP: is the ip of service inside the cluster
# Endpoints: actual pods ip addresses

kubectl get pods --output=wide
# an output with pods IP addresses

kubectl port-forward service/helloworld-service 31001
