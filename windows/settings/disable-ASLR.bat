echo Set the ASLR registry key to 0 to disable ASLR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d 0 /f

echo Set the bottom-up ASLR registry key to 0 to disable bottom-up ASLR
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "BottomUpRandomization" /t REG_DWORD /d 0 /f

echo Set the heap randomization registry key to 0 to disable heap randomization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Heap" /v "Randomization" /t REG_DWORD /d 0 /f
