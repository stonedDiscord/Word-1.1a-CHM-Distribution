echo off
set MAKEOPUS=
set PATH=C:\SRC\OPUS\TOOLS\tools\dos;C:\SRC\OPUS\TOOLS\tools
set LIB=C:\SRC\OPUS\TOOLS\lib
set INCLUDE=C:\SRC\OPUS\TOOLS;C:\SRC\OPUS\TOOLS\wordtech;C:\SRC\OPUS\TOOLS\lib;C:\SRC\OPUS\TOOLS\asm
touch error.snt
del error.snt
echo rem > mo2.bat
echo echo off >> mo2.bat
NMAKE -nc @makeopus.cm -f C:\SRC\OPUS\TOOLS\makeopus /?  >> mo2.bat
if errorlevel 1 goto error
echo goto done >> mo2.bat
echo :error >> mo2.bat
echo makeerr C:\SRC\OPUS\TOOLS\error.snt >> mo2.bat
echo :done >> mo2.bat
grep "is up-to-date" mo2.bat > NUL
if not errorlevel 1 goto skip
mo2
:error
makeerr C:\SRC\OPUS\TOOLS\error.snt
:skip
