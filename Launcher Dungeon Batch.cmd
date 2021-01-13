@echo off 
title Launcher Dungeon Batch
mode con cols=82 lines=27
COLOR 7
set in=%~dp0
If not exist "Fichiers Dungeon" goto erreur
cd %in%\Fichiers Dungeon
batbox /h 0
echo.
echo    ����������������������������������ͻ   ����������������������������������ͻ
echo    �                                  �   �                                  �
echo    �                                  �   �                                  �
echo    �        �����������������         �   �         M�canique du Jeu         �
echo    �                                  �   �                                  �
echo    �                                  �   �           �   Aide   �           �
echo    �                                  �   �                                  �
echo    �        �����������������         �   �                                  �
echo    �                                  �   ����������������������������������͹
echo    �                                  �   �                                  �
echo    �                                  �   �                                  �
echo    �                                  �   �           Informations           �
echo    �                                  �   �                                  �
echo    �        �              �          �   �           � A propos �           �
echo    �        �              �          �   �                                  �
echo    �        �              �          �   �                                  �
echo    �        �              �          �   ����������������������������������͹
echo    �        �              �          �   �                                  �
echo    �                                  �   �                                  �
echo    �                                  �   �         Personnalisation         �
echo    �                                  �   �                                  �
echo    �                                  �   �           � Options �            �
echo    �                                  �   �                                  �
echo    �                                  �   �                                  �
echo    ����������������������������������ͼ   ����������������������������������ͼ

batbox /g 13 6 /c 0x03 /d "Dungeon Batcher" /g 57 6 /c 0x03 /d " Aide" /g 56 22 /c 0x03 /d "Options" /g 55 14 /c 0x03 /d " A propos" /g 17 15 /a 3 /g 22 15 /a 4 /g 17 17 /a 5 /g 22 17 /a 6 /g 0 26 /c 0x03

:loop
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)

If %x% gtr 5 if %x% lss 38 if %y% gtr 1 if %y% lss 25 goto :N
If %x% gtr 43 if %x% lss 78 if %y% gtr 1 if %y% lss 8 goto :C
If %x% gtr 43 if %x% lss 78 if %y% gtr 17 if %y% lss 25 goto :O
If %x% gtr 43 if %x% lss 78 if %y% gtr 8 if %y% lss 17 goto :H

goto loop


:N
start "%in%\Fichiers Dungeon" "Dungeon Batcher.cmd"
exit

:C
start
exit

:O
start
exit

:H
start
exit

:erreur
echo.
echo                    ������          Erreur            �������
echo.
echo.
echo        Il semblerait que vous avez d�plac�/supprim� les fichiers du jeu.
echo.
echo    Je vous invite � les r�installer � l'aide de l'installateur Dungeon Batch.
pause >nul  