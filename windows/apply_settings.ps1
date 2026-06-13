$settings_dir = 'settings'
Invoke-Expression -Command ('.\{0}\vscode_extensions.ps1' -f $settings_dir)
Start-Process -FilePath (".\{0}\ui.bat" -f $settings_dir) -Verb runas
Start-Process -FilePath (".\{0}\disable-ASLR.bat" -f $settings_dir) -Verb runas
Start-Process -FilePath (".\{0}\disable-gamebar.bat" -f $settings_dir) -Verb runas
