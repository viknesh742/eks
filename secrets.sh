IMAGE=$(aws secretsmanager get-secret-value \
  --secret-id MYEks \
  --query SecretString --output text | jq -r .EKSImage)
 echo $IMAGE
		  
sed "s|__ECR_IMAGE_URI__|${IMAGE}|g" deployment.yaml > deployment.final.yaml


kubectl apply -f deployment.final.yaml