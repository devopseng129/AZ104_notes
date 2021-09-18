// configure_ip_based_firewall_rules
az storage account network-rule add \
    --resource-group "myRG" \
    --account-name "mySA" \
    --ip-address "N.N.N.N"

// require secure transfer for all connections
az storage account update \
    --resource-group ResourceGroupName \
    --name StorageAccountName \
    --https-only true
