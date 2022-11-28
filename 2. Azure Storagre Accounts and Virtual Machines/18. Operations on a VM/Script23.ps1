$VmName="appvm"
$ResourceGroupName="powershell-grp"
$DesiredVMSize="Standard_DS1_v2"

$Vm=Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName

if($Vm.HardwareProfile.VmSize -ne $DesiredVMSize)
{
$Vm.HardwareProfile.VmSize=$DesiredVMSize
$Vm | Update-AzVM
'The size of the VM has been modified'
}
else{
    'The VM is already of the desired size'
}