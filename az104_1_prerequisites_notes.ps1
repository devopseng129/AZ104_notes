# create new Azure VM
New-AzVM `
-ResourceGroupName 'RG_name' `
-Name 'VM_name' `
-Image 'Ubuntu_LTS'

#remove a Resource Group
Remove-AzResourceGroup -Name 'RG_name'

#determine PS version
$PSVersionTable.PSVersion

#install Az module
Get-Module
Install-Module -Name Az -AllowClobber -SkipPublisherCheck
Update-Module -Name Az 


#create Az resource
Import-Module Az 
Connect-AzAccount
Select-AzSubscription -SubscriptionId 'subID'

Get-AzResourceGroup | Fromat -Table
New-AzReosurceGroup -Name 'name' -Location 'West US'

Get-AzResource | ft 

#get info regarding VM
$vm = Get-AzVM -Name MyVM -ResourceGroupName RG_Name
$vm.HardwareProfile.vmSize = 'Standard_DS3'

Update-AzVM -ReosurceGroupName $ResourceGroupName -VM $vm

#automate VM creation
param([string]$resourceGroup)

$adminCredential = Get-Credential -Message "Enter a username and password for the VM administrator."

For ($i = 1; $i -le 3; $i++)
{
    $vmName = "ConferenceDemo" + $i
    Write-Host "Creating VM: " $vmName
    New-AzVm -ResourceGroupName $resourceGroup -Name $vmName -Credential $adminCredential -Image UbuntuLTS
}