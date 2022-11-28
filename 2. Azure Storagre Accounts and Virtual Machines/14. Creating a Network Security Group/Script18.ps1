# Create the Network Security Group Rule

$SecurityRule1=New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Description "Allow-RDP" `
-Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
-SourceAddressPrefix * -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 3389

$NetworkSecurityGroupName="app-nsg"
$ResourceGroupName="powershell-grp"
$Location="East US"

$NetworkSecurityGroup=New-AzNetworkSecurityGroup -Name $NetworkSecurityGroupName `
-ResourceGroupName $ResourceGroupName -Location $Location `
-SecurityRules $SecurityRule1

$VirtualNetwork = "app-network"
$SubnetName="SubnetA"
$SubnetAddressSpace="10.0.0.0/24"

$VirtualNetwork=Get-AzVirtualNetwork -Name $VirtualNetwork `
-ResourceGroupName $resourcegroupname



Set-AzVirtualNetworkSubnetConfig -Name $SubnetName -VirtualNetwork $VirtualNetwork `
-NetworkSecurityGroup $NetworkSecurityGroup -AddressPrefix $VirtualNetwork.Subnets[0].AddressPrefix

$VirtualNetwork | Set-AzVirtualNetwork

