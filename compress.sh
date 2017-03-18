#!/bin/bash

source /etc/db_backres/db_alinko.conf

cek_jml=`ls /var/db_backres/backup | wc -l`
if [[ $cek_jml > 2 ]]; then
	zip -r /var/db_backres/backup/bak_$formatgl.zip /var/db_backres/backup > /dev/null 2>&1
	rm /var/db_backres/backup/*.sql
	echo "========================================================" >> /var/log/db_backup.log
	echo "FILES BACKUP COUNT AT [ "$formatgl" ] :: "$cek_jml" :: " >> /var/log/db_backup.log  
	echo "COMPRESSED /var/db_backres/backup/bak_"$formatgl".zip" >> /var/log/db_backup.log
	echo "========================================================" >> /var/log/db_backup.log
else
	echo "========================================================" >> /var/log/db_backup.log
	echo "FILES BACKUP COUNT AT [ "$formatgl" ] :: "$cek_jml" :: " >> /var/log/db_backup.log  
	echo "========================================================" >> /var/log/db_backup.log
fi
