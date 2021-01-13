@echo off
title Dungeon Batcher
mode con cols=95 lines=41
Setlocal Enabledelayedexpansion

If not exist batbox.exe call :batbox
batbox /h 0

:setvar
set in=%~dp0

set salle=0
set ccouleur=3
set carte=1
set sec=1
set xxx=0
set bou1=0
set p1=0
set p2=0

:aceuil
set "aa=/a 196 /a 196 /a 196 /a 196 /a 196 "

If exist "%in%\Fichiers de Sauvegarde\J.data" call :setsave

If not exist "%in%\Fichiers de Sauvegarde\J.data" call :echosave

batbox /g 4 36 /c 0x0%p% /a 218 %aa% %aa% %aa% %aa% /a 191 /c 0x03 /g 37 36 /a 218 %aa% %aa% %aa% %aa% /a 191 /g 69 36 /a 218 %aa% %aa% %aa% %aa% /a 191 /g 4 37 /c 0x0%p% /a 179 /g 37 37 /c 0x03 /a 179 /g 69 37 /a 179 /g 4 38 /c 0x0%p% /a 179 /g 37 38 /c 0x03 /a 179 /g 69 38 /a 179 /c 0x0%p% /g 25 37 /a 179 /g 25 38 /a 179 /c 0x03 /g 58 37 /a 179 /g 58 38 /a 179 /g 90 37 /a 179 /g 90 38 /a 179 /g 4 39 /c 0x0%p% /a 192 %aa% %aa% %aa% %aa% /a 217 /g 37 39 /c 0x03 /a 192 %aa% %aa% %aa% %aa% /a 217 /g 69 39 /a 192 %aa% %aa% %aa% %aa% /a 217 /g 44 37 /d "Nouvelle" /g 45 38 /d "Partie" /g 77 37 /d "Options" /g 79 38 /d "Jeu" /c 0x03

:loopx
insertbmp /p:"dung.bmp" /x:0 /y:0 /z:100
rem batbox /g 40 17 /d "Image - InserBmp" /c 0x03 /g 0 40

call :bm

If %p%==3 If %x% GTR 4 if %x% LSS 25 if %y% GTR 36 if %y% LSS 39 goto :%niveau%

If %x% GTR 37 if %x% LSS 58 if %y% GTR 36 if %y% LSS 39 ( call :echosave
goto i1 )

If %x% GTR 69 if %x% LSS 90 if %y% GTR 36 if %y% LSS 39 start
goto loopx

:setsave
cd "%in%\Fichiers de Sauvegarde"
set p=3

rem --------
for /f "tokens=1,2,3 delims=-" %%a in (J.data) do (
set pcou=%%c
set pn=%%b
set name=%%a
)
set pcou=%pcou:"=%
set pn=%pn:"=%
set name=%name:"=%
rem --------
for /f "delims=" %%i in (Speed.data) do set speed=%%i
rem --------
for /f "delims=" %%i in (Vie.data) do set vie=%%i
rem --------
for /f "delims=" %%i in (Inv.data) do set inv=%%i
rem --------
for /f "delims=" %%i in (Clef.data) do set clef=%%i
rem --------
for /f "delims=" %%i in (Tel.data) do set tel=%%i
rem --------
for /f "delims=" %%i in (Speed2.data) do set speed2=%%i
rem --------
for /f "delims=" %%i in (Niveau.data) do set niveau=%%i
for /f "delims=" %%i in (Vie2.data) do set vie2=%%i

cd %in%
batbox /g 11 37 /c 0x03 /d "Continuer" /g 11 38 /d "la partie"
goto :eof

:echosave
If not exist "%in%\Fichiers de Sauvegarde" md "%in%\Fichiers de Sauvegarde"

cd "%in%\Fichiers de Sauvegarde"
set p=8
If exist J.data del J.data
echo 0 >Speed.data
echo 1 >Speed2.data

echo 0 >Inv.data
echo 2 >Clef.data
echo 0 >Tel.data
echo 5 >Vie.data
echo niveau0 >Niveau.data
echo 1 >Vie2.data

cd %in%
set niveau=0
set speed=0
set tel=0
set inv=0
set speed2=1
set vie=5
set clef=2
set vie2=1

batbox /c 0x08 /g 11 37 /d "Continuer" /g 11 38 /d "la partie"
goto :eof
rem ----------------------------------------------------------------------------------------

REM Debut :
:niveau0
:i1
color 03
call :chargement
cls
call :DEB
batbox /g 42 11 /c 0x03 /d "%username% ..." /g 33 14 /c 0x03 /d "C'est bien ca ton prenom ?" /g 53 14 /c 0x03 /a 130 /g 44 14 /c 0x03 /a 135 /g 21 26 /c 0x03 /d "Oui" /g 19 35 /c 0x03 /d "Et non ^!" /g 0 40 /c 0x03
:loop1
call :bm


If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 ( set name=%username%
goto i2
)
If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto ib1
goto loop1


rem ----------------------------------------------------------------------------------------

:ib1
call :cls3
batbox /g 30 12 /c 0x03 /d "Alors, veuillez saisir votre prenom." /g 61 12 /c 0x03 /a 130 /c 0x07 /g 0 25
echo            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo            ³                                                 ³
echo            ³                                                 ³
echo            ³                                                 ³
echo            ³                                                 ³
echo            ³                                                 ³
echo            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
batbox /c 0x03 /g 15 28 /d "># "
set /p name=
goto i2

rem ----------------------------------------------------------------------------------------

:i2
call :cls3
batbox /g 24 12 /c 0x03 /d "A quoi ressembles-tu dans la vrai vie, %name% ?" /c 0x07 /g 0 24

