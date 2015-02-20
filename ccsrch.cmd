@echo off
REM Search entire drive for credit card data

if %1=="" goto usage
for /f "tokens=1,2,3,4 delims=/ " %%a in ('date /t') do set datenum=%%b%%c%%d
set filename=%computername%_%username%_%datenum%_binfiles_excluded.txt
echo Results will be in %filename%
ccsrch_win32.exe -m -l 100 -b -e -T -s -n .plist,.class,.svn-base,.eps,.dll,.exe,.dng,.png,.bmp,.pdf,.wmv,.avi,.rtf,.msi,.zip,.7z,.tiff,.tif,.cab,.jpg,.gif,.jar,.pdb,.mst -o NUL %1 > %filename%
goto end

:usage
ECHO.
ECHO ccsrch.cmd path - A script to automate PAN searches
ECHO.
ECHO You didn't use this script correctly!
ECHO Enter a drive or path for us to search in, please.
ECHO For example: ccsrch.cmd D:\
ECHO Or: ccsrch.cmd "C:\Program Files\POSSoftware"
ECHO.

:end
ECHO ***Complete***
pause
