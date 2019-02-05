#!/bin/sh

SRC_DIR="/home/rage/Akshay/Capone_SB_Package_21Oct"
DST_DIR="/home/rage/ONEDRIVE/ONEDRIVE-GENPACT/RAGE/CAPONE/livespread-automation-ansible"
WILD_FLY="wildfly-10.1.0.Final.tar.gz"
USR="rage"
GRP="rage"

echo "Start copying UI artefacts! +++++++++++++"

tar -zxvf $SRC_DIR/copy_to_Wildfly_Server.tar.gz
#tar -zxvf $SRC_DIR/ApplicationPackage.tar.gz

cp -rn $SRC_DIR/copy_to_Wildfly_Server/Parser_Scripts $DST_DIR/roles/move-ui-files/files
cp -rn $SRC_DIR/copy_to_Wildfly_Server/setenv.sh $DST_DIR/roles/move-ui-files/files

cp -rn $SRC_DIR/ApplicationPackage/LiveSpread.war $DST_DIR/roles/web-application/files
cp -rn $SRC_DIR/ApplicationPackage/input.properties $DST_DIR/roles/web-application/files

chown -R $USR.$GRP $DST_DIR/roles/move-ui-files/files
chown -R $USR.$GRP $DST_DIR/roles/web-application/files

echo "Done copying UI artefacts! +++++++++++++"

echo "Start copying Rage artefacts! +++++++++++++"

cp -rn $SRC_DIR/copy_to_Wildfly_Server/Parser_Scripts $DST_DIR/roles/move-rage-files/files
cp -rn $SRC_DIR/copy_to_Wildfly_Server/LS_File_Conversion $DST_DIR/roles/move-rage-files/files
cp -rn $SRC_DIR/copy_to_Wildfly_Server/FileConversionService $DST_DIR/roles/move-rage-files/files
cp -rn $SRC_DIR/copy_to_Wildfly_Server/setenv.sh $DST_DIR/roles/move-rage-files/files

chown -R $USR.$GRP $DST_DIR/roles/move-rage-files/files

tar -zcvf certificate.tar.gz certificate
tar -zcvf deployments.tar.gz deployments

chown -R $USR.$GRP $DST_DIR

cp -rn $SRC_DIR/certificate.tar.gz $DST_DIR/roles/wildfly/files
cp -rn $SRC_DIR/deployments.tar.gz $DST_DIR/roles/wildfly/files

#tar -zxvf $SRC_DIR/rage.tar.gz
#cd $SRC_DIR/rage
#tar -zcvf codec.tar.gz codec
#tar -zcvf eoplugin.tar.gz eoplugin
#tar -zcvf rage.tar.gz rage

chown -R $USR.$GRP $DST_DIR
#cd $SRC_DIR
cp -rn $SRC_DIR/rage/codec $DST_DIR/roles/wildfly/files
cp -rn $SRC_DIR/rage/eoplugin $DST_DIR/roles/wildfly/files
cp -rn $SRC_DIR/rage/rage $DST_DIR/roles/wildfly/files
cp -rn $SRC_DIR/$WILD_FLY $DST_DIR/roles/wildfly/files

#tar -zxvf $SRC_DIR/standalone-full.xml.tar.gz

cp -rn $SRC_DIR/standalone-full.xml $DST_DIR/roles/wildfly/files

chown -R $USR.$GRP $DST_DIR/roles/wildfly/files

echo "Done copying Rage artefacts! +++++++++++++"

echo "Start copying rage jar artefacts! +++++++++++++"

cp -rn $SRC_DIR/copy_to_Wildfly_Server/Rage_Automation_Package $DST_DIR/roles/rd-import/files

echo "Done copying rage jar artefacts! +++++++++++++"

echo "Start copying copying softwares! +++++++++++++"

cp -rn $SRC_DIR/copy_to_Wildfly_Server/Rage_Automation_Package $DST_DIR/roles/rd-import/files


echo "End copying copying softwares! +++++++++++++"
ldconfig

echo "Done!"

