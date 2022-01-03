###################################### GENERATE 

# via kubectl

echo -n "root" > ./usename.txt
echo -n "password" > ./password.txt
kubectl create secret generic db-user-pass --from-file=./username.txt --from-file=./password.txt

# via yaml definition

kubectl create -f 7.generate_secret.yml

###################################### USE

# via volume

kubectl create -f 7.use_secret_volume.yml

kubectl get pods

kubectl exec helloworld-pod -it -- /bin/bash
> cat /etc/creds/username
> cat /etc/creds/password
