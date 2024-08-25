. ./variables.ps1

$CONTAINER_APP_ENV_NAME="vided-container-env"

az containerapp env create `
  --name $CONTAINER_APP_ENV_NAME `
  --resource-group $RESOURCE_GROUP `
  --location eastus `
  --enable-workload-profiles `
  --logs-destination none
