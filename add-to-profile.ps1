Write-Output "`nProfile path is:"
Write-Output "`n----------------------------------`n"
Write-Output $profile 
Write-Output "`n=================================="

$From = Get-Content -Path .\docker-helper-methods.ps1
Add-Content -Path $profile -Value $From

Write-Output "`nCurrent profile content is:"
Write-Output "`n----------------------------------`n"
Get-Content -Path $profile
Write-Output "`n==================================`n"
Write-Output "Done!`n"