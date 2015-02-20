@echo off
REM #
REM # ccsrch (c) 2012 Adam Caudill <adam@adamcaudill.com>
REM # All rights reserved
REM #
REM #
REM # This program is free software; you can redistribute it and/or
REM # modify it under the terms of the GNU General Public License
REM # as published by the Free Software Foundation; either version 2
REM # of the License, or (at your option) any later version.
REM #
REM # This program is distributed in the hope that it will be useful,
REM # but WITHOUT ANY WARRANTY; without even the implied warranty of
REM # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
REM # GNU General Public License for more details.
REM #
REM # You should have received a copy of the GNU General Public License
REM # along with this program; if not, write to the Free Software
REM # Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
REM #
REM #
REM # This is a test script that will build, and run ccsrch; if you have the testdata.txt
REM # file in place, it will pick that up so that you can see the reults.
REM #
REM mingw32-make clean
REM mingw32-make all
REM ccsrch -b -T ./
ccsrch_win32.exe -m -l 100 -b -e -T c:\ -c -n .plist,.class,.svn-base,.eps,.dll,.exe,.dng,.png,.nef,.bmp,.pdf,.wmv,.rtf,.msi,.zip,.7z,.tiff,.tif,.cab,.psd,.jpg,.gif,.jar -o NUL > ccsrch_log.txt
pause
