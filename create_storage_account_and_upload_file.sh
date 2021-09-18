# Create storage account and upload files

    # create storage account for patient images
export STORAGENAME=medicalrecords$RANDOM

az storage account create \
    --name $STORAGENAME
    --access-tier hot \
    --kind StorageV2 \
    --resource-group <resource group id>

    # create container to store the images
az storage container create \
    --name patient-images \
    --account-name $STORAGENAME \
    --public-access off

    # from github, clone existing web app
git clone <github url> sas

    # upload files into the storage account
az storage blob upload-batch \
    --source sas \
    --destiantion patient-images \
    --account-name $STORAGENAME \
    --pattern *.jpg
