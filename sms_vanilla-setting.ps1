Write-Output "Configure Start.."

Start-Job -name "Configure Windows Dark Mode" -ScriptBlock {
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 -PropertyType DWORD -Force | Out-Null
}

Start-job -name "Node-js installing" -ScriptBlock{
Invoke-WebRequest -Url "https://nodejs.org/dist/v18.15.0/node-v18.15.0-x64.msi" -OutFile "$env:TEMP\node-js.exe"
Start-Process -FilePath "$env:TEMP\node-js.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\node-js.exe"
}

Start-Job -name "Kakaotalk installing"  -ScriptBlock {
Invoke-WebRequest -Uri "https://app-pc.kakaocdn.net/talk/win32/KakaoTalk_Setup.exe" -OutFile "$env:TEMP\KakaoTalk_Setup.exe"
Start-Process -FilePath "$env:TEMP\KakaoTalk_Setup.exe" -ArgumentList '/VERYSILENT', '/NORESTART', '/S' -Wait
Remove-Item "$env:TEMP\KakaoTalk_Setup.exe"   
}

Start-Job -name "VSC installing" -ScriptBlock {
Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "$env:TEMP\VSCodeSetup.exe"
Start-Process -FilePath "$env:TEMP\VSCodeSetup.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\VSCodeSetup.exe"
}

Start-Job -name "Git installing" -ScriptBlock { 
Invoke-WebRequest -Uri "https://github.com/git-for-windows/git/releases/download/v2.39.2.windows.1/Git-2.39.2-64-bit.exe" -OutFile "$env:TEMP\Git-2.39.2-64-bit.exe"
Start-Process -FilePath "$env:TEMP\Git-2.39.2-64-bit.exe" -ArgumentList '/VERYSILENT', '/NORESTART' -Wait
Remove-Item "$env:TEMP\Git-2.39.2-64-bit.exe"
}