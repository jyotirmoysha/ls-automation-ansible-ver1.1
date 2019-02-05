#!/bin/sh

SRC_DIR="/home/rage/LiveSpreadArtefacts"
DST_DIR="/home/rage/CORA-LS-Automation/livespread-automation-ansible-ver1.1/roles"

USR="rage"
GRP="rage"
rageFolderName="rage"

userID="livespread"
pwd="Wecas4eN"

root="home"
user="rage"

echo "Start moving artefacts to Automation Location +++++++++++++"
mv $SRC_DIR/$rageFolderName.tar.gz $DST_DIR/wildfly/files/rage.tar.gz
mv $SRC_DIR/certificate.tar.gz $DST_DIR/wildfly/files/
mv $SRC_DIR/deployments.tar.gz $DST_DIR/wildfly/files/
mv $SRC_DIR/codec.tar.gz $DST_DIR/wildfly/files/
mv $SRC_DIR/eoplugin.tar.gz $DST_DIR/wildfly/files/

mv $SRC_DIR/LS_File_Conversion $DST_DIR/move-rage-files/files
mv $SRC_DIR/FileConversionService $DST_DIR/move-rage-files/files

mv $SRC_DIR/input.properties $DST_DIR/web-application/files
mv $SRC_DIR/LiveSpread.war $DST_DIR/web-application/files

cp -r $SRC_DIR/Parser_Scripts $DST_DIR/move-ui-files/files
mv $SRC_DIR/Parser_Scripts $DST_DIR/move-rage-files/files

mv $SRC_DIR/AutomationJarAndProp $DST_DIR/rd-import/files

echo "End moving artefacts to Automation Location +++++++++++++"

echo "Started moving softwares to Automation Location +++++++++++++"

mv $SRC_DIR/wildfly-10.1.0.Final.tar.gz $DST_DIR/wildfly/files
cp -r $SRC_DIR/jdk-8u111-linux-x64.tar.gz $DST_DIR/wildfly/files
cp -r $SRC_DIR/US_export_policy.jar $DST_DIR/wildfly/files
cp -r $SRC_DIR/local_policy.jar $DST_DIR/wildfly/files

mv $SRC_DIR/apache-tomcat-8.0.39.tar.gz $DST_DIR/tomcat/files
cp -r $SRC_DIR/jdk-8u111-linux-x64.tar.gz $DST_DIR/tomcat/files
cp -r $SRC_DIR/US_export_policy.jar $DST_DIR/tomcat/files
cp -r $SRC_DIR/local_policy.jar $DST_DIR/tomcat/files

mv $SRC_DIR/jdk-8u111-linux-x64.tar.gz $DST_DIR/rd-import/files
mv $SRC_DIR/US_export_policy.jar $DST_DIR/rd-import/files
mv $SRC_DIR/local_policy.jar $DST_DIR/rd-import/files

mv $SRC_DIR/standalone-full.xml $DST_DIR/wildfly/files
mv $SRC_DIR/setenv.sh $DST_DIR/wildfly/files

echo "End moving softwares to Automation Location +++++++++++++"