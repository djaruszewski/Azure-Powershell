$VmName="appvm"
$ResourceGroupName="powershell-grp"

$Vm=Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName

'Deleting the data disks'

foreach($DataDisk in $Vm.StorageProfile.DataDisks)
{
    'Removing Data Disk' + $DataDisk.Name

    Remove-AzVMDataDisk -VM $Vm -DataDiskNames $DataDisk.Name
    $Vm | Update-AzVM

    Get-AzDisk -ResourceGroupName $ResourceGroupName -Name $DataDisk.Name | Remove-AzDisk -Force


}

'Deleting the Public IP Address'

foreach($Interface in $Vm.NetworkProfile.NetworkInterfaces)
{
    $NetworkInterface=Get-AzNetworkInterface -ResourceId $Interface.Id
    $PublicAddress=Get-AzResource -ResourceId $NetworkInterface.IpConfigurations.publicIPAddress.Id

    $NetworkInterface.IpConfigurations.publicIPAddress.Id=$null
    $NetworkInterface | Set-AzNetworkInterface

    'Removing Public IP Address ' + $PuublicAddress.Name
    Remove-AzPublicIpAddress -ResourceGroupName $ResourceGroupName `
    -Name $PublicAddress.Name -Force
}

'Get a handle onto the OS Disk'

$OSDisk=$Vm.StorageProfile.OsDisk

'Deleting the virtual machine'

Remove-AzVM -Name $VmName -ResourceGroupName $ResourceGroupName -Force

'Deleting the Network Interface'

$NetworkInterface | Remove-AzNetworkInterface -Force

'Delete the OS Disk'

Get-AzDisk -ResourceGroupName $ResourceGroupName -Name $OSDisk.Name | Remove-AzDisk -Force