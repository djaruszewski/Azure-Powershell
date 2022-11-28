$Location="East US"

# This will list the different publishers available for the azure vm
#Get-AzVMImagePublisher -Location $Location

$PublisherName="MicrosoftWindowsServer"

# This will list the different options for the publisher search
Get-AzVMImagePublisher -Location $Location `
| Where-Object {$_.PublisherName -eq $PublisherName}

# This will list the different offers for the publisher
Get-AzVMImageOffer -Location $Location -PublisherName $PublisherName

$Offer="WindowsServer"

# This will list the different skus for the offer
Get-AzVMImageSku -Location $Location -PublisherName $PublisherName `
-Offer $Offer

$Sku="2019-Datacenter"

# This will get all the versions for the sku
$Image=Get-AzVMImage -Location $Location -PublisherName $PublisherName `
-Offer $Offer -Skus $Sku