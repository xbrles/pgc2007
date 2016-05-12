@echo off

rem ===================================================================
rem                    					     XSLTransformer
rem  ===================================================================
rem
rem Description: Script utilizado para lanzar el transformador XSLT basado en saxon9 
rem                    de la API para la visualizacion HTML de informes XBRL de PGC

rem ejemplo de ejecución:
rem runXSLTransformer.bat D:/apixbrlpgc07_shell_v142_r2/resources/XSLTransformer "sample.xml" "xml2html.xsl" "sample-out.html" "module=bal;configPath=D:/apixbrlpgc07_shell_v142_r2/resources/XSLTransformer/resources/"

@echo.
if ""%1""=="""" goto end_noParam1
if ""%2""=="""" goto end_noParam2
if ""%3""=="""" goto end_noParam3
if ""%4""=="""" goto end_noParam4
REM if ""%5""=="""" goto end_noParam5

IF EXIST "./jre1.6.0_02/bin/java.exe" GOTO relativePath
GOTO absolutPath

:relativePath

"./jre1.6.0_02/bin/java.exe" -classpath %1;%1/XSLTransformer.jar;%1/lib/saxon9-ant.jar;%1/lib/saxon9-dom.jar;%1/lib/saxon9-s9api.jar;%1/lib/saxon9.jar;%1/lib/xercesImpl.jar;%1/lib/xml-apis.jar;%1/lib/log4j-1.2.15.jar es.inteco.xbrl.pgc.utils.XSLTransformer %2 %3 %4 %5

@echo.
@echo.
GOTO end

:absolutPath
java.exe -classpath %1;%1/XSLTransformer.jar;%1/lib/saxon9-ant.jar;%1/lib/saxon9-dom.jar;%1/lib/saxon9-s9api.jar;%1/lib/saxon9.jar;%1/lib/xercesImpl.jar;%1/lib/xml-apis.jar;%1/lib/log4j-1.2.15.jar es.inteco.xbrl.pgc.utils.XSLTransformer %2 %3 %4 %5

@echo.
@echo.
goto end


:end_noParam1
@echo FAILED. Param 1 [base path] is required
shift
goto usage


:end_noParam2
@echo FAILED. Param 2 [input document] is required
shift
goto usage


:end_noParam3
@echo FAILED. Param 3 [style sheet] is required
shift
goto usage


:end_noParam4
@echo FAILED. Param 4 [output document] is required
shift
goto usage



REM :end_noParam5
REM @echo FAILED. Param 5 [output path] is required
REM shift
REM goto end

REM exit %ERROR_LEVEL%


:usage
@echo  ===================================================================
@echo                          XSLTransformer
@echo   ===================================================================
@echo. 
@echo Description: Script utilizado para lanzar el transformador XSLT basado en saxon9 
@echo                    de la API para la visualizacion HTML de informes XBRL de PGC
@echo.
@echo  usage:  
  @echo "runXSLTransformer.bat basepath inputdocument stylesheet outputdocument [outputpath] [Stylesheet Params]"
  @echo "Param 1 [base path] is required"
  @echo "Param 2 [input document] is required"
  @echo "Param 3 [style sheet] is required"
  @echo "Param 4 [output document] is required"
  @echo "Param 5 [output path] is optional"
  @echo "Param 6 [stylesheet params] is optional. Format: "param1=value;param2=value;..."
  @echo. 
  @echo "APIPGC execution sample:
  @echo  runXSLTransformer.bat D:/apixbrlpgc07_shell_v142_r2/resources/XSLTransformer "sample.xml" "xml2html.xsl" "sample-out.html" "module=bal;configPath=D:/apixbrlpgc07_shell_v142_r2/resources/XSLTransformer/resources/"
  @echo.
goto end

:end
rem exit %ERROR_LEVEL%