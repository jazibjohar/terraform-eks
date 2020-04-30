Run Pre init script

script/preinit.sh <profile_name>

terraform init

terraform apply -var-file=global.tfvars

kubectl apply -f aws-auth-cm.yaml
