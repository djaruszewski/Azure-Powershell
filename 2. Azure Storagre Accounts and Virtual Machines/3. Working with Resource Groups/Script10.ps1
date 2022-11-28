
$ResourceGroupName="powershell-grp"
Remove-AzResourceGroup $ResourceGroupName -Force
'Remove Resource Group ' + $ResourceGroupName

$Location="East US"
$ResourceGroup=New-AzResourceGroup -Name $ResourceGroupName -Location $Location

'Provisioning State ' + $ResourceGroup.ProvisioningState

$ResourceGroupExisting=Get-AzResourceGroup -Name $ResourceGroupName

$ResourceGroupExisting

$AllResourceGroups=Get-AzResourceGroup

foreach($Group in $AllResourceGroups)
{
    'Removing Resource Group ' + $Group.ResourceGroupName
    Remove-AzResourceGroup -Name $Group.ResourceGroupName -Force
}
