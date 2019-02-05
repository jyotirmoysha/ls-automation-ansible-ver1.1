
## SET VARIABLES
EXECUTION_DIR=$(dirname $0)
echo $EXECUTION_DIR

export JAVA_HOME
JAVA=$JAVA_HOME/bin/java

#EXECUTION_DIR=/home/rage/LS_File_Conversion

LIB_DIR=./lib
APP_JAR=./pdf-utility-api-v2.8.jar
date=`date +%Y-%m-%d-%H`


export CLASSPATH=$CLASSPATH:$APP_JAR;
export CLASSPATH=$CLASSPATH:$LIB_DIR/ojdbc5.jar
export CLASSPATH=$CLASSPATH:$LIB_DIR/sqljdbc4-2.0.jar
export CLASSPATH=$CLASSPATH:$LIB_DIR/jtds-1.2.5.jar
export CLASSPATH=$CLASSPATH:$LIB_DIR/apache-commons-lang.jar
export CLASSPATH=$CLASSPATH:$LIB_DIR/ops-client-api-v1.2.jar

echo "CHANGING TO THE APPROPRIATE DIRECTORY"
cd $EXECUTION_DIR

docID=$1
fileName=$2
outputFile=$3

$JAVA com.rage.document.flags.ops12.OCRDocument $docID -s http://{{MyOpsServerName}}/Nuance.OmniPage.Server.Service -i $fileName -o $outputFile -j 16 --languages LANG_ENG,LANG_GER --quality Best --tradeoff Accuracy

echo "OCR Process Completed Successfully"
