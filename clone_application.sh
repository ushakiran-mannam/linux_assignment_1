#!/bin/bash

function install_git {

	#installing git
	sudo apt install git -y

}

function clone_repo {

	#changing to apache serving directory
	cd /var/www/html/

	#removing default page	
	sudo rm index.html

	#cloning repo
	sudo git clone https://github.com/ushakiran-mannam/php-sample.git	

}

function dump_db_file {
	
	#mysql commands to take db dump 
	sudo mysql -u root -p  <<-my
	create database hospital_db;
	use hospital_db;
	source /var/www/html/php-sample/hospital_db.sql;
	show tables;
	my

}

function check_site_availability {

	
	#checking site availabilty	
	curl -Is http://localhost/php-sample/Doctor/ | head -1

}

function back_up_script {
	
	#running backup script
	./backupdb.sh	

}

#install_git
#clone_repo
#dump_db_file
#check_site_availability
back_up_script

