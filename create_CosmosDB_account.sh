# create_CosmosDB_account
export NAME=cosmos$RANDOM
az cosmosdb create \
    --name $NAME \
    --kind GlobalDocumentDB \
    --resource-group my_RG

# obtain Cosmos DB connection string
az cosmosdb keys list \
    --name $NAME \
    --reosurce-group my_RG \
    --type connection-strings
