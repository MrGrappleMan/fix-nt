Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'CSEnabled' -Value 0 -Force
    $PowerSettings = Get-ChildItem -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerSettings' -Recurse -Depth 1 | Where-Object { $_.PSChildName -NotLike 'DefaultPowerSchemeValues' -and $_.PSChildName -NotLike '0' -and $_.PSChildName -NotLike '1' }
    ForEach ($item in $PowerSettings) { Set-ItemProperty -Path ($item).Name.Replace('HKEY_LOCAL_MACHINE','HKLM:') -Name 'Attributes' -Value 2 -Force }
