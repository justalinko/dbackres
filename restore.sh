#!/bin/bash

source /etc/db_backres/db_alinko.conf

restore_db(){
		echo "========================================================" >> /var/log/db_backup.log
	cat $backupdbs > /dev/null 2>&1
	if [[ $? -eq 0 ]]; then
	 mysql -h $hostname_a -u $username_a -p$password_a -e 'CREATE DATABASE '$db_name'' 
	 mysql -h $hostname_a -u $username_a -p$password_a $db_name -e 'source '$backupdbs''
	 if [[ $? -eq 0 ]]; then

	 	echo "SUCCESS RESTORE DATABASE "$db_name" ;) ["$formatgl"] " >>  /var/log/db_backup.log
	 else
	 	echo "FAILED RESTORE DATABASE "$db_name" :( ["$formatgl"] Problem Found In DATABASE Connection." >> /var/log/db_backup.log
	 fi
 else
	 echo "FAILED RESTORE DATABASE "$db_name" File Backup Not Found ["$formatgl"]." >> /var/log/db_backup.log

	fi
		echo "========================================================" >> /var/log/db_backup.log
}

mysql -h $hostname_a -u $username_a -p$password_a -e 'USE '$db_name'' > /dev/null 2>&1
if [[ $? -eq 0 ]]; then
 	echo "CHECKED DATABASE NAME -> "$db_name" ["$formatgl"] EXIST .. " >> /var/log/db_backup.log
 else
 	echo "CHECKED DATABASE NAME -> "$db_name" ["$formatgl"] NOT EXIST .." >> /var/log/db_backup.log
 	restore_db
 fi 
