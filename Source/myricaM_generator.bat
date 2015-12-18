@echo off
set PATH=%~dp0..\..\cygwin\bin;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\system32\Wbem
set CYGWIN=nodosfilewarning
set HOME=%~dp0
set LANG=C.UTF-8
set TZ=
set DISPLAY=:9.0
set AUTOTRACE=potrace

del ..\Work\MyricaMM.ttf
del ..\Work\MyricaMP.ttf
del ..\Work\MyricaMN.ttf

start /B XWin.exe :9 -multiwindow -nomultimonitors -silent-dup-error

xwin-close.exe -wait
fontforge.exe  -lang=py -script myricaM_generator.py
xwin-close.exe -close

echo .
echo TTC�̍쐬
..\..\UniteTTC.exe ..\product\MyricaM.TTC  ..\Work\MyricaMM.ttf  ..\Work\MyricaMP.ttf  ..\Work\MyricaMN.ttf

echo .
echo ���k�t�@�C���̍쐬
..\..\7za.exe a -m0=LZMA2 -mx=9 -ms=on -mhc=on ..\product\MyricaM.7z  ..\product\LICENSE_M+.txt ..\product\LICENSE_OFL.txt ..\product\MyricaM.TTC ..\README.md ..\product\MyricaM_���ŗ���.md
..\..\7za.exe a                                ..\product\MyricaM.zip ..\product\LICENSE_M+.txt ..\product\LICENSE_OFL.txt ..\product\MyricaM.TTC ..\README.md ..\product\MyricaM_���ŗ���.md

pause
