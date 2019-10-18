Write-Host "`n#> " -ForegroundColor DarkGreen -NoNewline;  Write-Host "Profile path is:`n"
Write-Host $profile 

if (!(Test-Path $profile))
{
   New-Item -Path $profile -ItemType File -Force
}
    

$From = Get-Content -Path .\docker-helper-methods.ps1
Add-Content -Path $profile -Value $From

Write-Host "`n>> " -ForegroundColor DarkGreen -NoNewline; Write-Host "Current profile content is:`n"
Get-Content -Path $profile
Write-Host "`n<< " -ForegroundColor DarkGreen -NoNewline; Write-Host "Done! `n"