echo            ÚÄÄÄÄÄ¿             ÚÄÄÄÄÄ¿             ÚÄÄÄÄÄ¿             ÚÄÄÄÄÄ¿
echo            ³     ³             ³     ³             ³     ³             ³     ³
echo            ³     ³             ³     ³             ³     ³             ³     ³
echo            ³     ³             ³     ³             ³     ³             ³     ³
echo            ÀÄÄÄÄÄÙ             ÀÄÄÄÄÄÙ             ÀÄÄÄÄÄÙ             ÀÄÄÄÄÄÙ
echo.
echo.
echo.
echo            ÚÄÄÄÄÄ¿             ÚÄÄÄÄÄ¿             ÚÄÄÄÄÄ¿             ÚÄÄÄÄÄ¿
echo            ³     ³             ³     ³             ³     ³             ³     ³
echo            ³     ³             ³     ³             ³     ³             ³     ³
echo            ³     ³             ³     ³             ³     ³             ³     ³
echo            ÀÄÄÄÄÄÙ             ÀÄÄÄÄÄÙ             ÀÄÄÄÄÄÙ             ÀÄÄÄÄÄÙ

batbox /g 14 26 /c 0x03 /a 12 /g 34 26 /c 0x09 /a 12 /g 54 26 /c 0x0D /a 12 /g 74 26 /c 0x0A /a 12 /g 14 34 /c 0x0E /a 2 /g 34 34 /c 0x03 /a 2 /g 54 34 /c 0x0E /a 1 /g 74 34 /c 0x0c /a 3 /g 0 40 /c 0x03
:loop2
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)
If %x% GTR 11 if %x% LSS 18 if %y% GTR 24 if %y% LSS 30 ( set pcou=3
set pn=12
goto i3 )
If %x% GTR 31 if %x% LSS 38 if %y% GTR 24 if %y% LSS 30 ( set pcou=9
set pn=12
goto i3 )
If %x% GTR 51 if %x% LSS 58 if %y% GTR 24 if %y% LSS 30 ( set pcou=D
set pn=12
goto i3 )
If %x% GTR 71 if %x% LSS 78 if %y% GTR 24 if %y% LSS 30 ( set pcou=A
set pn=12
goto i3 )

If %x% GTR 11 if %x% LSS 18 if %y% GTR 32 if %y% LSS 38 ( set pcou=E
set pn=2
goto i3 )
If %x% GTR 31 if %x% LSS 38 if %y% GTR 32 if %y% LSS 38 ( set pcou=3
set pn=2
goto i3 )
If %x% GTR 51 if %x% LSS 58 if %y% GTR 32 if %y% LSS 38 ( set pcou=E
set pn=1
goto i3 )
If %x% GTR 71 if %x% LSS 78 if %y% GTR 32 if %y% LSS 38 ( 
    If %sec%==0 (
    set pcou=3
    set pn=1
    )
    If %sec%==1 (
    set pcou=C
    set pn=3
    )
goto i3 )
goto loop2

rem ----------------------------------------------------------------------------------------

:i3
cd "%in%\Fichiers de sauvegarde"

echo "%name%-%pn%-%pcou%">"J.data"

cd "%in%"


If %xxx%==1 (
call :cls2
set xxx=0
goto :ib3 
)

call :cls3
call :cls2

batbox /g 0 23 /c 0x07
echo            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
:ib3
batbox /g 20 12 /c 0x03 /d "Bien, maintenant, je vais te raconter ton histoire ..." /g 20 26 /c 0x03 /d "Suivant" /g 19 35 /c 0x03 /d "Precedent" /g 21 35 /c 0x03 /a 130 /g 23 35 /c 0x03 /a 138 /g 0 40 /c 0x03

:loop3
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i4

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 if %c%==4 ( set sec=1
goto i2 )

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i2

goto loop3

rem ----------------------------------------------------------------------------------------

:i4

call :cls2
batbox /g 14 12 /c 0x03 /d "Tu es un aventurier partit a la recherche d'un tresor fabuleux." /g 63 12 /c 0x03 /a 130 /g 41 12 /c 0x03 /a 133 /g 20 26 /c 0x03

:loop4
call :bm

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i5

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 ( set xxx=1
goto :i3 )
goto loop4

rem ----------------------------------------------------------------------------------------

:i5

call :cls2
batbox /g 11 11 /c 0x03 /d "Le tresor que tu cherches se trouve dans la derniere salle d'un donjon." /g 16 11 /c 0x03 /a 130 /g 60 11 /a 138 /g 19 14 /c 0x03 /d "Pour acceder a cette salle, il te faut reunir 4 clefs." /g 27 14 /c 0x03 /a 130 /g 32 14 /c 0x03 /a 133 /g 59 14 /c 0x03 /a 130


:loop5
call :bm

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i6

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i4
goto loop5

rem ----------------------------------------------------------------------------------------

:i6

call :cls2
batbox /g 15 11 /c 0x03 /d "Il faudra donc battre les 4 gardiens de chaque etage du donjon." /g 62 11 /a 130 /g 32 14 /c 0x03 /d "Pour obtenir toutes les clefs."

:loop6
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i7

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i5
goto loop6

rem ----------------------------------------------------------------------------------------

:i7

call :cls2
batbox /g 13 10 /c 0x03 /d "Le premier, le gardien de pic : selon lui, seul la rapiditer compte." /g 45 13 /c 0x03 /a 6 /g 41 15 /c 0x03 /a 6 /g 49 15 /c 0x03 /a 6 /g 45 17 /c 0x03 /a 6 /g 45 15 /c 0x03 /a 12


:loop7
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i8

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i6
goto loop7

rem ----------------------------------------------------------------------------------------

:i8

call :cls2
batbox /g 13 10 /c 0x03 /d "Le deuxieme, le gardien de trefle : il adore jouer avec le temps." /g 21 10 /a 138 /g 42 10 /a 138 /g 45 13 /c 0x03 /a 5 /g 41 15 /c 0x03 /a 5 /g 49 15 /c 0x03 /a 5 /g 45 17 /c 0x03 /a 5 /g 45 15 /c 0x03 /a 12

:loop8
call :bm

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i9

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i7

goto loop8

rem ----------------------------------------------------------------------------------------

:i9

call :cls2
batbox /g 13 10 /c 0x03 /d "Le troisieme, le gardien de carreau : le plus intelligent de tous." /g 22 10 /a 138 /g 45 13 /c 0x03 /a 4 /g 41 15 /c 0x03 /a 4 /g 49 15 /c 0x03 /a 4 /g 45 17 /c 0x03 /a 4 /g 45 15 /c 0x03 /a 12


:loop9
call :bm

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i10

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i8
goto loop9

