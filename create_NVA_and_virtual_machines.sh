#create_NVA_and_virtual_machines

az vm create \ 
    --resource-group RG \
    --name nva \ 
    --vnet-name vnet \ 
    --subnet dmzsubnet \ 
    --image UbuntuLTS \
    --admin-username admin \
    --admin-password <pass>


#get the id of the NVA network interface
NICID=$(az vm nic list \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --vm-name nva \
    --query "[].{id:id}" --output tsv)

echo $NICID


# get the name of the NVA network interface
NICNAME=$(az vm nic show \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --vm-name nva \
    --nic $NICID \
    --query "{name:name}" --output tsv)

echo $NICNAME

# enable IP forwarding to the network interface
az network nic update --name $NICNAME \
    --resource-group RG \
    --ip-forwarding true

# save the public IP address of the NVA VM
NVAIP="$(az vm list-ip-addresses \
    --resource-group learn-fffc9fed-903a-4909-80cc-835efc3173cb \
    --name nva \
    --query "[].virtualMachine.network.publicIpAddresses[*].ipAddress" \
    --output tsv)"

echo $NVAIP

# enable IP forwarding within the NVA
ssh -t -o StrictHostKeyChecking=no azureuser@$NVAIP 'sudo sysctl -w net.ipv4.ip_forward=1; exit;'