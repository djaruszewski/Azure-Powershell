# Functions

function Get-Appversion {
    $PSVersionTable
    
}

Get-Appversion

function Add-Integers([int]$x, [int]$y)
{
    'The sum of the Integers is ' +($x+$y)
}

Add-Integers 10 20

function Get-Course
{
    param(
        [Object[]] $CourseList
    )

    foreach($course in $CourseList)
{
    $Course.Id
    $Course.Name
    $Course.Rating
}
}

$CourseList=@(
    [PSCustomObject]@{
        Id = 1
        Name ='AZ-104 Azure Administrator'
        Rating = 4.7
    },
    [PSCustomObject]@{
        Id = 2
        Name ='AZ-305 Azure Architect Design'
        Rating = 4.8
    },
    [PSCustomObject]@{
        Id = 3
        Name ='AZ-500 Azure Security'
        Rating = 4.9
    }
)

Get-Course $CourseList
