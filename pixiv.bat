@echo off 
md backup
title pixiv-hosts verion0.1 by snslogty
mode con cols=50 lines=26
cls
if exist %systemdrive%\Windows\System32\drivers\etc\hosts (echo hosts check successful) else (goto err)
if exist aria2c.exe (goto main) else (goto noaria)
:main
echo ע��:�ù���ԱȨ�޴�
echo 1.����pվhosts������ԭ����hosts
echo 2.�ָ�ԭ����hosts(���б���)
choice /c 12 /n
if %errorlevel%==1 (goto cho1)
if %errorlevel%==2 (goto cho2) 
:cho1
set webhost =https://raw.githubusercontent.com/SNSLogty/pixiv-hosts/master/hosts
goto create
:create
del hosts
aria2c.exe https://raw.githubusercontent.com/SNSLogty/pixiv-hosts/master/hosts
if exist hosts (echo download complete) else (goto err)
goto create1
:create1
copy %systemdrive%\Windows\System32\drivers\etc\hosts backup\bchosts
move /y hosts C:\Windows\System32\drivers\etc\hosts
ipconfig /flushdns
echo done 
pause
exit
:cho2
if exist backup\bchosts (goto recover1) else (echo nobackup)
goto main
:recover1
move %~dp0backup\bchosts C:\Windows\System32\drivers\etc\hosts
echo done2
pause
exit
:noaria
echo no aria2c.exe
pause
:err
echo error
pause
