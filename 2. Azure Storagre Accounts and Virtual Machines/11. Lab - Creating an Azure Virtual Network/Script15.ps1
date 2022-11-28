$resourcegroupname = "powershell-grp"
$location="East US"

$VirtualNetwork = "app-network"
$VirtualNetworkAddressSpace = "10.0.0.0/16"
$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"

# Create the subnet resource

$SubnetA=New-AzVirtualNetworkSubnetConfig -Name $SubnetName -AddressPrefix $SubnetAddressSpace

# Next we can create the virtual network

$VirtualNetwork = New-AzVirtualNetwork -Name $VirtualNetwork `
-ResourceGroupName $resourcegroupname -Location $location `
-AddressPrefix $VirtualNetworkAddressSpace -Subnet $SubnetA

'The Virtual Network Details'
$VirtualNetwork