:i10

call :cls2
batbox /g 10 10 /c 0x03 /d "Le dernier, le gardien de coeur : le plus puissant et le plus mysterieux." /g 76 10 /a 138 /g 26 13 /c 0x03 /d "On ne sais pratiquement rien de lui." /g 43 16 /d "? ?" /g 20 26 /c 0x03 /d "Suivant" /g 19 35 /c 0x03 /d "Precedent" /g 21 35 /c 0x03 /a 130 /g 23 35 /c 0x03 /a 138

:loop10
call :bm


If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto i11

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i9
goto loop10

:i11

call :cls2
batbox /g 28 12 /c 0x03 /d "Bonne chance, il va t'en falloir." /g 20 26 /c 0x03 /d "Jouer ^!" /g 19 35 /c 0x03 /d "Precedent" /g 21 35 /c 0x03 /a 130 /g 23 35 /c 0x03 /a 138 /g 0 40 /c 0x03

:loop11
call :bm

If %x% GTR 11 if %x% LSS 36 if %y% GTR 23 if %y% LSS 29 goto :niveau1

If %x% GTR 11 if %x% LSS 36 if %y% GTR 32 if %y% LSS 38 goto i10
goto loop11

rem ----------------------------------------------------------------------------------------
:niveau1
cd %in%\Fichiers de Sauvegarde

echo niveau1 >Niveau.data
set niveau=niveau1

cd %in%

If %p1%==0 call :chargement
cls
call :dessin
call :carte

:setvar1

set l=20
set c=19

If %p1%==1 ( set l=57
set c=19
set p1=0 ) 

call :set

batbox /g 29 35 /c 0x03 /d "Salle 1" /g 69 30 /c 0x03 /a 26 /d 1 /c 0x07 /g 27 34 /a 218 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 191 /g 27 35 /a 179 /g 37 35 /a 179 /g 27 36 /a 192 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 217 /c 0x07 /g 18 16 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /g 18 22 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /g 17 16 /a 218 /g 17 17 /a 179 /g 17 18 /a 179 /g 17 19 /a 179 /g 17 20 /a 179 /g 17 21 /a 179 /g 17 22 /a 192 /c 0x06 /g 11 22 /a 15 /c 0x0D /g 23 8 /a 15 /c 0x0A /g 8 12 /a 15 /c 0x0A /g 18 28 /a 15 /c 0x06 /g 37 11 /a 15 /c 0x05 /g 30 26 /a 15 /c 0x0B /g 51 29 /a 15 /c 0x0D /g 53 8 /a 15 /c 0x0A /g 48 24 /a 15 /c 0x0E /g 57 13 /a 15 /c 0x06 /g 38 30 /a 15 /c 0x0E


:a1
If %l%%c%==5919 goto :niveau2
If %l%%c%==6019 goto :niveau2

batbox /g %l% %c% /c 0x0%pcou% /a %pn% /c 0x03 /g 59 19 /a 218 /a 191 /k_



If "%errorlevel%"=="327" goto haut1
If "%errorlevel%"=="335" goto bas1
If "%errorlevel%"=="330" goto gauche1
If "%errorlevel%"=="332" goto droite1

If "%errorlevel%"=="105" start Inventaire.CMD
If "%errorlevel%"=="73" start Inventaire.CMD
If "%errorlevel%"=="13" start Inventaire.CMD

If "%errorlevel%"=="109" goto menue
If "%errorlevel%"=="77" goto menue
If "%errorlevel%"=="27" goto menue
If "%errorlevel%"=="122" goto menue

goto a1

:haut1

If %c% lss 18 goto a1

batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c% - 1

goto a1

:bas1
If %c% GTR 20 goto a1

batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c% + 1

goto a1

:gauche1
If %l% lss 19 goto a1
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a l=%l% - 1
goto a1

:droite1
If %l% GTR 59 goto a1
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a l=%l% + 1
goto a1


rem -------------------------------------------------------------------------------------------------------------------------------------------------------

:niveau2
cd %in%\Fichiers de Sauvegarde

echo niveau2 >Niveau.data
set niveau=niveau2

cd %in%

cls
call :dessin
call :carte

:setvar2
If %p2%==0 (
set c=19
set l=8
set mob5=0
)
If %p2%==1 (
set c=30
set l=51
set mob5=1
)
If %p2%==2 (
set c=30
set l=52
set mob5=1
)

set m=26
set n=19
set ah=0

set m1=36
set n1=18
set ah1=0

set c5=22
set l5=51

set mn=0
set ww=0
set coutp=3

set haut=0
set bas=0
set droite=0
set gauche=0

call :set

batbox /g 21 6 /c 0x07 /a 179 /g 21 7 /a 179 /g 21 8 /a 179 /g 21 9 /a 179 /g 21 10 /a 179 /g 21 11 /a 179 /g 21 12 /a 179 /g 21 13 /a 179 /g 21 14 /a 179 /g 21 15 /a 179 /g 21 16 /a 179 /g 21 17 /a 179 /g 21 18 /a 179 /g 21 19 /a 179 /g 21 20 /a 179 /g 21 21 /a 179 /g 21 22 /a 179 /g 41 32 /a 193 /g 41 31 /a 179 /g 41 30 /a 179 /g 41 29 /a 179 /g 41 28 /a 179 /g 41 27 /a 179 /g 41 26 /a 179 /g 41 25 /a 179 /g 41 24 /a 179 /g 41 23 /a 179 /g 41 22 /a 179 /g 41 21 /a 179 /g 41 20 /a 179 /g 41 19 /a 179 /g 41 18 /a 179 /g 41 17 /a 179 /g 41 16 /a 179 /g 41 15 /a 179 /g 5 10 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 180 /g 21 20 /a 195 /a 196 /a 196 /a 196 /a 217 /g 25 19 /a 179 /g 25 18 /a 179 /g 21 17 /a 195 /a 196 /a 196 /a 196 /a 191 /g 41 20 /a 180 /g 37 20 /a 192 /a 196 /a 196 /a 196 /g 37 19 /a 179 /g 37 18 /a 179 /g 37 17 /a 218 /a 196 /a 196 /a 196 /a 180 /g 26 20 /c 0x08 /a 35 /a 35 /g 31 20 /a 35 /a 35 /g 36 20 /a 35 /g 28 17 /c 0x08 /a 35 /a 35 /a 35 /g 33 17 /a 35 /a 35 /a 35 /g 9 28 /c 0x08 /a 35 /g 52 8 /c 0x08 /a 35 /g 27 10 /c 0x08 /a 35 /g 29 35 /c 0x03 /d "Salle 2" /g 74 30 /c 0x03 /a 26 /g 75 30 /c 0x03 /d 2 /c 0x07 /g 27 34 /a 218 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 191 /g 27 35 /a 179 /g 37 35 /a 179 /g 27 36 /a 192 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 217 /c 0x03 /g 5 19 /a 218 /a 191

