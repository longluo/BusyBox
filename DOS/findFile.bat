rem
rem findFile���Ұ����ַ������ļ������г����ַ����ڸ��ļ����ڵ��С�
rem ��һ������Ҫ���ҵ��ַ�����
rem �ڶ������������ַ������ļ���֧���������ǡ�
rem ע1��ϵͳ��find�����������Ŀ¼�в��ң���findFile������Ŀ¼�в���
rem ע2��findFileֻ���г������ַ������ļ�����ϵͳ��find������г�û�а����ַ������ļ������磺---------- 1.TXT��
rem ʹ��ʵ��
rem ʵ��1��
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