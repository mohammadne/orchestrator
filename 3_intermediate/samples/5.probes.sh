# without readinesProbe, the pods will start immediately (comment readinesProbe)
kubectl create -f 5.probes.yml && watch -n1 kubectl get pods

# uncomment readinesProbe and them run:
kubectl create -f 5.probes.yml && watch -n1 kubectl get pods
