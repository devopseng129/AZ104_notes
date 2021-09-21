# prepare_virtual_networks_for_peering

# create vnets
az network vnet create \
    --resource-group RG \
    --name vnet1 \
    --address-prefixes 10.1.0.0/16 \
    --subnet-name subnet11 \
    --location northeurope


# confirm VNet configuration
az network vnet list --output table

# create VM
az vm create \
    --resource-group RG \
    --no-wait \
    --name VM1 \
    --location northeurope \
    --vnet-name SalesVnet \
    --subnet Apps \
    --image UbuntuLTS \
    --admin-username azurefkinguser \
    --admin-password Unh4ck4bl3

# confirm VMs are running
watch -d -n "az vm list \
    --resource-group [sandbox resource group name] \
    --show-details \
    --query '[*].{Name:name, ProvisioningState:provisioningState, PowerState:powerState}' \
    --output table"
