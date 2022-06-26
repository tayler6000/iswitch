Name "iswitch"
OutFile "C:\Users\Tayler Porter\Desktop\iswitch\installer.x64.exe"

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
	File /oname=iswitch.exe "iswitch.x86_64.exe" 
    CopyFiles C:\Windows\System32\drivers\etc\hosts C:\Windows\System32\drivers\internal.txt
    CopyFiles C:\Windows\System32\drivers\etc\hosts C:\Windows\System32\drivers\external.txt
	SetOutPath "$PROGRAMFILES64\iswitch"
	File "iswitch.bat"
	File "PathEd.exe"
	ExecWait '$PROGRAMFILES64\iswitch\PathEd.exe add "$PROGRAMFILES64\iswitch\\"'
	Delete "$PROGRAMFILES64\iswitch\PathEd.exe"
	WriteUninstaller "$PROGRAMFILES64\iswitch\uninstall.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "DisplayName" "iswitch (64-bit)"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "DisplayVersion" "1.0.1"
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "NoModify" 0x00000001
	WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "NoRepair" 0x00000001
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\iswitch" "UninstallString" "$PROGRAMFILES64\iswitch\uninstall.exe"
SectionEnd

Section "un.main"
	File "PathEd.exe"
	ExecWait '$PROGRAMFILES64\iswitch\PathEd.exe remove "$PROGRAMFILES64\iswitch\\"'
	Delete "$PROGRAMFILES64\iswitch\PathEd.exe"
	Delete "$PROGRAMFILES64\iswitch\iswitch.bat"
	RMDir /r /REBOOTOK "$PROGRAMFILES64\iswitch"
	Delete "C:\Windows\System32\drivers\etc\iswitch.exe"
	DeleteRegKey HKEY_LOCAL_MACHINE "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\iswitch"
SectionEnd
