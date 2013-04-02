#!/bin/sh
# File:    $HOME/backup_db.sh
# Author:  Jinma Li
# Version: 1.1
 
# Database info
DB_USER="root"
DB_PASS="yourPassword"
DB_NAME="yourDatabase"
 
# Some vars
BIN_DIR="/opt/local/bin"
BCK_DIR=$HOME/"backup"
DATE=`date +%Y-%m-%d-%H%M%S`
DATE_YEAR=`date +%Y`
DATE_MONTH=`date +%m`
 
# Make Dir
echo $BCK_DIR/$DATE_YEAR-$DATE_MONTH

if test -d $BCK_DIR/$DATE_YEAR-$DATE_MONTH
then
    echo "directory $BCK_DIR/$DATE_YEAR-$DATE_MONTH exists."
else
    echo "directory $BCK_DIR/$DATE_YEAR-$DATE_MONTH does not exists. make dir..."
    mkdir -p $BCK_DIR/$DATE_YEAR-$DATE_MONTH
fi
 
# Backup

$BIN_DIR/mysqldump --opt -u$DB_USER -p$DB_PASS $DB_NAME | gzip > $BCK_DIR/$DATE_YEAR-$DATE_MONTH/${DB_NAME}_dump_$DATE.sql.gz
