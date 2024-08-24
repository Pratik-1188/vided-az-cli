. ./variables.ps1

$STORAGE_KEY = $(az storage account keys list --resource-group $RESOURCE_GROUP --account-name $STORAGE_ACCOUNT_NAME --query "[0].value" --output tsv)
Write-Output $STORAGE_KEY

# Create the Azure Container Instance
az container create `
    --resource-group $RESOURCE_GROUP `
    --name $ACI_NAME `
    --image $IMG `
    --cpu 1 `
    --memory 1 `
    --os-type Linux `
    --dns-name-label ffmpeg `
    --ports 8000 `
    --azure-file-volume-account-name $STORAGE_ACCOUNT_NAME `
    --azure-file-volume-account-key $STORAGE_KEY `
    --azure-file-volume-share-name $SHARE_NAME `
    --azure-file-volume-mount-path /mnt

# *************************************************************************************************

# Below is the code if u want to work with ACR
# $ACR_NAME = "videdazacr"
# $LOCAL_IMG_NAME = "python-ffmpeg:v1.0"
# $ACR_IMG_NAME = "$ACR_NAME.azurecr.io/$LOCAL_IMG_NAME"
    # # Create the Azure Container Registry
    # az acr create --name $ACR_NAME --resource-group $RESOURCE_GROUP --sku Basic
    # # Login to Azure Container Registry
    # az acr login --name $ACR_NAME
    # # Tag and push the Docker image
    # docker tag $LOCAL_IMG_NAME $ACR_IMG_NAME
    # docker push $ACR_IMG_NAME