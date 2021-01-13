@echo off
title Inventaire
mode con cols=39 lines=20
Setlocal Enabledelayedexpansion

batbox /h 0
set in=%~dp0
set ch=i
set "clear=                               "
set bug=1

:k
cls
cd "%in%\Fichiers de Sauvegarde"
for /f "tokens=1,2,3 delims=-" %%a in (J.data) do (
set pcou=%%c
set pn=%%b
set name=%%a
)

set pcou=%pcou:"=%
set pn=%pn:"=%
set name=%name:"=%

rem --------
for /f "delims=" %%i in (Vie.data) do set vie=%%i
rem --------
for /f "delims=" %%i in (Inv.data) do set inv=%%i
rem --------
for /f "delims=" %%i in (Clef.data) do set clef=%%i
rem --------
for /f "delims=" %%i in (Niveau.data) do set niveau=%%i

set num=%niveau:~6,7%
cd %in%

If %pcou%==3 If %pn%==12 set a=1
If %pcou%==9 If %pn%==12 set a=2
If %pcou%==D If %pn%==12 set a=3
If %pcou%==A If %pn%==12 set a=4
If %pcou%==E If %pn%==2 set a=5
If %pcou%==3 If %pn%==2 set a=6
If %pcou%==E If %pn%==1 set a=7
If %pcou%==C If %pn%==3 set a=8


batbox /g 0 0 /c 0x07
echo      컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴              
echo      컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

call :descsion
goto a


:a

call :cls1

if %ch%==i call :inventaire
if %ch%==p call :pouvoir
if %ch%==m ( call :info
call :a%a% )

:b
cd "%in%\Fichiers de Sauvegarde"
for /f "tokens=1,2,3 delims=-" %%a in (J.data) do (
set pcou=%%c
set pn=%%b
set name=%%a
)

set pcou=%pcou:"=%
set pn=%pn:"=%
set name=%name:"=%

rem --------
for /f "delims=" %%i in (Vie.data) do set vie=%%i
rem --------
for /f "delims=" %%i in (Inv.data) do set inv=%%i
rem --------
for /f "delims=" %%i in (Clef.data) do set clef=%%i
rem --------
for /f "delims=" %%i in (Niveau.data) do set niveau=%%i

set num=%niveau:~6,7%
cd %in%


If %ch%==i call :actuinve

:loop


batbox /g 38 19 /c 0x07 /d ""
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)

If %x% gtr 0 if %x% LSS 5 if %y% GTR 0 if %y% LSS 6 ( set ch=i
goto a )
If %x% gtr 0 if %x% LSS 5 if %y% GTR 5 if %y% LSS 12 ( set ch=p
goto a )
If %x% gtr 0 if %x% LSS 5 if %y% GTR 11 if %y% LSS 19 ( set ch=m
goto a )

if %ch%==i call :loopi
iF %ch%==m call :loopm
If %x% gtr 0 if %x% LSS 38 if %y% GTR 0 if %y% LSS 18 if %c%==1 call :cls2

goto b



:loopi

If %speed% GTR 0 if %x% GTR 8 if %x% LSS 12 if %y% GTR 3 if %y% LSS 6 goto des1
If %tel% GTR 0 If %x% GTR 14 if %x% LSS 18 if %y% GTR 3 if %y% LSS 6 goto des2
If %inv% GTR 0 If %x% GTR 20 if %x% LSS 24 if %y% GTR 3 if %y% LSS 6 goto des3
If %inv% GTR 0 If %x% GTR 26 if %x% LSS 30 if %y% GTR 3 if %y% LSS 6 goto des4
If %inv% GTR 0 If %x% GTR 32 if %x% LSS 36 if %y% GTR 3 if %y% LSS 6 goto des5

If %inv% GTR 0 If %x% GTR 8 if %x% LSS 12 if %y% GTR 7 if %y% LSS 10 goto des6
If %inv% GTR 0 If %x% GTR 14 if %x% LSS 18 if %y% GTR 7 if %y% LSS 10 goto des7
If %inv% GTR 0 If %x% GTR 20 if %x% LSS 24 if %y% GTR 7 if %y% LSS 10 goto des8
If %inv% GTR 0 If %x% GTR 26 if %x% LSS 30 if %y% GTR 7 if %y% LSS 10 goto des9
If %inv% GTR 0 If %x% GTR 32 if %x% LSS 36 if %y% GTR 7 if %y% LSS 10 goto des10

goto :eof

REM INVENTAIRE CASE ---------------------------------------------------------------------

:des1
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur."  /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "1"
goto loop

:des2
call :cls2
batbox /g 6 16 /d "      Teleporte le joueur." /g 13 16 /a 130 /g 15 16 /a 130  /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "2"
goto loop

:des3
call :cls2
batbox /g 6 16 /d "  Rend invulnerable (10 sec)."  /g 19 16 /a 130 /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "3"
goto loop

:des4
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "4"
goto loop

