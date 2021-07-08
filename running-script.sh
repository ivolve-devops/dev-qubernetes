while read line
do
kubectl get deployments -o yaml $line > $line-deployment.yaml
done < deploymentname.txt
