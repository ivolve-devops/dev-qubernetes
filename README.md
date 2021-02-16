# Dcm-kube-deploy-services-files
dcm services and deployment configuration files
# Before Killbill and kaui service deployment run kill db script
# Example Run all .sql file
mysql -h 10.81.1.72 -u root -padmin < killbill-db-script/file name.sql


# Take Backup for Running deployment 
  step 1: kubectl get deploy | awk 'NR>1 {print $1} ' > deploymentname.txt <br>
  step 2: run the script (running-script.sh) with command: sh running-script.sh
