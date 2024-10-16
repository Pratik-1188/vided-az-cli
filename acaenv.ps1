. ./variables.ps1

$CONTAINER_APP_ENV_NAME="vided-container-env"

# Create the Azure Container Apps Environment
az containerapp env create `
  --name $CONTAINER_APP_ENV_NAME `
  --resource-group $RESOURCE_GROUP `
  --location $LOCATION `
  --enable-workload-profiles `
  --logs-destination none

# Retrieve the Storage Account Key
$STORAGE_KEY = $(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT_NAME --query "[0].value" --output tsv)
Write-Output $STORAGE_KEY

# Configure Storage for the Container App Environment
az containerapp env storage set `
  --access-mode ReadWrite `
  --account-name $STORAGE_ACCOUNT_NAME `
  --azure-file-account-key $STORAGE_KEY `
  --azure-file-share-name $SHARE_NAME `
  --name $CONTAINER_APP_ENV_NAME `
  --resource-group $RESOURCE_GROUP `
  --storage-name mystoragemount
