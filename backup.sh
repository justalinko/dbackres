#!/bin/bash

source /etc/db_backres/db_alinko.conf

backup_db(){
		echo "========================================================" >> /var/log/db_backup.log
mysqldump -h $hostname_a -u $username_a -p$password_a $db_name > $backupdb
if [[ $? -eq 0 ]]; then
 	echo "SUCCESS BACKUP DATABASE ["$formatgl"] --> "$backupdb >> /var/log/db_backup.log
 	mysqldump -h $hostname_a -u $username_a -p$password_a $db_name > $backupdbs
 else
 	echo "FAILED BACKUP DATABASE ["$formatgl"] --> "$backupdb >> /var/log/db_backup.log
 fi 
 		echo "========================================================" >> /var/log/db_backup.log

}
backup_db
