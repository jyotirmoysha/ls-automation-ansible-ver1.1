#!/bin/sh

SRC_DIR="livespread@ftp.rageframeworks.com:/LS_V4_Installation_Package/Linux_Package"
DST_DIR="/home/rage/CORA-LS-Automation/livespread-automation-ansible-ver1.1"
VER="V2"
WILD_FLY="wildfly-10.1.0.Final.tar.gz"
USR="rage"
GRP="rage"
rageFolderName="rage_bas"

userID="livespread"
pwd="Wecas4eN"

root="home"
user="rage"

echo "Started copying softwares from ftp  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Softwares/wildfly-10.1.0.Final.tar.gz  /$root/$user/LiveSpreadArtefacts
sshpass -p "$pwd" scp -r $SRC_DIR/Softwares/apache-tomcat-8.0.39.tar.gz  /$root/$user/LiveSpreadArtefacts
sshpass -p "$pwd" scp -r $SRC_DIR/Softwares/jdk-8u111-linux-x64.tar.gz  /$root/$user/LiveSpreadArtefacts
sshpass -p "$pwd" scp -r $SRC_DIR/Softwares/local_policy.jar  /$root/$user/LiveSpreadArtefacts
sshpass -p "$pwd" scp -r $SRC_DIR/Softwares/US_export_policy.jar  /$root/$user/LiveSpreadArtefacts
echo "End copying softwares from ftp  +++++++++++++"

echo "Start copying artefacts! from FTP to UI VM +++++++++++++"

echo "Start copying Parser_Scripts +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Extraction_Package/$VER/Parser_Scripts  /$root/$user/LiveSpreadArtefacts
echo "End copying Parser_Scripts +++++++++++++"

echo "Start copying LS_File_Conversion +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/OCR_FileConversion/$VER/Processing_Package/LS_File_Conversion  /$root/$user/LiveSpreadArtefacts
echo "End copying LS_File_Conversion +++++++++++++"

echo "Start copying FileConversionService   +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/OCR_FileConversion/$VER/Processing_Package/FileConversionService  /$root/$user/LiveSpreadArtefacts
echo "End copying FileConversionService   +++++++++++++"

echo "Start copying setenv.sh +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/setenv.sh  /$root/$user/LiveSpreadArtefacts
echo "End copying setenv.sh +++++++++++++"

echo "Start copying LiveSpread.war +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Application_Package/$VER/LiveSpread.war  /$root/$user/LiveSpreadArtefacts
echo "End copying LiveSpread.war +++++++++++++"

echo "Start copying input.properties +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Application_Package/$VER/input.properties  /$root/$user/LiveSpreadArtefacts
echo "End copying input.properties +++++++++++++"

echo "Start copying AutomationJarAndProp +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/RD_Automation/$VER/AutomationJarAndProp /$root/$user/LiveSpreadArtefacts
echo "End copying AutomationJarAndProp +++++++++++++"

echo "Start copying codec  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Wildfly/$VER/Wildfly-Artefacts/codec  /$root/$user/LiveSpreadArtefacts
echo "End copying codec  +++++++++++++"

echo "Start copying eoplugin  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Wildfly/$VER/Wildfly-Artefacts/eoplugin  /$root/$user/LiveSpreadArtefacts
echo "End copying eoplugin  +++++++++++++"

echo "Start copying certificate  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Wildfly/$VER/Wildfly-Artefacts/certificate  /$root/$user/LiveSpreadArtefacts
echo "End copying certificate  +++++++++++++"

echo "Start copying deployments  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Wildfly/$VER/Wildfly-Artefacts/deployments  /$root/$user/LiveSpreadArtefacts
echo "End copying deployments  +++++++++++++"

echo "Start copying $user  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Wildfly/$VER/Wildfly-Artefacts/$rageFolderName /$root/$user/LiveSpreadArtefacts
mv /$root/$user/LiveSpreadArtefacts/$rageFolderName  /$root/$user/LiveSpreadArtefacts/rage
echo "End copying $user  +++++++++++++"

echo "Start copying rage  +++++++++++++"
sshpass -p "$pwd" scp -r $SRC_DIR/Wildfly/$VER/Wildfly-Artefacts/standalone-full.xml /$root/$user/LiveSpreadArtefacts
echo "End copying rage  +++++++++++++"

echo "Start copying Rage Process XML's  +++++++++++++"

rm -rf /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS;mkdir /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS
sshpass -p "$pwd" scp -r $SRC_DIR/Rage_Process/$VER/Triggered_Processes/ /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS
sshpass -p "$pwd" scp -r $SRC_DIR/Rage_Process/$VER/Invoke_Processes/ /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS

cp -r /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS/Invoke_Processes/* /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS
cp -r /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS/Triggered_Processes/* /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS

rm -rf /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS/Invoke_Processes/
rm -rf /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS/Triggered_Processes/

chown -R $user.$user /$root/$user/LiveSpreadArtefacts

mv /$root/$user/LiveSpreadArtefacts/Rage_Process_XMLS /$root/$user/  
echo "End copying Rage Process XML's  +++++++++++++"

echo "Started making tar gz files  +++++++++++++"
tar -zcvf certificate.tar.gz certificate
tar -zcvf deployments.tar.gz deployments
tar -zcvf codec.tar.gz codec  
tar -zcvf eoplugin.tar.gz eoplugin
tar -zcvf rage.tar.gz rage
echo "End making tar gz files  +++++++++++++"

echo "Started removing folders files  +++++++++++++"
rm -rf certificate
rm -rf deployments
rm -rf codec
rm -rf eoplugin
rm -rf rage
echo "End removing folders files  +++++++++++++"

chown -R $user.$user /$root/$user/LiveSpreadArtefacts

echo "END copying artefacts! from FTP to UI VM +++++++++++++"




