while read line
do
kubectl get deployments -o yaml $line >> $line-deployment.yaml
done < file.txt