if %speed2%==1 batbox /g 12 8 /c 0x0A /a 175


:a2
if %l%%c%==5131 goto niveau3
if %l%%c%==5231 goto niveau3
if "%l% %c%"=="5 19" ( set p1=1
goto niveau1 )
if "%l% %c%"=="6 19" ( set p1=1
goto niveau1 )
if %l%%c%==6031 If %coutp%==3 ( set l=6
set c=6
set mob5=0
set coutp=1 )

If %l%%c%==128 if %speed2%==1 goto speed

If %c%==20 call :opti20
If %c%==17 call :opti17

If "%l% %c%"=="52 8" ( batbox /g 52 8 /c 0x0C /a 35 
goto :mort )
If %l%%c%==928 ( batbox /g 9 28 /c 0x0C /a 35 
goto :mort )
If %l%%c%==2710 ( 
batbox /g 27 10 /c 0x0C /a 35 
goto :mort )
If %l%%c%==%l5%%c5% goto :mort
If %mn%==1 call :mob3
If %mn%==1 call :mob4
If %mob5%==1 call :mob5

If %l%%c%==%m%%n% goto :mort
If %l%%c%==%m1%%n1% goto :mort

batbox /g %l% %c% /c 0x0%pcou% /a %pn% /g %m% %n% /c 0x0D /a 64 /g %m1% %n1% /c 0x0D /a 64 /g 18 10 /c 0x07 /a 25 /g %l5% %c5% /c 0x05 /a 64 /g 52 31 /c 0x03 /a 191 /g 51 31 /c 0x03 /a 218 /g 60 31 /c 0x0%coutp% /a 127 /g 5 6 /c 0x0%coutp% /a 127 /k_



If "%errorlevel%"=="122" goto menue
If "%errorlevel%"=="327" goto haut2
If "%errorlevel%"=="335" goto bas2
If "%errorlevel%"=="330" goto gauche2
If "%errorlevel%"=="332" goto droite2

If "%errorlevel%"=="105" start Inventaire.CMD
If "%errorlevel%"=="73" start Inventaire.CMD
If "%errorlevel%"=="13" start Inventaire.CMD

If "%errorlevel%"=="109" goto menue
If "%errorlevel%"=="77" goto menue
If "%errorlevel%"=="27" goto menue

goto a2

:haut2

If %c% lss 7 goto a2

if %l% GTR 21 if %l% LSS 41 if %c%==23 set mn=1
If %c%==15 if %l% GTR 21 if %l% LSS 41 set mn=0

if %c%==21 call :opti21

if %l% GTR 4 if %l% LSS 22 if %c%==11 goto a2
If %l%==21 if %c%==23 goto a2

 
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c% - 1

goto a2 

:bas2
If %c% GTR 30 goto a2
if %l%==41 if %c%==14 goto a2

If %c%==9 if %l%==18 ( 
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c% + 2
goto a2 )

If %c%==9 if %l% GTR 4 if %l% LSS 21 goto a2
If %c%==16 call :opti21
if %l% GTR 21 if %l% LSS 41 if %c%==22 set mn=0
If %c%==15 if %l% GTR 21 if %l% LSS 41 set mn=1
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c% + 1

goto a2

:gauche2
If %l% lss 6 goto a2
If %l%==41 if %c% GTR 4 if %c% LSS 15 set mob5=0
If %l%==22 if %c% GTR 5 if %c% LSS 23 goto a2
If %l%==42 if %c% GTR 14 if %c% LSS 33 goto a2

If %l%==26 call :opti26 
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a l=%l% - 1

goto a2 


:droite2
If %l% GTR 59 goto a2
If %l%==41 if %c% GTR 4 if %c% LSS 15 set mob5=1
If %l%==36 call :opti26 

If %l%==20 if %c% GTR 5 if %c% LSS 23 goto a2
If %l%==40 if %c% GTR 14 if %c% LSS 33 goto a2
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a l=%l% + 1

goto a2 

:mob3
batbox /g %m% %n% /c 0x00 /d " " /c 0x0f 

If %m%==26 set ah=1
If %m%==36 set ah=0

if %ah%==1 set /a m=%m% + 1
if %ah%==0 set /a m=%m% - 1

goto :eof

:mob4
batbox /g %m1% %n1% /c 0x00 /d " " /c 0x0f 

If %m1%==26 set ah1=1
If %m1%==36 set ah1=0

if %ah1%==1 set /a m1=%m1% + 1
if %ah1%==0 set /a m1=%m1% - 1

goto :eof

:mob5
set /a ww=%ww%+1
if %ww% lss 2 goto :eof
set ww=0 
batbox /g %l5% %c5% /c 0x00 /d " " /c 0x0f 
:y5
set /a dir5=%random%%%2

if %dir5%==0 ( 
    if %l5% gtr 42 (
        if %l5% gtr %l% (set /a l5=%l5%-1 & goto :45) 
    )
    if %l5% lss 60 (
        if %l5% lss %l% (set /a l5=%l5%+1 & goto :45) 
    )
    goto :Q5
)

:Q5
if %dir5%==1 (
    if %c5% gtr 5 (
        if %c5% gtr %c% (set /a c5=%c5%-1 & goto :45) 
    )    
    if %c5% lss 32 (
        if %c5% lss %c% (set /a c5=%c5%+1 & goto :45) 
    )
    goto :y5
)

:45
goto :eof

:opti20

