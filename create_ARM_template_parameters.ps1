# create ARM template with parameters

$templateFile = 'azuredeploy_param.json'
$date = Get-Date -Format "MM-dd-yyyy"
$deploymentName = 'addnameparameter-' + $date

New-AzResourceGroupDeployment -Name $deploymentName -templateFile $templateFile -storageName "9MOFOnewstorageparam564" -storageSKU Standard_GRS



