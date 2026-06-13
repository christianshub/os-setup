echo "Using old context menu"
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

echo "Set grey background color"
reg add "HKEY_CURRENT_USER\Control Panel\Colors" /v Background /t REG_SZ /d "128 128 128" /f

echo "Remove system sounds"
reg add "HKEY_CURRENT_USER\AppEvents\Schemes\Apps\.Default" /v "\.Current" /t REG_SZ /d "No Sounds" /f

taskkill /f /im explorer.exe
start explorer.exe
pause
