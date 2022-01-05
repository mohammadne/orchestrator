#? create configMap (option 1)
kubectl create configmap nginx-config --from-file=3.reverseproxy.conf

#? create configMap (option 2)
kubectl create -f 3.cm.yml

# the result is the same
kubectl get configmap nginx-config -o yaml

# create pod + nginx-service
kubectl create -f 3.nginx.yml

kubectl exec -it helloworld-nginx -c nginx -- bash
> cat /etc/conf.d/reverseproxy.conf
# you can see it forwards the traffic to localhost:3000 (nodejs app)
