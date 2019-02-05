#!/bin/sh

SRC_DIR="livespread@ftp.rageframeworks.com:/LS_V4_Installation_Package/Linux_Package"
DST_DIR="/home/rage/CORA-LS-Automation/livespread-automation-ansible-ver1.1/roles"
VER="V2"
WILD_FLY="wildfly-10.1.0.Final.tar.gz"
USR="rage"
GRP="rage"
rageFolderName="rage_bas"

userID="livespread"
pwd="Wecas4eN"

root="home"
user="rage"

echo "Start deleting artefacts! +++++++++++++"

rm -rf $DST_DIR/wildfly/files/*
rm -rf $DST_DIR/web-application/files/*
rm -rf $DST_DIR/tomcat/files/*
rm -rf $DST_DIR/rd-import/files/*
rm -rf $DST_DIR/rage-process/files/*
rm -rf $DST_DIR/move-ui-files/files/*
rm -rf $DST_DIR/move-rage-files/files/*

echo "End deleting artefacts! +++++++++++++"


