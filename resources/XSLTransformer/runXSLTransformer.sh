#!/bin/sh
#
# ===================================================================
#                         XSLTransformer
# ===================================================================
#
# Description: Script utilizado para lanzar los el transformador XSLT 
#              de la API basado en saxon9 para visualización XBRL de PGC
#              
### 
# comprobacion de parametros de entrada.
usage(){
  echo "$0 basepath inputdocument stylesheet outputdocument [outputpath]"
  echo "Param 1 [base path] is required"
  echo "Param 2 [input document] is required"
  echo "Param 3 [style sheet] is required"
  echo "Param 4 [output document] is required"
  echo "Param 5 [output path] is optional"
  return
}

ARGNO=4
if [ $# -lt "$ARGNO" ]
then
{
  usage
  exit
}
fi

# comprobacion de version jre a ejecutar:
javapath=./jre1.6.0_02/bin/java
if [ ! -e $javapath ] 
then 
  javapath=java
fi

#ejecucion con classpath
CLASSPATH=$1:$1/XSLTransformer.jar:$1/lib/saxon9-ant.jar:$1/lib/saxon9-dom.jar:$1/lib/saxon9-s9api.jar:$1/lib/saxon9.jar:$1/lib/xercesImpl.jar:$1/lib/xml-apis.jar:$1/lib/log4j-1.2.15.jar


#echo "====== depuracion ejecucion comando: =========="
#echo "== " + $javapath -classpath $CLASSPATH es.inteco.xbrl.pgc.utils.XSLTransformer $2 $3 $4 $5 + "=="
#echo "====== ejecucion: =========="
$javapath -classpath $CLASSPATH es.inteco.xbrl.pgc.utils.XSLTransformer $2 $3 $4 $5

#ejemplo ejecucion trazada:
#"/var/tmp/apixbrlpgc07_shell_v141/resources/XSLTransformer/runXslTransformer.sh" "/var/tmp/apixbrlpgc07_shell_v141/resources/XSLTransformer/" "/home/wasabi/workspace/DanielBalsa-workspace_30sep2011/inteco_apixbrlpc07_src_v14/log/transformation/viewerxml3627863755434474696.xml" "/var/tmp/apixbrlpgc07_shell_v141/resources/XSLTransformer/xml2html.xsl" "/home/wasabi/workspace/DanielBalsa-workspace_30sep2011/inteco_apixbrlpc07_src_v14/log/transformation/viewerhtml2772973300453874107.html" "module=bal;configPath=/var/tmp/apixbrlpgc07_shell_v141/resources/XSLTransformer/"

exit 0

