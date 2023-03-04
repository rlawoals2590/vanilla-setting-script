Write-Output "Configure Start.."

Start-Job -name "Configure Windows Dark Mode" -ScriptBlock {
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -PropertyType DWORD -Force | Out-Null
}

Start-Job -name "Git installing" -ScriptBlock { 
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.39.2.windows.1/Git-2.39.2-64-bit.exe" -OutFile "$env:TEMP\Git-2.39.2-64-bit.exe"
Start-Process -FilePath "$env:TEMP\Git-2.39.2-64-bit.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\Git-2.39.2-64-bit.exe"
}

Start-Job -name "VSC installing" -ScriptBlock {
Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "$env:TEMP\VSCodeSetup.exe"
Start-Process -FilePath "$env:TEMP\VSCodeSetup.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\VSCodeSetup.exe"
}

Start-Job -name "Firefox installing" -ScriptBlock {
Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=ko" -OutFile "$env:TEMP\FirefoxInstaller.exe"
Start-Process "$env:TEMP\FirefoxInstaller.exe" -ArgumentList '/S' -Wait
Remove-Item "$env:TEMP\FirefoxInstaller.exe"
}

Start-Job -name "Kakaotalk installing"  -ScriptBlock {
Invoke-WebRequest -Uri "https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe" -OutFile "$env:TEMP\KakaoTalk_Setup.exe"
Start-Process -FilePath "$env:TEMP\KakaoTalk_Setup.exe" -ArgumentList '/VERYSILENT', '/NORESTART', '/S' -Wait
Remove-Item "$env:TEMP\KakaoTalk_Setup.exe"   
}

Start-Job -name "PuTTY installing" -ScriptBlock {
Invoke-WebRequest -Uri "https://the.earth.li/~sgtatham/putty/latest/w64/putty-64bit-0.78-installer.msi" -OutFile "$env:TEMP\putty.msi"
Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\putty.msi`" /quiet /norestart" -Wait
Remove-Item "$env:TEMP\putty.msi"
}

Start-Job -name "Notion installing" -ScriptBlock {
Invoke-WebRequest -Uri "https://desktop-release.notion-static.com/Notion%20Setup%202.0.41.exe" -OutFile "$env:TEMP\notion-installer.exe"
Start-Process -FilePath "$env:TEMP\notion-installer.exe" -ArgumentList '/VERYSILENT', '/NORESTART', '/S' -Wait
Remove-Item "$env:TEMP\notion-installer.exe"
}

Start-Job -name "golang installing" -ScriptBlock {
Invoke-WebRequest -Uri "https://go.dev/dl/go1.20.1.windows-amd64.msi" -OutFile "$env:TEMP\go.msi"
Start-Process -FilePath msiexec.exe -ArgumentList "/i `"$env:TEMP\go.msi`" /quiet /norestart" -Wait
Remove-Item "$env:TEMP\go.msi"
}

Write-Output "Job Creating Complete. if you want watch job process, you can see using 'Get-job'"