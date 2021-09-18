# Test storage system
az storage account show-connection-string --name $STORAGENAME
# JSON output format

# open port
curl -X POST http://localhost:8888/openPort/8000;

# return url where the app can be accessed
{"message":"Port 8000 is open","url":"https://gateway11.northeurope.console.azure.com/n/cc-4016c848/cc-4016c848/proxy/8000/"}

# run the app
cd sas
dotnet run

