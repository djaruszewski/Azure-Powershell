$ResourceGroupName="powershell-grp"
$AccountName="demoaccount23946"
$Location="East US"

$StorageAccount=New-AzStorageAccount -ResourceGroupName $ResourceGroupName `
-Name $AccountName -Location $Location -SkuName 'Standard_LRS' `
-Kind "StorageV2" -Debug

$StorageAccount=Get-AzStorageAccount -ResourceGroupName $ResourceGroupName `
-Name $AccountName