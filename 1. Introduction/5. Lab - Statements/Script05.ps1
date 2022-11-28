$NumberOfVideos=30

if($NumberOfVideos -ge 20)
{
    "Greater or equal to 20"
}
else{
    "Less than 20"
}

# While statement

$i=1
while($i -le 10)
{
    $i
    ++$i
}

# for statement

for($i=1;$i -le 10;++$i)
{
    $i
}

# foreach statement

$CourseVideos='Instroduction','Installation','Variables'
foreach($Course in $CourseVideos)
{
    $Course
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

foreach($course in $CourseList)
{
    $Course.Id
    $Course.Name
    $Course.Rating
}