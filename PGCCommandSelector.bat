@echo off
rem ===================================================================
rem                         PGCCommandSelector
rem ===================================================================

rem ---- Inicialización ClassPath ------------------------------
set CLASSPATH=.


rem ---- Clases Temp Arquitectura ------------------------------

IF EXIST "./jre1.6.0_02/bin/java.exe" GOTO relativePath
GOTO absolutPath

:relativePath
"./jre1.6.0_02/bin/java.exe" -Dfile.encoding=cp850 -Xmx1G -classpath ./properties/;./config/;./lib/*;./lib/ubm/*; es.inteco.xbrl.pgc.commandline.ShellWrapper %* >>./log/pgc.log >>CON
@echo.
@echo.
GOTO end

:absolutPath
java.exe -Dfile.encoding=cp850 -Xmx1G -classpath ./properties/;./config/;./lib/*;./lib/ubm/*; es.inteco.xbrl.pgc.commandline.ShellWrapper %* >>./log/pgc.log >>CON

:end
 
ECHO OFF 
REM compruebo si cualquiera de los posbles argumentos tiene el valor -x para cerrar la aplicación al terminar. 
if ""%1"" == ""-x""  GOTO exit 
if ""%2"" == ""-x"" GOTO exit 
if ""%3"" == ""-x"" GOTO exit   
if ""%4"" == ""-x""  GOTO exit  
if ""%5"" == ""-x"" GOTO exit  
if ""%6"" == ""-x"" GOTO exit 
if ""%7"" == ""-x"" GOTO exit
if ""%8"" == ""-x"" GOTO exit  
if ""%9"" == ""-x"" GOTO exit 

REM Utilizo el SHIFt para acceder a los argumentos superiores al noveno
SHIFT
SHIFT
SHIFT
if ""%7"" == ""-x"" GOTO exit  
if ""%8"" == ""-x"" GOTO exit
if ""%9"" == ""-x"" GOTO exit


if "%ERRORLEVEL%"=="" GOTO :ERRORLEVEL_null
ECHO.
ECHO Resultado de la ejecucion: %ERRORLEVEL%

GOTO :FIN

:ERRORLEVEL_null
ECHO.
ECHO Resultado de la ejecucion: %ERROR_LEVEL%

GOTO :FIN

:exit

if "%ERRORLEVEL%"=="" GOTO :ERRORLEVEL_null
exit %ERRORLEVEL%

:ERRORLEVEL_null
exit %ERROR_LEVEL%


:FIN