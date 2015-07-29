rem
rem findFile查找包含字符串的文件，并列出该字符串在该文件所在的列。
rem 第一参数：要查找的字符串。
rem 第二参数：查找字符串的文件。支持正规表达是。
rem 注1：系统的find命令并不会在子目录中查找，而findFile会在子目录中查找
rem 注2：findFile只会列出包含字符串的文件，而系统的find命令还会列出没有包含字符串的文件。比如：---------- 1.TXT。
rem 使用实例
rem 实例1：
rem 	findFile "temp" *.txt

set fileName=%2
set temp=%0~temp.txt
set string=%string:"=%
if not defined string (
goto popvar
)
if not defined fileName (
set fileName=*
)
if exist %temp% (
del %temp% /q
)
FOR /F "delims=" %%i IN ('dir %fileName% /s/b/a:-d') DO (
find /n "%string%" "%%i">>%temp%
)
FOR /F "usebackq tokens=1,* delims= " %%i IN (%temp%) DO (
if "%%i" NEQ "----------" (
if defined fileName (
echo !fileName!
set fileName=
)
echo %%i
) else (
set fileName=%%j
)
)
if exist %temp% (
del %temp% /q
)
:popvar
set string=!%0~string!
set fileName=!%0~fileName!
set temp=!%0~temp!
:end