az vm stop \
    --name SampleVM \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc

az vm get-instance-view \
    --name SampleVM \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc \
    --query "instanceView.statuses[?starts_with(code, 'PowerState/')].displayStatus" -o tsv

az vm start \
    --name SampleVM \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc

az vm restart \
    --name SampleVM \
    --resource-group learn-1f7a389a-b180-45fe-9982-2bba69fe7ffc
