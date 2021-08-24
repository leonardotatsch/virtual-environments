#Script to install NET48 without helpers

Invoke-WebRequest https://download.visualstudio.microsoft.com/download/pr/014120d7-d689-4305-befd-3cb711108212/0307177e14752e359fde5423ab583e43/ndp48-devpack-enu.exe -OutFile C:\ndp48-devpack-enu.exe
Start-Sleep -s 5
Start-Process C:\ndp48-devpack-enu.exe -ArgumentList "/q /norestart" -Wait
Start-Sleep -s 5
Restart-Computer