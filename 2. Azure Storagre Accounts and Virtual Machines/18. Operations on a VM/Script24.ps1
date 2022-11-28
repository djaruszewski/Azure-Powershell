$VmName="appvm"
$ResourceGroupName="powershell-grp"

$Statuses=(Get-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName -Status).Statuses

if($Statuses[1].Code -eq "PowerState/running")
{
    'Shutting down the virtual machine'
    Stop-AzVM -ResourceGroupName $ResourceGroupName -Name $VmName -Force
}
else{
    'The machine is not in the running state'
}