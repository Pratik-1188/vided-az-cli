. ./variables.ps1


# Create the resource group
# az group create --name $RESOURCE_GROUP --location $LOCATION

# Create the storage account with the parameters
az storage account create --resource-group $RESOURCE_GROUP --name $STORAGE_ACCOUNT_NAME --location $LOCATION --sku Standard_LRS

# Create the file share
az storage share create --name $SHARE_NAME --account-name $STORAGE_ACCOUNT_NAME