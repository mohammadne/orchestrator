############################################################? DNS how-it-work

kubectl run -i --tty ubuntu --image=ubuntu --restart=Never -- sh

#! actual IP of the pod
> hostname -I

#! display the system's DNS name
> hostname 
# ubuntu

#! show dns-server or nameserver (option 1)
> cat /etc/resolv.conf 
# nameserver 10.152.0.10
# search mohammadne.svc.cluster.local svc.cluster.local cluster.local c.okteto-prod.internal google.internal
# options ndots:5

#! show dns-server or nameserver (option 2)
> apt-get install dnsutils -y
> nslookup google.com
# Server:         10.152.0.10
# Address:        10.152.0.10#kube-dns.kube-system.svc.cluster.local

#! show dns-server or nameserver (option 3)
kubectl describe svc kube-dns -n kube-system
# look at IP of the kube-dns service, the Endpoints are refer to kube-dns pods

############################################################? demo

kubectl apply -f 1.service-discovery.yml

kubectl get pods

# run a debug container to check mysql service is reachable
kubectl run -i --tty ubuntu --image=mysql --restart=Never -- sh
> apt-get update; apt-get install curl -y
> curl -X HEAD -i database-service:3306
> curl -X HEAD -i helloworld-service:3000
> mysql -h mysql -u root -p # rootpassword
kubectl delete pod ubuntu

# get into mysql database (check records)
kubectl exec database -it -- mysql -u root -p
> SHOW DATABASES;
> USE helloworld;
> SHOW tables;
> SELECT * FROM visits;
> \q

# run a debug busybox

kubectl run -i --tty busybox --image=busybox --restart=Never -- sh
> nslookup helloworld-service
# shows the dns-server + ClusterIp of the helloworld-service 

kubectl logs helloworld-deployment-id 
# connection to db established

# hit node-js app from busybox
kubectl run -i --tty busybox --image=busybox --restart=Never -- sh
> telnet localhost 3000
> GET /

# hit node-js app from local computer
kubectl port-forward service/helloworld-service 3000
curl localhost:3000

