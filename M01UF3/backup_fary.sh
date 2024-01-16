#!/bin/bash

FECHAHORA=`date "+%Y%m%e%H%M%S"`
DIR=/home/enti
ARCHIVO=$DIR/backups/backups_"$FECHAHORA"
mysqldump faryadventures -u farybackup > /home/enti/backups/backup_"$FECHAHORA".sql
tar -czf $DIR/comprimido_$FECHAHORA.tar.gz $ARCHIVO










