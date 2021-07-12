!include MUI2.nsh
Name "Moons Apps On Electron"
OutFile "Setup_MonnsApps_Electron.exe"
InstallDir "$PROGRAMFILES\Moons Apps On Electron"
XPStyle on
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH
!insertmacro MUI_LANGUAGE "Japanese"
!define MUI_ABORTWARNING
Var Checkbox_InstallDocs
Var Dialog_Options
Var InstallDocs
Var Label_DescriptionOptions

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