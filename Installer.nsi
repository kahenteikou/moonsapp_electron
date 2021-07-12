!include MUI2.nsh
LoadLanguageFile "${NSISDIR}\Contrib\Language files\Japanese.nlf"
Name "Moons Apps On Electron"
OutFile "Setup_MonnsApps_Electron.exe"
InstallDir "$PROGRAMFILES\Moons Apps On Electron"
Page directory 
Page instfiles
!define APPDIR "MoonsApps-win32-x64\"
Section
  SetOutPath "$INSTDIR"
  File /r "MoonsApps-win32-x64\"
  WriteUninstaller "$INSTDIR\Uninstall.exe"
  CreateDirectory "$SMPROGRAMS\Moons Apps On Electron"
  SetOutPath "$INSTDIR"
  CreateShortCut "$SMPROGRAMS\Moons Apps On Electron\Moons Apps On Electron.lnk" "$INSTDIR\MoonsApps.exe" ""

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MoonsAppsOnElectron" "DisplayName" "Moons Apps On Electron"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MoonsAppsOnElectron" "UninstallString" '"$INSTDIR\Uninstall.exe"'
SectionEnd

Section "Uninstall"
  Delete "$INSTDIR\Uninstall.exe"
  RMDir /r "$INSTDIR"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\MoonsAppsOnElectron"
SectionEnd