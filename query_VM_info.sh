# get info about the VM
az vm list
az vm list-ip-addresses -n SampleVM -o table
az vm show --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc --name SampleVM

# query with JSON outpur with JMES
az vm show \
    --resource-group  RG
    --name SampleVM \
    --query "osProfile.adminUsername"

az vm show \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM \
    --query hardwareProfile.vmSize

az vm show \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM \
    --query "networkProfile.networkInterfaces[].id"

az vm show \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --name SampleVM \
    --query "networkProfile.networkInterfaces[].id" --output tsv
