# route_traffic_through_NVA

# create public and private VMs
code cloud-init.txt

    #input
#cloud-config
package_upgrade: true
packages:
    -inetutils-traceroute

# create public VM
az vm create \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --name public \
    --vnet-name vnet \
    --subnet publicsubnet \
    --image UbuntuLTS \
    --admin-username azureuser \
    --no-wait \
    --custom-data cloud-init.txt \
    --admin-password <password>

# create private VM
az vm create \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --name private \
    --vnet-name vnet \
    --subnet privatesubnet \
    --image UbuntuLTS \
    --admin-username azureuser \
    --no-wait \
    --custom-data cloud-init.txt \
    --admin-password <password>

# check if VMs are running
watch -d -n 5 "az vm list \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --show-details \
    --query '[*].{Name:name, ProvisioningState:provisioningState, PowerState:powerState}' \
    --output table"

# save public IP address of public VM
PUBLICIP="$(az vm list-ip-addresses \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --name public \
    --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
    --output tsv)"

echo $PUBLICIP

# save public IP address of private VM
PRIVATEIP="$(az vm list-ip-addresses \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --name private \
    --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
    --output tsv)"

echo $PRIVATEIP

# test traffic

# trace route from public to private
ssh -t -o StrictHostKeyChecking=no azureuser@$PUBLICIP 'traceroute private --type=icmp; exit'

# trace route from private to public
ssh -t -o StrictHostKeyChecking=no azureuser@$PRIVATEIP 'traceroute public --type=icmp; exit'


