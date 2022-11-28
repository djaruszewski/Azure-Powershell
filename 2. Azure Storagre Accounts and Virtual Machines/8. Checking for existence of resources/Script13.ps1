$AccountName = "appstore40008989121"
$AccountKind="StorageV2"
$AccountSKU="Standard_LRS" # standard or premium (and redundancy)
$ResourceGroupName="powershell-grp"
$Location = "East US"

# Check for the existence of the storage account
if(Get-AzStorageAccount -Name $AccountName -ResourceGroupName $ResourceGroupName -ErrorAction SilentlyContinue)
{
    'Storage Account already exists'
    $StorageAccount=Get-AzStorageAccount -Name $AccountName -ResourceGroupName $ResourceGroupName
}
else {
    'Creating the storage account'
    $StorageAccount = New-AzStorageAccount -ResourceGroupName $ResourceGroupName `
-Name $AccountName -Location $Location -Kind $AccountKind -SkuName $AccountSKU
}


$ContainerName="data"

$StorageAccount=Get-AzStorageAccount -Name $AccountName -ResourceGroupName $ResourceGroupName

if(Get-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context -ErrorAction SilentlyContinue)
{
    'Container already exists'
    $Container=Get-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context
}
else {
    'Creating the container'
    $Container=New-AzStorageContainer -Name $ContainerName -Context $StorageAccount.Context `
-Permission Blob
}


$BlobObject=@{
    FileLocation="sample.txt"
    ObjectName ="sample.txt"
}

if(Get-AzStorageBlob -Context $StorageAccount.Context -Container $ContainerName -Blob $BlobObject.ObjectName -ErrorAction SilentlyContinue)
{
    'Blob does exist'
    $Blob=Get-AzStorageBlob -Context $StorageAccount.Context -Container $ContainerName -Blob $BlobObject.ObjectName
}
else {
    'Creating the Blob'
    $Blob=Set-AzStorageBlobContent -Context $StorageAccount.Context -Container $ContainerName `
-File $BlobObject.FileLocation -Blob $BlobObject.ObjectName
}
