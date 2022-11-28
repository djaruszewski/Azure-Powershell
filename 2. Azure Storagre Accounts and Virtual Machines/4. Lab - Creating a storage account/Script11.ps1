$AccountName = "appstore40008989121"
$AccountKind="StorageV2"
$AccountSKU="Standard_LRS" # standard or premium (and redundancy)
$ResourceGroupName="powershell-grp"
$Location = "East US"

$StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName `
-Name $AccountName -Location $Location -Kind $AccountKind -SkuName $AccountSKU

$StorageAccount