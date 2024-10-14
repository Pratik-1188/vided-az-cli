. ./variables.ps1

$CONTAINER_APP_ENV_NAME="vided-container-env"
$CONTAINER_APP_NAME="vided-spring-boot-app"

# Create the Container App with Storage Mounted
# --env-vars "ENV_VAR1=value1" `  # Add your environment variables as needed
az containerapp create `
  --name $CONTAINER_APP_NAME `
  --resource-group $RESOURCE_GROUP `
  --environment $CONTAINER_APP_ENV_NAME `
  --min-replicas 1 `
  --max-replicas 1 `
  --image pratik1188/vided-spring-boot-app:v1 `
  --cpu 1.0 --memory 2.0Gi `
  --ingress external --target-port 8080 `
  --query properties.configuration.ingress.fqdn

#  Export container app's configuration
az containerapp show --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP --output yaml > app.yaml

# az containerapp update --name $CONTAINER_APP_NAME --resource-group $RESOURCE_GROUP --yaml app.yaml --output table

#   template:
#     volumes:
#       - name: my-azure-file-volume
#         storageName: mystoragemount
#         storageType: AzureFile
#     containers:
#       - image: pratik1188/vided-spring-boot-app:v1
#         name: vided-spring-boot-app
#         volumeMounts:
#           - volumeName: my-azure-file-volume
#             mountPath: /mnt