If %l%%c%==2620 ( batbox /g 26 20 /c 0x0c /a 35
goto :mort )
If %l%%c%==2720 ( batbox /g 27 20 /c 0x0c /a 35
goto :mort )
If %l%%c%==3120 ( batbox /g 31 20 /c 0x0c /a 35
goto :mort )
If %l%%c%==3220 ( batbox /g 32 20 /c 0x0c /a 35
goto :mort )
If %l%%c%==3620 ( batbox /g 36 20 /c 0x0c /a 35
goto :mort )

goto :eof

:opti17
If %l%%c%==2817 ( batbox /g 28 17 /c 0x0c /a 35
goto :mort )
If %l%%c%==2917 ( batbox /g 29 17 /c 0x0c /a 35
goto :mort )
If %l%%c%==3017 ( batbox /g 30 17 /c 0x0c /a 35
goto :mort )
If %l%%c%==3317 ( batbox /g 33 17 /c 0x0c /a 35
goto :mort )
If %l%%c%==3417 ( batbox /g 34 17 /c 0x0c /a 35
goto :mort )
If %l%%c%==3517 ( batbox /g 35 17 /c 0x0c /a 35
goto :mort )

goto :eof

:opti21
if %l%==21 goto a2
if %l%==22 goto a2
if %l%==23 goto a2
if %l%==24 goto a2
if %l%==25 goto a2

if %l%==37 goto a2
if %l%==38 goto a2
if %l%==39 goto a2
if %l%==40 goto a2

goto :eof

:opti26
If %c%==17 goto a2
If %c%==18 goto a2
If %c%==19 goto a2
If %c%==20 goto a2
goto :eof


:speed
set /a speed=%speed%+1
set speed2=0
cd %in%\Fichiers de Sauvegarde
echo %speed2% >Speed2.data
echo %speed% >Speed.data
cd %in%
goto a2
rem ----------------------------------------------------------------------------------------

:niv3
goto niveau3

:niveau3
cd "%in%\Fichiers de Sauvegarde"
echo niveau3 >Niveau.data
cd %in%
:setvar1
cls

set bou1=0

set c=8
set l=10

set c1=9
set l1=53
set c2=29
set l2=53
set c3=6
set l3=53
set c4=29
set l4=60
set lb4=59

set dir=nope

set r=1
set r2=1
set rr=1
set rrM2=1

set droite=0
set gauche=0
set haut=0
set bas=0

set niveau=niveau3



call :dessin
call :carte
call :set

ping localhost -n 00 > nul
cd %in%
batbox /g 29 35 /c 0x03 /d "Salle 3" /g 74 33 /c 0x03 /a 26 /g 75 33 /c 0x03 /d 3 /c 0x07 /g 27 34 /a 218 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 191 /g 27 35 /a 179 /g 37 35 /a 179 /g 27 36 /a 192 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 217 /g 17 25 /c 0x07 /a 192 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196/a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /g 17 6 /c 0x07 /a 179 /g 17 7 /a 179 /g 17 8 /a 179 /g 17 9 /a 179 /g 17 10 /a 179 /g 17 11 /a 179 /g 17 12 /a 179 /g 17 13 /a 179 /g 17 14 /a 179 /g 17 15 /a 179 /g 17 16 /a 179 /g 17 17 /a 179 /g 17 18 /a 179 /c 0x03 /g 10 6 /a 218 /g 11 6 /a 191


If %vie2%==1 batbox /g 24 10 /c 0x0C /a 3
goto a

:a
if %c%%l%==1024 if %vie% LSS 5 If %vie2%==1 ( set /a vie=%vie%+1
cd %in%\Fichiers de Sauvegarde"
echo 0 >Vie2.data
set vie2=0
call :set )
if %rr% GTR 2 call :mob
if %rrM2% gtr 2 call :mob2
:mm
if %c%%l%==%c3%%l3% goto :abou1
:bug
if %c%%l%==%c4%%l4% goto gagner
if %c%%l%==%c4%%lb4% goto gagner
:bug2
if %c%%l%==%c1%%l1% goto :mort 
if %c%%l%==%c2%%l2% goto :mort

if %c%%l%==2740 ( 
batbox /g 40 27 /c 0x0c /a 35
goto :mort )
if %c%%l%==3029 ( 
batbox /g 29 30 /c 0x0c /a 35
goto :mort )
if %c%%l%==2052 ( 
batbox /g 52 20 /c 0x0c /a 35
goto :mort )
if %c%%l%==841 (
batbox /g 41 8 /c 0x0c /a 35
goto :mort )

If "%c% %l%"=="6 10" ( set p2=1
goto niveau2 )
If "%c% %l%"=="6 11" ( set p2=2
goto niveau2 )

batbox /g %l1% %c1% /c 0x05 /a 64 /g %l2% %c2% /c 0x05 /a 64 /g %l3% %c3% /c 0x03 /a 254 /g %l4% %c4% /c 0x0%cbo1% /a 191 /g %lb4% %c4% /c 0x0%cbo1% /a 218 /g %l% %c% /c 0x0%pcou% /a %pn% /g 40 27 /c 0x08 /a 35 /g 29 30 /c 0x08 /a 35 /g 52 20 /c 0x08 /a 35 /g 41 8 /c 0x08 /a 35 /c 0x07 /g 51 6 /a 26 /k_



If "%errorlevel%"=="122" goto menue
If "%errorlevel%"=="327" goto haut1
If "%errorlevel%"=="335" goto bas1
If "%errorlevel%"=="330" goto gauche1
If "%errorlevel%"=="332" goto droite1

If "%errorlevel%"=="105" start Inventaire.CMD
If "%errorlevel%"=="73" start Inventaire.CMD
If "%errorlevel%"=="13" start Inventaire.CMD

If "%errorlevel%"=="109" goto menue
If "%errorlevel%"=="77" goto menue
If "%errorlevel%"=="27" goto menue


goto a

:haut1
If %c% lss 7 goto a
If %c% lss 20 if %l% gtr 16 if %l% lss 18 goto a
If %c%==26 if %l% gtr 16 if %l% lss 61 goto a


batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c%-1

goto a

:bas1
If %c% GTR 30 goto a
If %c%==24 if %l% gtr 16 if %l% lss 61 goto a

batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a c=%c%+1

goto a

:gauche1
If %l% lss 6 goto a
If %l%==18 if %c% GTR 17 if %c% LSS 25 set /a rr=1
If %l%==18 if %c% GTR 25 if %c% LSS 38 set /a rrM2=1
If %l%==18 if %c% GTR 5 if %c% LSS 19 goto a
batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a l=%l% - 1

goto a

:droite1
If %l% GTR 59 goto a
If %l%==16 if %c% GTR 5 if %c% LSS 19 goto a
If %l%==16 if %c% GTR 24 if %c% LSS 26 goto a
If %l%==16 if %c% GTR 25 if %c% LSS 38 set /a rrM2=3
If %l%==16 if %c% GTR 15 if %c% LSS 25 set /a rr=3

batbox /g %l% %c% /c 0x00 /d " " /c 0x0f
set /a l=%l% + 1

goto a

:mob
batbox /g %l1% %c1% /c 0x00 /d " " /c 0x0f 
:y
set /a dir1=%random%%%2
set /a dir10=%random%%%2
If %dir10%==0 goto y

if %dir1%==0 ( 
    if %l1% gtr 18 (
        if %l1% gtr %l% (set /a l1=%l1%-%dir10% & goto :4) 
    )
    if %l1% lss 60 (
        if %l1% lss %l% (set /a l1=%l1%+%dir10% & goto :4) 
    )
    goto :Q
)

:Q
if %dir1%==1 (
    if %c1% gtr 5 (
        if %c1% gtr %c% (set /a c1=%c1%-%dir10% & goto :4) 
    )    
    if %c1% lss 24 (
        if %c1% lss %c% (set /a c1=%c1%+%dir10% & goto :4) 
    )
    goto :y
)

:4 
goto :eof 


:mob2
set /a r2=%r2%+2
if %r2% lss 3 goto mm
set r2=0
batbox /g %l2% %c2% /c 0x00 /d " " /c 0x0f 
:y2
set /a dir2=%random%%%2

if %dir2%==0 ( 
    if %l2% gtr 17 (
        if %l2% gtr %l% (set /a l2=%l2%-1 & goto :42) 
    )
    if %l2% lss 60 (
        if %l2% lss %l% (set /a l2=%l2%+1 & goto :42) 
    )
    goto :Q
)

:Q2

if %dir2%==1 (
    if %c2% gtr 26 (
        if %c2% gtr %c% (set /a c2=%c2%-1 & goto :42) 
    )    
    if %c2% lss 32 (
        if %c2% lss %c% (set /a c2=%c2%+1 & goto :42) 
    )
    goto :y2    
)

:42
goto :eof 


:menue
echo Menue
goto a

:mort

set /a vie=%vie% - 1

cd "%in%\Fichiers de Sauvegarde"

echo %vie% >Vie.data

cd %in%
If %vie%==0 goto perdue
call :info
batbox /g 26 34 /c 0x03 /d "Vous etes mort ^!" /g 31 34 /a 136
batbox /g 17 36 /c 0x03 /d "Il ne vous reste plus que %vie% vie ^!"

pause >nul

goto :%niveau%

:perdue
cls
echo Vous avez Perdue !
cd "%in%\Fichiers de Sauvegarde"
del J.data
cd %in%
goto setvar

:abou1
set /a bou1=%bou1%+1
If %bou1%==1 set cbo1=B
If %bou1%==0 set cbo1=9
goto bug

:gagner
if %bou1%==0 goto bug2
cls
echo Vous avez Gagner !
pause >nul
goto setvar










:carte
If %carte%==1 (
rem big compression carte
batbox /g 68 27 /c 0x03 /d "Carte" /g 79 27 /c 0x07 /d "Etage 1" /g 74 27 /a 179 /g 74 26 /a 194 /g 66 28 /a 195 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /g 74 28 /a 193 /g 75 28 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 180 /g 68 30 /a 179 /g 68 29 /a 218 /g 68 31 /a 192 /a 196 /a 196 /a 217 /g 71 30 /a 195 /g 69 29 /a 196 /a 196 /a 191 /g 73 29 /a 218 /g 73 30 /a 180 /g 73 31 /a 192 /a 196 /a 194 /a 217 /g 76 30 /a 179 /g 74 29 /a 196 /a 196 /a 191 /g 73 32 /a 218 /g 73 33 /a 179 /g 73 34 /a 192 /a 196 /a 196 /a 217 /g 76 33 /a 195 /g 74 32 /a 196 /a 196 /a 191 /g 78 32 /a 218 /g 78 33 /a 180 /g 78 34 /a 192 /a 196 /a 194 /a 217 /g 81 33 /a 195 /g 79 32 /a 196 /a 196 /a 191 /g 83 32 /a 218 /g 83 33 /a 180 /g 83 34 /a 192 /a 196 /a 196 /a 217 /g 86 33 /a 179 /g 84 32 /a 196 /a 196 /a 191 /g 78 35 /a 218 /g 78 36 /a 179 /g 78 37 /a 192 /a 196 /a 196 /a 217 /g 81 36 /a 179 /g 79 35 /a 196 /a 193 /a 191 /g 69 30 /c 0x07 /a 26 /g 70 30 /c 0x07 /d 1 /g 72 30 /c 0x07 /a 196 /g 74 30 /c 0x07 /a 26 /g 75 30 /c 0x07 /d 2 /g 75 32 /c 0x07 /a 193 /g 74 33 /c 0x07 /a 26 /g 75 33 /c 0x07 /d 3 /g 77 33 /c 0x07 /a 196 /g 79 33 /c 0x07 /a 26 /g 80 33 /c 0x07 /d 4 /g 82 33 /c 0x07 /a 196 /g 84 33 /c 0x07 /a 26 /g 85 33 /c 0x07 /d 5 /g 79 36 /c 0x07 /a 26 /g 80 36 /c 0x07 /d 6
)
goto :eof


rem Exemple Carr?carte
batbox /g 78 35 /a 218
batbox /g 78 36 /a 179
batbox /g 78 37 /a 192 /a 196 /a 196 /a 217
batbox /g 81 36 /a 179
batbox /g 79 35 /a 196 /a 193 /a 191

