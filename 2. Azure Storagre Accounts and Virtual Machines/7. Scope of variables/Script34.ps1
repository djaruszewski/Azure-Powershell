
if($i -ne 10)
{
    'The value of i is not equal to 10'
}
else {
    'The value of i is equal to 10'
}

if($i -eq $null)
{
    'i is null'
}
else {
    'i is not null'
}

$i=20
if($i -ne 10)
{
    'The value of i is not equal to 10'
    $i=30
}
else {
    'The value of i is equal to 10'
}