:des5
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "5"
goto loop

:des6
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "6"
goto loop

:des7
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "7"
goto loop

:des8
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "8"
goto loop

:des9
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez   en jeu pour l'utiliser." /g 13 18 /c 0x03 /d "9"
goto loop

:des10
call :cls2
batbox /g 6 16 /d "  Double la vitesse du joueur." /g 6 18 /d " Tapez    en jeu pour l'utiliser" /g 13 18 /c 0x03 /d "10"
goto loop

rem ------------------------------------------------------------------------------------------------------------------------------------------

:inventaire
batbox /g 7 1 /c 0x03 /d "            Inventaire     " /g 0 3 /c 0x03 /d " Inv" /g 0 9 /c 0x07 /d " Pou" /g 0 15 /c 0x07 /d " You" /g 8 4 /a 218 /g 8 5 /a 179 /g 8 6 /a 192 /a 196 /a 196 /a 217 /g 11 5 /a 179 /g 9 4 /a 196 /a 196 /a 191 /g 14 4 /a 218 /g 14 5 /a 179 /g 14 6 /a 192 /a 196 /a 196 /a 217 /g 17 5 /a 179 /g 15 4 /a 196 /a 196 /a 191 /g 20 4 /a 218 /g 20 5 /a 179 /g 20 6 /a 192 /a 196 /a 196 /a 217 /g 23 5 /a 179 /g 21 4 /a 196 /a 196 /a 191 /g 26 4 /a 218 /g 26 5 /a 179 /g 26 6 /a 192 /a 196 /a 196 /a 217 /g 29 5 /a 179 /g 27 4 /a 196 /a 196 /a 191 /g 32 4 /a 218 /g 32 5 /a 179 /g 32 6 /a 192 /a 196 /a 196 /a 217 /g 35 5 /a 179 /g 33 4 /a 196 /a 196 /a 191 /g 8 8 /a 218 /g 8 9 /a 179 /g 8 10 /a 192 /a 196 /a 196 /a 217 /g 11 9 /a 179 /g 9 8 /a 196 /a 196 /a 191 /g 14 8 /a 218 /g 14 9 /a 179 /g 14 10 /a 192 /a 196 /a 196 /a 217 /g 17 9 /a 179 /g 15 8 /a 196 /a 196 /a 191 /g 20 8 /a 218 /g 20 9 /a 179 /g 20 10 /a 192 /a 196 /a 196 /a 217 /g 23 9 /a 179 /g 21 8 /a 196 /a 196 /a 191 /g 26 8 /a 218 /g 26 9 /a 179 /g 26 10 /a 192 /a 196 /a 196 /a 217 /g 29 9 /a 179 /g 27 8 /a 196 /a 196 /a 191 /g 32 8 /a 218 /g 32 9 /a 179 /g 32 10 /a 192 /a 196 /a 196 /a 217 /g 35 9 /a 179 /g 33 8 /a 196 /a 196 /a 191 /g 38 19 /c 0x07 /d ""
goto :eof

:pouvoir
batbox /g 7 1 /c 0x03 /d "        Pouvoir Special    " /g 0 3 /c 0x07 /d " Inv" /g 0 9 /c 0x03 /d " Pou" /g 0 15 /c 0x07 /d " You"

goto :eof

:descsion
batbox /g 0 12
echo      컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴      
echo      컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

batbox /g 0 0 /a 205 /a 205 /a 205 /a 205 /a 205 /a 187 /g 5 1 /a 186 /g 5 2 /a 186 /g 5 3 /a 186 /g 5 4 /a 186 /g 5 5 /a 186 /g 0 6 /a 205 /a 205 /a 205 /a 205 /a 205 /a 185 /g 5 7 /a 186 /g 5 8 /a 186 /g 5 9 /a 186 /g 5 10 /a 186 /g 5 11 /a 186 /g 0 12 /a 205 /a 205 /a 205 /a 205 /a 205 /a 185 /g 5 13 /a 186 /g 5 14 /a 186 /g 5 15 /a 186 /g 5 16 /a 186 /g 5 17 /a 186 /g 5 18 /a 186 /g 0 19 /a 205 /a 205 /a 205 /a 205 /a 205 /a 188 /g 2 17 /c 0x0%pcou% /a %pn% /g 6 13 /c 0x03 /d "            Description"
goto :eof

:cls1

batbox /g 7 3 /d "%clear%" /g 7 4 /d "%clear%" /g 7 5 /d "%clear%" /g 7 6 /d "%clear%" /g 7 7 /d "%clear%" /g 7 8 /d "%clear%" /g 7 9 /d "%clear%" /g 7 10 /d "%clear%" /g 7 11 /d "%clear%"

:cls2
batbox /g 7 15 /d "%clear%" /g 7 16 /d "%clear%" /g 7 17 /d "%clear%" /g 7 18 /d "%clear%"

goto :eof

