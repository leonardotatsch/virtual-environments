#Script to install NET48 and NET472 without helpers

Invoke-WebRequest https://download.visualstudio.microsoft.com/download/pr/014120d7-d689-4305-befd-3cb711108212/0307177e14752e359fde5423ab583e43/ndp48-devpack-enu.exe -OutFile C:\ndp48-devpack-enu.exe
Start-Sleep -s 5
Invoke-WebRequest https://download.visualstudio.microsoft.com/download/pr/158dce74-251c-4af3-b8cc-4608621341c8/9c1e178a11f55478e2112714a3897c1a/ndp472-devpack-enu.exe -OutFile C:\ndp472-devpack-enu.exe
Start-Sleep -s 5
Start-Process C:\ndp48-devpack-enu.exe -ArgumentList "/q /norestart" -Wait
Start-Sleep -s 5
Start-Process C:\ndp472-devpack-enu.exe -ArgumentList "/q /norestart" -Wait
Start-Sleep -s 5
Restart-Computer