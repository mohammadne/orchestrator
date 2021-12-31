kubectl get pods
kubectl get rc

kubectl scale --replicas=4 rc helloworld-rc
kubectl delete pod <one-of-the-pods>
kubectl get pods
