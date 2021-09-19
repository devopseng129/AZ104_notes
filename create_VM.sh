az vm create \
    --resourcegroup <RG>\
    --location westus\
    --name TestVM\
    --image UbuntuLTS\
    --admin-username <user>\
    --generate-ssh-keys \
    --verbose
    --no-wait

# list available images
az vm image list --output table
az vm image list -sku Wordpress --output table --all
az vm image list --publisher Microsoft --output table --all
az vm image --location westeurope --output table