rem Num carte
batbox /g 69 30 /c 0x07 /a 26 /g 70 30 /c 0x07 /d 1 /g 72 30 /c 0x07 /a 196

batbox /g 74 30 /c 0x07 /a 26 /g 75 30 /c 0x07 /d 2 /g 75 32 /c 0x07 /a 193

batbox /g 74 33 /c 0x07 /a 26 /g 75 33 /c 0x07 /d 3 /g 77 33 /c 0x07 /a 196

batbox /g 79 33 /c 0x07 /a 26 /g 80 33 /c 0x07 /d 4 /g 82 33 /c 0x07 /a 196

batbox /g 84 33 /c 0x07 /a 26 /g 85 33 /c 0x07 /d 5

batbox /g 79 36 /c 0x07 /a 26 /g 80 36 /c 0x07 /d 6

:dessin
set savecou=%pcou%
color 7
echo.
echo                 ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  
echo                 ³                               ³
echo                 ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo     ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»    ÚÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ³ Vie ³                 ³
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ÃÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ³ Cl‚ ³                 ³
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ÃÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ³ (I) ³  Inventaire     ³
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ÃÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ³
echo     º                                                        º    ³     ³                 ³ 
echo     º                                                        º    ³ (M) ³ Menue Principal ³ 
echo     º                                                        º    ³     ³                 ³
echo     º                                                        º    ÀÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo     º                                                        º                     
echo     º                                                        º
echo     º                                                        º
echo     º                                                        º   
echo     º                                                        º    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     ºÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄº    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     º                                                        º    ³                       ³
echo     ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
batbox /g 19 2 /c 0x03 /d " U N G E O N   B A T C H E R" /g 18 2 /c 0x03 /a 209 /g 90 9 /c 0x07 /a 180 /g 90 13 /a 180 /g 90 17 /a 180
call :carte

goto :eof

:set
cd %in%

If %vie% gtr 1 set pcou=%savecou%
If %vie%==1 set pcou=C
:Varvie
batbox /g 75 7 /c 0x08 /a 3 /g 78 7 /c 0x08 /a 3 /g 81 7 /c 0x08 /a 3 /g 84 7 /c 0x08 /a 3 /g 87 7 /c 0x08 /a 3


If %vie% GTR 0 batbox /g 75 7 /c 0x0C /a 3
If %vie% GTR 1 batbox /g 78 7 /c 0x0C /a 3
If %vie% GTR 2 batbox /g 81 7 /c 0x0C /a 3
If %vie% GTR 3 batbox /g 84 7 /c 0x0C /a 3
If %vie% GTR 4 batbox /g 87 7 /c 0x0C /a 3
:Varclef
batbox /g 75 11 /c 0x08 /a 20 /g 78 11 /c 0x08 /a 20 /g 81 11 /c 0x08 /a 20 /g 84 11 /c 0x08 /a 20

If %clef% GTR 0 batbox /g 75 11 /c 0x0E /a 20
If %clef% GTR 1 batbox /g 78 11 /c 0x0E /a 20
If %clef% GTR 2 batbox /g 81 11 /c 0x0E /a 20
If %clef% GTR 3 batbox /g 84 11 /c 0x0E /a 20

If %bou1%==1 set cbo1=B
If %bou1%==0 set cbo1=9
goto :eof

:DEB
color 7
echo.
echo                               ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  
echo                               ³                               ³
echo                               ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo            ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ³                       ³
echo            ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
batbox /g 33 2 /c 0x03 /d " U N G E O N   B A T C H E R" /g 32 2 /c 0x03 /a 209

goto :eof
:DEB2
color 7
echo.
echo                               ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿  
echo                               ³                               ³
echo                               ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
echo        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ³                                                                             ³
echo        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ
echo.
echo.
batbox /g 33 2 /c 0x03 /d " U N G E O N   B A T C H E R" /g 32 2 /c 0x03 /a 209
goto :eof
rem ------------
:cls3
set "clear2=                                                 "
batbox /g 0 23 /d "%clear2%%clear2%" /g 0 24 /d "%clear2%%clear2%" /g 0 25 /d "%clear2%%clear2%" /g 0 26 /d "%clear2%%clear2%" /g 0 27 /d "%clear2%%clear2%" /g 0 28 /d "%clear2%%clear2%" /g 0 29 /d "%clear2%%clear2%" /g 0 30 /d "%clear2%%clear2%" /g 0 31 /d "%clear2%%clear2%" /g 0 32 /d "%clear2%%clear2%" /g 0 33 /d "%clear2%%clear2%" /g 0 34 /d "%clear2%%clear2%" /g 0 35 /d "%clear2%%clear2%" /g 0 36 /d "%clear2%%clear2%"  /g 0 37 /d "%clear2%%clear2%"  /g 0 38 /d "%clear2%%clear2%" /c 0x07
:cls2
set "clear1=                                                                           "
batbox /g 8 10 /d "%clear1%" /g 8 11 /d "%clear1%" /g 8 12 /d "%clear1%" /g 8 13 /d "%clear1%" /g 8 14 /d "%clear1%" /g 8 15 /d "%clear1%" /g 8 16 /d "%clear1%" /g 8 17 /d "%clear1%" /c 0x07
goto :eof


:cls4
set "clear4=                                                        "
batbox /g 5 6 /d "%clear4%" /g 5 7 /d "%clear4%" /g 5 8 /d "%clear4%" /g 5 9 /d "%clear4%" /g 5 10 /d "%clear4%" /g 5 11 /d "%clear4%" /g 5 12 /d "%clear4%" /g 5 13 /d "%clear4%" /g 5 14 /d "%clear4%" /g 5 15 /d "%clear4%" /g 5 16 /d "%clear4%" /g 5 17 /d "%clear4%" /g 5 18 /d "%clear4%" /g 5 19 /d "%clear4%" /g 5 20 /d "%clear4%" /g 5 21 /d "%clear4%" /g 5 22 /d "%clear4%" /g 5 23 /d "%clear4%" /g 5 24 /d "%clear4%" /g 5 25 /d "%clear4%" /g 5 26 /d "%clear4%" /g 5 27 /d "%clear4%" /g 5 28 /d "%clear4%" /g 5 29 /d "%clear4%" /g 5 30 /d "%clear4%" /g 5 31 /d "%clear4%" /g 5 32 /d "%clear4%"  /g 5 32 /c 0x07 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /c 0x07
:info
batbox /g 6 33 /c 0x00 /d "                                                     " /g 6 34 /c 0x00 /d "                                                     " /g 6 35 /c 0x00 /d "                                                     " /g 6 36 /c 0x00 /d "                                                     " /g 6 37 /c 0x00 /d "                                                     " /c 0x07

