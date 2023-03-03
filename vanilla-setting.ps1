# Git 설치
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.39.2.windows.1/Git-2.39.2-64-bit.exe" -OutFile "$env:TEMP\Git-2.39.2-64-bit.exe"
Start-Process -FilePath "$env:TEMP\Git-2.39.2-64-bit.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\Git-2.39.2-64-bit.exe"

# Visual Studio Code 설치
Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "$env:TEMP\VSCodeSetup.exe"
Start-Process -FilePath "$env:TEMP\VSCodeSetup.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\VSCodeSetup.exe"

# Firefox 설치
Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=ko" -OutFile "$env:TEMP\FirefoxInstaller.exe"
Start-Process "$env:TEMP\FirefoxInstaller.exe" -ArgumentList '/S' -Wait
Remove-Item "$env:TEMP\FirefoxInstaller.exe"

# 카카오톡 설치
Invoke-WebRequest -Uri "https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe" -OutFile "$env:TEMP\KakaoTalk_Setup.exe"
Start-Process -FilePath "$env:TEMP\KakaoTalk_Setup.exe" -ArgumentList '/VERYSILENT', '/NORESTART', '/S' -Wait
Remove-Item "$env:TEMP\KakaoTalk_Setup.exe"

# PuTTY 설치
Invoke-WebRequest -Uri "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.78-installer.msi" -OutFile "$env:TEMP\putty-64bit-0.78-installer.msi"
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i `""$env:TEMP\putty-64bit-0.78-installer.msi"`" /quiet /norestart" -Wait
Remove-Item $puttyInstallerPath

# Notion 설치
Invoke-WebRequest -Uri "https://www.notion.so/desktop/windows/download" -OutFile "$env:TEMP\notion-installer.exe"
Start-Process -FilePath "$env:TEMP\notion-installer.exe" -ArgumentList '/VERYSILENT', '/NORESTART', '/S' -Wait
Remove-Item "$env:TEMP\notion-installer.exe"`