# verify_VNet_peering_SSH_between_VMs

# list IP address to connect to
az vm list \
    --resource-group learn-fb278fc3-3514-4e86-bb6a-a525df550d7e \
    --query "[*].{Name:name, PrivateIP:privateIps, PublicIP:publicIps}" \
    --show-details \
    --output table

# test connection
ssh -o StrictHostKeyChecking=no azureuser@<SalesVM public IP>