:actuinve
cd "%in%\Fichiers de Sauvegarde"
for /f "delims=" %%i in (Inv.data) do set inv=%%i
for /f "delims=" %%i in (Speed.data) do set speed=%%i
for /f "delims=" %%i in (Tel.data) do set tel=%%i



cd %in%
If %speed% GTR 0 (
If %speed%==1 set wa1=251
If %speed%==2 set wa1=253
If %speed%==3 set wa1=252
batbox /g 9 5 /c 0x03 /a 175 /c 0x03 /a %wa1% )

If %tel% GTR 0 (
If %tel%==1 set wa2=251
If %tel%==2 set wa2=253
If %tel%==3 set wa2=252
batbox /g 15 5 /c 0x03 /a 127 /c 0x03 /a %wa2% )

If %inv% GTR 0 (
If %inv%==1 set wa3=251
If %inv%==2 set wa3=253
If %inv%==3 set wa3=252
batbox /g 15 5 /c 0x03 /a 127 /c 0x03 /a %wa3% )
if %bug%==1 ( set bug=0
goto actuinve )
 
goto :eof

:info
cd "%in%\Fichiers de Sauvegarde"
for /f "tokens=1,2,3 delims=-" %%a in (J.data) do (
set pcou=%%c
set pn=%%b
set name=%%a
)

set pcou=%pcou:"=%
set pn=%pn:"=%
set name=%name:"=%
cd %in%

batbox /g 7 1 /c 0x03 /d "          Informations   " /g 0 3 /c 0x07 /d " Inv" /g 0 9 /c 0x07 /d " Pou" /g 0 15 /c 0x03 /d " You" /c 0x03 /g 8 5 /a 17 /g 14 5 /a 16 /g 23 9 /c 0x03 /d "- %name% -" /g 21 5 /c 0x07 /d "Salle " /c 0x03 /d "%num%" /g 35 5 /d "?" /c 0x07 /g 9 4 /a 218 /g 9 5 /a 179 /g 9 6 /a 192 /a 196 /a 196 /a 196 /a 217 /g 13 5 /a 179 /g 10 4 /a 196 /a 196 /a 196 /a 191 /g 9 8 /c 0x08 /a 3 /g 11 8 /c 0x08 /a 3 /g 13 8 /c 0x08 /a 3 /g 15 8 /c 0x08 /a 3 /g 17 8 /c 0x08 /a 3 /c 0x0%pcou% /g 11 5 /a %pn%
If %vie% GTR 0 batbox /g 9 8 /c 0x0C /a 3
If %vie% GTR 1 batbox /g 11 8 /c 0x0C /a 3
If %vie% GTR 2 batbox /g 13 8 /c 0x0C /a 3
If %vie% GTR 3 batbox /g 15 8 /c 0x0C /a 3
If %vie% GTR 4 batbox /g 17 8 /c 0x0C /a 3

batbox /g 9 10 /c 0x08 /a 20 /g 11 10 /c 0x08 /a 20 /g 13 10 /c 0x08 /a 20 /g 15 10 /c 0x08 /a 20
If %clef% GTR 0 batbox /g 9 10 /c 0x0E /a 20
If %clef% GTR 1 batbox /g 11 10 /c 0x0E /a 20
If %clef% GTR 2 batbox /g 13 10 /c 0x0E /a 20
If %clef% GTR 3 batbox /g 15 10 /c 0x0E /a 20

batbox /c 0x07 /g 33 4 /a 218 /g 33 5 /a 179 /g 33 6 /a 192 /a 196 /a 196 /a 196 /a 217 /g 37 5 /a 179 /g 34 4 /a 196 /a 196 /a 196 /a 191
goto :eof

:loopm

if %x%==8 if %y% GTR 3 if %y% GTR 4 if %y% LSS 6 goto :moins

if %x%==14 if %y% GTR 3 if %y% GTR 4 if %y% LSS 6 goto :plus

If %x% GTR 32 if %x% LSS 38 if %y% GTR 4 if %y% LSS 6 start Help.cmd
:yy
goto :eof

:moins
If %a%==1 ( 
call :a8
set a=8
goto yy )

set /a a=%a%-1 
call :a%a%
goto yy

:plus
If %a%==8 ( 
call :a1
set a=1
goto yy )

set /a a=%a%+1 
call :a%a%
goto yy



:a1
batbox /c 0x03 /g 11 5 /a 12

 
goto :eof

:a2
batbox /c 0x09 /g 11 5 /a 12
goto :eof

:a3
batbox /c 0x0A /g 11 5 /a 12
goto :eof

:a4
batbox /c 0x0D /g 11 5 /a 12
goto :eof

:a5
batbox /c 0x0E /g 11 5 /a 2
goto :eof

:a6
batbox /c 0x03 /g 11 5 /a 2
goto :eof

:a7
batbox /c 0x0E /g 11 5 /a 1
goto :eof

:a8
batbox /c 0x0C /g 11 5 /a 3
goto :eof