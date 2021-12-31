kubectl get nodes --show-labels

kubectl create -f 2.deployment.yml
kubectl get pods # pods are in Pending status (failed to fit any node)

kubectl label nodes minikube hardware=high-spec
# label minikube node
