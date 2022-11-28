$resourcegroupname = "powershell-grp"
$VirtualNetwork = "app-network"
$SubnetName="SubnetA"
$location="East US"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetwork `
-ResourceGroupName $resourcegroupname

$Subnet=Get-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork

$NetworkInterfaceName="app-interface"

$NetworkInterface = New-AzNetworkInterface -Name $NetworkInterfaceName `
-ResourceGroupName $resourcegroupname -Location $location `
-Subnet $Subnet
