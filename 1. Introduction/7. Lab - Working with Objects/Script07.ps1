$Mobiles=@(
[PSCustomObject]@{
    Brand = "Samsung"
    Model="Galaxy S22 Ultra"
    Storage=@("128GB","256GB","512GB")
    Colors=@("Burgundy","Phantom Black","Green")
    Defaultapps=@(
        @{
            Name="Assist App"
            Status="Installed"
            Version=1.0
        },
        @{
            Name="Browser App"
            Status="Installed"
            Version=2.0
        }
    )
},
[PSCustomObject]@{
    Brand = "Samsung"
    Model="Galaxy S22"
    Storage=@("128GB","256GB")
    Colors=@("Burgundy","Phantom Black","Pink Gold")
    Defaultapps=@(
        @{
            Name="Assist App"
            Status="Installed"
            Version=1.0
        },
        @{
            Name="Browser App"
            Status="Installed"
            Version=2.0
        }
    )
}
)

$Mobiles
$Mobiles[0]

$Mobiles | Where-Object {$_.Model -eq "Galaxy S22"}
| Select-Object -Property Model,Storage

$Mobiles[0].Storage[0]

$Mobiles[0].Defaultapps.Item(0)

foreach($app in $Mobiles[0].Defaultapps)
{
    $app.Version
    $app.Name
    $app.Status
}