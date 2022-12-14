$ResourceGroupName = "powershell-grp"
$Location = "East US"

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

$Subnet = Get-AzVirtualNetworkSubnetConfig -Name $SubnetName `
-VirtualNetwork $VirtualNetwork

# Create the Network Interface

$NetworkInterfaceName="app-interface"

$NetworkInterface = New-AzNetworkInterface -Name $NetworkInterfaceName `
-ResourceGroupName $resourcegroupname -Location $location `
-Subnet $Subnet

# Create the Public IP Address

$PublicIPAddress="app-ip"

$PublicIPAddress = New-AzPublicIPAddress -Name $PublicIPAddress -ResourceGroupName $ResourceGroupName `
-Location $Location -Sku "Standard" -AllocationMethod "Static"

$IpConfig=Get-AzNetworkInterfaceIpConfig -NetworkInterface $NetworkInterface

$NetworkInterface | Set-AzNetworkInterfaceIpConfig -PublicIpAddress $PublicIPAddress `
-Name $IpConfig.Name

$NetworkInterface | Set-AzNetworkInterface

# Creating the Network Security Group

$SecurityRule1=New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Description "Allow-RDP" `
-Access Allow -Protocol Tcp -Direction Inbound -Priority 100 `
-SourceAddressPrefix * -SourcePortRange * `
-DestinationAddressPrefix * -DestinationPortRange 3389

$NetworkSecurityGroupName="app-nsg"

New-AzNetworkSecurityGroup -Name $NetworkSecurityGroupName `
-ResourceGroupName $ResourceGroupName -Location $Location `
-SecurityRules $SecurityRule1

# Creating the Azure Virtual Machine

$VmName="appvm"
$VMSize = "Standard_DS2_v2"
$ResourceGroupName = "powershell-grp"
$Location = "East US"

# Get-AzVMSize -Location $Location

$Credential = Get-Credential # will prompt for user/pass that will be used for admin acc

$NetworkInterfaceName="app-interface"
$NetworkInterface=Get-AzNetworkInterface -Name $NetworkInterfaceName -ResourceGroupName $ResourceGroupName

$VmConfig=New-AzVMConfig -Name $VmName -VMSize $VMSize

Set-AzVMOperatingSystem -VM $VmConfig -ComputerName $VmName `
-Credential $Credential -Windows

Set-AzVMSourceImage -VM $VmConfig -PublisherName "MicrosoftWindowsServer" `
-Offer "WindowsServer" -Skus "2019-Datacenter" -Version "latest"

$Vm=Add-AzVMNetworkInterface -VM $VmConfig -Id $NetworkInterface.Id

Set-AzVMBootDiagnostic -Disable -VM $Vm

New-AzVM -ResourceGroupName $ResourceGroupName -Location $Location `
-VM $Vm