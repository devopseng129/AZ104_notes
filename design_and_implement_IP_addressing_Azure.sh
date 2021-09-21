# design_and_implement_IP_addressing_Azure_VNets

# create vnet 1
az network vnet create \
    --resource-group RG \
    --name vnet1 \
    --address-prefixes 10.20.0.0/16 \
    --location westus

# create vnet1 subnets
az network vnet subnet create \
    --resource-group RG \
    --vnet-name vnet1 \
    --name subnet11 \
    --address-prefixes 10.20.0.0/27

az network vnet subnet create \
    --resource-group RG \
    --vnet-name vnet1 \
    --name subnet12 \
    --address-prefixes 10.20.0.0/24

    az network vnet subnet create \
    --resource-group RG \
    --vnet-name vnet1 \
    --name subnet13 \
    --address-prefixes 10.20.0.0/24

    az network vnet subnet create \
    --resource-group RG \
    --vnet-name vnet1 \
    --name subnet14 \
    --address-prefixes 10.20.0.0/24

# show all created subnets
az network vnet subnet list \
    --resource group RG \
    --vnet-name vnet1 \
    --output table

