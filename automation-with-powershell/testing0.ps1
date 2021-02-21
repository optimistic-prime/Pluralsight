# $a = 1..10
# $a.count
# $a -is [array]
# $a | Get-Member
# $a
# $a[0]
# $a | ForEach-Object { $_ *2 } | Measure-Object -Sum -Average

# Get-Process | Where-Object StartTime | Select-Object Name,Id,@{Name='Run';Expression={(Get-Date)-$_.starttime}} | Sort-Object -Property Run -Descending | Select-Object -First 5

Get-Process | Where-Object StartTime | foreach {
    [PSCustomObject]@{
        Name = $_.Name
        Id = $_.Id
        Run = ((Get-Date)-$_.StartTime)
    } 
} | Sort-Object -Property Run -Descending | Select-Object -Last 5