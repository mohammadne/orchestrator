#? generate configMap using files

kubectl create configmap app-config --from-file=2.config.properties
