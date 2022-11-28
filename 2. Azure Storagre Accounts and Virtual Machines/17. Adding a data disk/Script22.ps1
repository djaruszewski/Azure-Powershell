$VmName = "appvm"
$ResourceGroupName = "powershell-grp"
$DiskName = "app-disk"

$Vm=Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName

$vm | Add-AzVMDataDisk -Name $DiskName -DiskSizeInGB 16 -CreateOption Empty `
-Lun 0

$Vm | Update-AzVM