# install guide

first, you need Policy configuration for run ps1 script

```
Set-ExecutionPolicy Unrestricted
```

running script
```
Invoke-WebRequest "https://raw.githubusercontent.com/YoonHyunWoo/vanilla-setting-script/main/vanilla-setting.ps1" -OutFile "vanilla-setting.ps1"
.\vanilla-setting.ps1
```

# Trouble Shooting

* Invoke-WebRequest : 요청이 중단되었습니다. SSL/TLS 보안 채널을 만들 수 없습니다.


  ```
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  ```
