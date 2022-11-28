$ResourceGroupName="powershell-grp"
$Location="East US"

$AppId="02afc650-f331-4a86-9dad-71dd4d243374"
$AppSecret="hEv8Q~zXs2NIrGMLSCkBhV5O3MlO5s5JiDAxKbTs"

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

$TentantID="dc66e2a5-9b79-4456-8e72-2331399082ec"

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TentantID
New-AzResourceGroup -Name $ResourceGroupName -Location $Location