goto :eof

:chargement
set "cecho=echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo: & echo:"

cls
color 03
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 º²²²²²²²²²²²²²²²²²²²²²²²²²²º001º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 1 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛ²²²²²²²²²²²²²²²²²²²²²²²²²º004º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛ²²²²²²²²²²²²²²²²²²²²²²²²º008º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛ²²²²²²²²²²²²²²²²²²²²²²²º012º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛ²²²²²²²²²²²²²²²²²²²²²²º016º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛ²²²²²²²²²²²²²²²²²²²²²º020º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛ²²²²²²²²²²²²²²²²²²²²º024º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛ²²²²²²²²²²²²²²²²²²²º028º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛ²²²²²²²²²²²²²²²²²²º032º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²²²²²²²º036º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²²²²²²º040º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²²²²²º044º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²²²²º048º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²²²º052º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²²º056º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²²º060º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²²º064º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²²º068º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²²º072º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²²º076º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²²º080º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²²º084º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²²º088º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²²º092º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²²º096º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛ²º100º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 00 > nul
cls
%cecho%
echo                                 ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍËÍÍÍ»
echo                                 ºÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛÛº100º
echo                                 ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÊÍÍÍ¼
ping localhost -n 2 > nul
goto :eof

:batbox

for %%b in (
4D534346000000005A040000000000002C000000000000000301010001000000
000000004700000001000100000800000000000000006546F2B1200062617462
6F782E65786500D7E54E4C0B040008434BB5555F685B55183F499BA06D4DB235
295311EFA4151C23E04A7C2854B2759D8EA51A92B88A14BAFCB9C9BD697A6FB8
B9B19DF32123093223F8361FF6B212F0C597227B98A26C359382B46FC38789FB
F7306E9C6011FF14D15E7FDFB9376D26854DD093FCCE39DFEFFBCE777EE7BBE7
26536F55988331D6CB7CCC34190B938116660F6F15C0F3ECE71E76E9F1F5FD97
1D91F5FD09492E09454DCD69C979219D5414551752A2A09515415684A3AFC785
793523069FE81BEEE4884E32167138D8DBAB9B890E779B791DFD0EC731E686E1
B6495F17481D8D4EC66CB9D06F37C1E2477E66ACA77BDD76A46DDAEDC341C6E6
9C8F70D8FFB805B385A48EF190DB16E4B67477B753548AFFB9497D436196B706
692B80EE0F74662083BE7ACD9FFFD50C44FC61D67453D86FB6E1A4E00A0A2A39
CFA27B6F9056E87CC54075D3F4D6AEE224CD202DF1492F913744861978D78A31
62F04FBC3F58F94678D1CC7E36C0C63E3A83286F6D14FC2BB9BB1BED1BA6691A
7B6045CD909B2F4D60E3760B74E58C63D65BF740BB1928205FFDAAB7F6097833
700AD63855CC5BEFE76E225CB8D4ACD940FAF62F506C7C81AEC745A29A2FA3CB
363D486F7CCCD931628F70D6479B863CBCB704BC49028E90AED3085E751D1BB4
DE91264D24DEBDC00B31835DDB4F52E01C02E35D6CF5DA636D468E35ACFBDDF5
1CF2FE05D35BBF8F7EE9A921EB303729E24744B4AF6F61761133E37B32BF26F3
4F7A69703452738988FBA481CE63DCA1199DA17D010EE9F92EF112C28D15F21F
A067D7EDCA50A63C655A82FFDC2AAA0A661A7B0C90270A8FE9A2A22CEDD46B69
A748ED6F1190DF67869C3C5B146BAC3BE590F6F25D2C7E067C759C1C78CCEB48
99AD8E93DFE9AD5F81D56A8C0FC13AB7B5F293EFEC3DFA21EAE1E5894E9F940E
76D5CFD73286A0328F4FDC0C14ADEBD43287BF3C81A0AA8B2E706FE3191A1A4F
D7BFF3D6E8A56FE5B7EF5FCD7A08FFB8958B569A8E59E166AF196AF08D25CB1C
29B191CC18FFF6EDFE2A7DEA0BB30D60744F985DC03883B10CAC00CBC00DA07F
2F8A877104E35C2E99CECCAB0B52F1B4124CA5788E83819D7CB7F0D334037BD8
BFC3FD002E02BBB78BDB0437E0DF5DD354FCE4442C113C1A89B01393B1D72623
A387B8C1DE884FC63A73BFBDD8BF9D242EA90BD3B2925117C8D2C1D780F3C032
B006DC060C8A87C07DB6E8478DC33B2EEA713DF36A52C91444BE9FA84FA84A49
2D8853F87F789049888BFA615DD7E45459171FF04C94B592AA45D592ACCBAA42
AB626232633B8F2BC5B27E98E20BA258DC65DD7125ABDA5A1EC2772AF101F49F
072E02CBC065E02B600DB80EDC04EE011BF639FF6D3C63454D56F42CCD6673A2
9E96F88CA6F34959496AB9126C7151D6393F9792AC5949D774B5C039B5285221
66173499178BCD6A28098DE9825AB298B45492DF11EDBFBCBF01            
) Do >>t.dat (Echo.For b=1 To len^("%%b"^) Step 2
ECHO WScript.StdOut.Write Chr^(Clng^("&H"^&Mid^("%%b",b,2^)^)^) : Next)
Cscript /b /e:vbs t.dat>batbox.ex_
Del /f /q /a t.dat >nul 2>&1
Expand -r batbox.ex_ >nul 2>&1
Del /f /q /a batbox.ex_ >nul 2>&1

goto :eof

:bm
for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)
goto :eof