Disable-AzContextAutosave

Connect-AzAccount
$ResourceGroupName="powershell-grp"
$Location="East US"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location