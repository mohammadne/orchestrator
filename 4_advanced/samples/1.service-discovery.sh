############################################################? DNS how-it-work

kubectl run -i --tty busybox --image=busybox --restart=Never -- sh

hostname
# busybox

cat /etc/resolv.conf 
# search personal.svc.cluster.local svc.cluster.local cluster.local okd4.teh-1.snappcloud.io
# nameserver 172.30.0.10
# options ndots:5

############################################################? demo

kubectl apply -f 1.service-discovery.yml

kubectl get pods

# run a debug container
kubectl run -i --tty ubuntu --image=mysql --restart=Never -- sh
> mysql -h mysql -u root -p # rootpassword
> apt-get update; apt-get install curl -y
> curl -X HEAD -i database-service:3306
> curl -X HEAD -i helloworld-service:3000
kubectl delete pod ubuntu

kubectl logs helloworld-deployment-id 
# connection to db established

kubectl port-forward service/helloworld-service 3000
curl localhost:3000

