Name "iswitch"
OutFile "installer.x32.exe"

Page license
LicenseData "LICENSE.txt"
PageEx "license"
LicenseData "PathEd.txt"
PageExEnd
Page instfiles
UninstPage uninstConfirm
UninstPage instfiles

Section "main"
	SetOutPath "C:\Windows\System32\drivers\etc"
	File /oname=iswitch.exe "iswitch.i686.exe" 
    CopyFiles C:\Windows\System32\drivers\etc\hosts C:\Windows\System32\drivers\etc\internal.config
    CopyFiles C:\Windows\System32\drivers\etc\hosts C:\Windows\System32\drivers\etc\external.config
	SetOutPath "$PROGRAMFILES\iswitch"
	File "iswitch.bat"
	File "PathEd.exe"
	ExecWait '$PROGRAMFILES\iswitch\PathEd.exe add "$PROGRAMFILES\iswitch\\"'
	Delete "$PROGRAMFILES\iswitch\PathEd.exe"
	WriteUninstaller "$PROGRAMFILES\iswitch\uninstall.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "DisplayName" "iswitch (32-bit)"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "DisplayVersion" "1.1.0"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "NoModify" 0x00000001
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "NoRepair" 0x00000001
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "UninstallString" "$PROGRAMFILES\iswitch\uninstall.exe"
SectionEnd

Section "un.main"
	File "PathEd.exe"
	ExecWait '$PROGRAMFILES\iswitch\PathEd.exe remove "$PROGRAMFILES\iswitch\\"'
	Delete "$PROGRAMFILES\iswitch\PathEd.exe"
	Delete "$PROGRAMFILES\iswitch\iswitch.bat"
	RMDir /r /REBOOTOK "$PROGRAMFILES\iswitch"
	Delete "C:\Windows\System32\drivers\etc\iswitch.exe"
	DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\iswitch"
SectionEnd
