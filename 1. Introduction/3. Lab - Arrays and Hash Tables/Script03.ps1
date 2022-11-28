$CourseVideos='Introduction','Installation','Variable'

$CourseVideos
$CourseNumbers= 1,2,3

$CourseNumbers

$CourseVideos_1=@(
    'Introduction'
    'Installation'
    'Variable'
)

$CourseVideos_1

$CourseVideos_1[0]

$CourseVideos_1[1]='Configuration'

$CourseVideos_1

<# Hash tables
 Key/values - Comments #>

$ServerName=@{
    Development='Server01'
    Testing='Server02'
    Production='Server03'
}

$ServerName['Development']
$ServerName.Development

$ServerName.Add('QA','Server04')
$ServerName