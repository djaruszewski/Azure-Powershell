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
