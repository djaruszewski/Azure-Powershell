$AccountName = "appstore40008989121"
$ResourceGroupName="powershell-grp"

$StorageAccount = Get-AzStorageAccount -Name $AccountName `
-ResourceGroupName $ResourceGroupName

$FileShareConfig=@{
    Context=$StorageAccount.Context
    Name ="data"
}

# splatting

New-AzStorageShare @FileShareConfig

$DirectoryDetails=@{
    Context=$StorageAccount.Context
    ShareName = "data"
    Path="files"
}

New-AzStorageDirectory @DirectoryDetails

$FileDetails=@{
    Context=$StorageAccount.Context
    ShareName = "data"
    Source="sample.txt"
    Path="/files/sample.txt"
}

Set-AzStorageFileContent @FileDetails