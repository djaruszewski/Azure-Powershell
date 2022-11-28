# Public IP Address

$PublicIPAddress="app-ip"
$ResourceGroupName = "powershell-grp"
$Location="East US"

$PublicIPAddress = New-AzPublicIPAddress -Name $PublicIPAddress -ResourceGroupName $ResourceGroupName `
-Location $Location -Sku "Standard" -AllocationMethod "Static"

# Get the details of our network interface
$NetworkInterfaceName="app-interface"
$NetworkInterface=Get-AzNetworkInterface -Name $NetworkInterfaceName -ResourceGroupName $ResourceGroupName

$IpConfig=Get-AzNetworkInterfaceIpConfig -NetworkInterface $NetworkInterface

$NetworkInterface | Set-AzNetworkInterfaceIpConfig -PublicIpAddress $PublicIPAddress `
-Name $IpConfig.Name

$NetworkInterface | Set-AzNetworkInterface

