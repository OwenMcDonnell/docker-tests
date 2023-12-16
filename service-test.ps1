$i = 0
$finished = $false

Write-Host "Waiting for Docker to start..."

while ($i -lt (300)) {
  $i +=1
  
  $dockerSvc = (Get-Service com.docker.service -ErrorAction SilentlyContinue)
  if ((Get-Process 'Docker Desktop' -ErrorAction SilentlyContinue) -and $dockerSvc -and $dockerSvc.status -eq 'Running') {
    $finished = $true
    Write-Host "Docker started!"
    break
  }
  Write-Host "Retrying in 5 seconds..."
  sleep 5;
}
