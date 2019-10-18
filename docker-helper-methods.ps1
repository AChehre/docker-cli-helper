
# Docker helper methods
# Add this script to the end of Microsoft.PowerShell_profile file manually of use add-to-profile.ps1

# "Stop all containers."
function dockerstop {
  [CmdletBinding()]
  [Alias("docker-stop")]
  PARAM ()

  $containers = docker ps -aq
  if(-not ([string]::IsNullOrEmpty($containers)))
  {
    Write-Host "`n#> "-ForegroundColor Red -NoNewline; Write-Host "Docker containers:`n" 
    docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}"
    Write-Host "`n>> " -ForegroundColor Red -NoNewline; Write-Host "Docker stop started ...`n" 
    docker stop $containers
    Write-Host "`n<< " -ForegroundColor Red -NoNewline; Write-Host "Docker stop done.`n"
  } Else {
    Write-Host "There is not any containers ..." -ForegroundColor DarkGreen
  }
}

# "Remove all containers."
function dockerrm {
  [CmdletBinding()]
  [Alias("docker-rm")]
  PARAM ()
  $containers = docker ps -aq
  if(-not ([string]::IsNullOrEmpty($containers)))
  {
    Write-Host "`n#> "-ForegroundColor Red -NoNewline; Write-Host "Docker containers:`n" 
    docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}"
    Write-Host "`n>> " -ForegroundColor Red -NoNewline; Write-Host "Docker rm started ...`n" 
    docker rm $containers
    Write-Host "`n<< " -ForegroundColor Red -NoNewline; Write-Host "Docker rm done.`n"
  } Else {
    Write-Host "There is not any containers ..." -ForegroundColor DarkGreen
  }
}

# "Remove all images."
function dockerrmi {
  [CmdletBinding()]
  [Alias("docker-rmi")]
  PARAM ()
   $images = docker images -aq
  if(-not ([string]::IsNullOrEmpty($images)))
  {
    Write-Host "`n#> "-ForegroundColor Red -NoNewline; Write-Host "Docker images:`n" 
    docker ps -a --format  "table {{.ID}}\t{{.Repository}}\t{{.Tag}}"
    Write-Host "`n>> " -ForegroundColor Red -NoNewline; Write-Host "Docker rmi started ...`n" 
    docker rmi $images
    Write-Host "`n<< " -ForegroundColor Red -NoNewline; Write-Host "Docker rmi done.`n" 
  } Else {
    Write-Host "There is not any images ..." -ForegroundColor DarkGreen
  }

}

# "Stop all containers and remove all containers."
function dockerstoprm {
  [CmdletBinding()]
  [Alias("docker-stop-rm")]
  PARAM ()
  dockerstop
  dockerrm
}


# "Stop all containers and remove all containers and remove all images."  
function dockerclear {
  [CmdletBinding()]
  [Alias("docker-clear")]
  PARAM ()
  dockerstoprm
  dockerrmi
}

# "Calling 'container prune' and 'network prune'"  
function dockerclean {
  [CmdletBinding()]
  [Alias("docker-clean")]
  PARAM ()
  docker container prune
  docker network prune
}

# "docker system prune"
function dockerprune {
  [CmdletBinding()]
  [Alias("docker-prune")]
  PARAM ()
  docker system prune
}

# End of Docker methods
