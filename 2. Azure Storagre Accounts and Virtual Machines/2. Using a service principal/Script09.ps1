$ResourceGroupName="powershell-grp"
$Location="East US"

$AppId="cherrytree"
$AppSecret="cherrytree"

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

$TentantID="cherrytree"

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TentantID
New-AzResourceGroup -Name $ResourceGroupName -Location $Location