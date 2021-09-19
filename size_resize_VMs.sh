# size VMs
az vm list-sizes --location westeurope --output table

# specify size at creation
az vm create \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM2 \
    --image UbuntuLTS \
    --admin-username azureuser \
    --generate-ssh-keys \
    --verbose \
    --size "Standard_DS2_v2"

# resize existing VM
az vm list-vm-resize-options \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM \
    --output table

az vm resize \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM \
    --size Standard_D2s_v3
    