@ECHO OFF&(PUSHD "%~DP0")&(REG QUERY "HKU\S-1-5-19">NUL 2>&1)||(
powershell -Command "Start-Process '%~sdpnx0' -Verb RunAs"&&EXIT)
TITLE ��������� - ��ɾ�Ҽ��˵�
Color 06
mode con:cols=60 lines=18

VER|FINDSTR "5\.[0-9]\.[0-9][0-9]*" > NUL && (
ECHO.&ECHO ��ǰ�汾��֧��WinXP &PAUSE>NUL&EXIT)

rd/s/q "%AppData%\Sublime Text" 2>NUL

:MENU
CLS&ECHO.
ECHO         ____________________________________________
ECHO        ^|                                            ^|
ECHO        ^|   Sublime Text - ��/ɾ�Ҽ��˵�             ^|
ECHO        ^|   ______________________________________   ^|
ECHO        ^|                                            ^|
ECHO        ^|   [1] ��� - Sublime Text �Ҽ��˵���       ^|
ECHO        ^|                                            ^|
ECHO        ^|   [2] ɾ�� - Sublime Text �Ҽ��˵���       ^|
ECHO        ^|                                            ^|
ECHO        ^|   [3] ���� - ���������                    ^|
ECHO        ^|____________________________________________^|
ECHO: 
choice /C:123 /N /M ">      ��������ѡ�� [1,2,3] :"
IF "%ERRORLEVEL%"=="3" start https://www.wgbqr.com&EXIT
IF "%ERRORLEVEL%"=="2" GOTO RemoveMenu
IF "%ERRORLEVEL%"=="1" GOTO AddMenu

:AddMenu
reg add "HKCR\*\shell\Sublime Text" /f /v "" /d "�� &Sublime Text ��" >NUL 2>NUL
reg add "HKCR\*\shell\Sublime Text" /f /v "Icon" /d "%~dp0Sublime Text.exe" >NUL 2>NUL
reg add "HKCR\*\shell\Sublime Text\command" /f /v "" /d "%~dp0Sublime Text.exe \"%%1\"" >NUL 2>NUL
ECHO.&ECHO ��ɣ� &TIMEOUT /t 2 >NUL&CLS&GOTO MENU

:RemoveMenu
reg delete "HKCR\*\shell\Sublime Text" /f >NUL 2>NUL
reg delete "HKLM\*\shell\Sublime Text" /f >NUL 2>NUL
ECHO.&ECHO ��ɣ� &TIMEOUT /t 2 >NUL&CLS&GOTO MENU