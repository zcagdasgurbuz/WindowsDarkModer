@echo off

FOR /F "tokens=2* skip=2" %%a in ('reg query "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme"') do set value=%%b

if %value% == 0x0 (SET decision=1) else (SET decision=0)

REM this will make the apps use dark mode
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /f /v "AppsUseLightTheme" /t REG_DWORD /d %decision%
REM this will also switch windows theme
REG ADD "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /f /v "SystemUsesLightTheme" /t REG_DWORD /d %decision%

