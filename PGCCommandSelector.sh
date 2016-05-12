#!/bin/sh
#
# ===================================================================
#                         PGCCommandSelector
# ===================================================================
#
# Description: Script utilizado para lanzar los servicios 
#              de la API de tratamiento XBRL de PGC
#              
### END INIT INFO
CLASSPATH=.:./properties/:./config/:./lib/APIXBRLPGC.jar:./lib/axis.jar:./lib/backport-util-concurrent-3.0.jar:./lib/castor-1.2-anttasks.jar:./lib/castor-1.2-codegen.jar:./lib/castor-1.2-ddlgen.jar:./lib/castor-1.2.jar:./lib/castor-1.2-jdo.jar:./lib/castor-1.2-xml.jar:./lib/castor-1.2-xml-schema.jar:./lib/commons-discovery-0.2.jar:./lib/commons-logging-1.1.1.jar:./lib/commons-logging-adapters-1.1.1.jar:./lib/commons-logging-api-1.1.1.jar:./lib/ehcache-1.5.0.jar:./lib/javax.wsdl_1.5.1.v200806030408.jar:./lib/jaxrpc.jar:./lib/jsr107cache-1.0.jar:./lib/junit.jar:./lib/log4j-1.2.15.jar:./lib/org.apache.commons.logging_1.0.4.v20080605-1930.jar:./lib/resolver.jar:./lib/saaj.jar:./lib/velocity-1.5.jar:./lib/velocity-dep-1.5.jar:./lib/ubm/dom.jar:./lib/ubm/jaxb-api.jar:./lib/ubm/jaxb-impl.jar:./lib/ubm/jaxb-libs.jar:./lib/ubm/jaxp-api.jar:./lib/ubm/log4j-1.2.9.jar:./lib/ubm/org-jdesktop-layout.jar:./lib/ubm/relaxngDatatype.jar:./lib/ubm/sax.jar:./lib/ubm/saxon.jar:./lib/ubm/swing-layout-1.0.jar:./lib/ubm/xalan.jar:./lib/ubm/XBRLProcessorSDK.jar:./lib/ubm/xercesImpl.jar:./lib/ubm/xml-apis.jar:./lib/ubm/xmlcomp.jar:./lib/ubm/xmlparserv2.jar:./lib/ubm/xsdlib.jar

javapath=./jre1.6.0_02/bin/java
if [ ! -e $javapath ] 
then 
  javapath=java
fi
$javapath -Dfile.encoding=cp850 -Xmx1G -classpath $CLASSPATH es.inteco.xbrl.pgc.commandline.ShellWrapper $*


exit 0

