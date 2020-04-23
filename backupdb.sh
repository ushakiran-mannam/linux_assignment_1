#!/bin/bash

function store_db_details {
	
	echo "[client]
	user = root
	password = ''
	host = localhost" >> .my.cnf
}
function backup_db {

	#making folder in opt for backup
	#sudo mkdir /opt/backups

	#taking backup of db
	sudo mysqldump hospital_db > hospital_db_backup.sql

	#moving backup to required directory
	sudo mv hospital_db_backup.sql /opt/backups/hospital_db.sql

}

function archive_db {

	#archiving db
	tar -cjvf db_archive.tar.gz -C / opt/backups/hospital_db.sql
}

store_db_details
backup_db
archive_db

