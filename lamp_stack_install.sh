#!/bin/bash

#finding the linux env current shell is running on

distro=$(lsb_release -is)
echo "Linux distribution is: $distro"  

#installing LAMP stack based on distro

function install_lamp_stack {

case $distro in
Ubuntu | Debian )
	echo "found ubuntu system"
        
        #updating package references
	sudo apt-get update -y && sudo apt-get upgrade -y
	
	#installing mysql
	sudo apt-get install mysql-server mysql-client -y

	#installing apache
	sudo apt-get install apache2 apache2-doc apache2-utils -y

	#installing php
        sudo apt-get install php php-mysql libapache2-mod-php php-cli

	#enabling apache
	sudo systemctl enable apache2

	#starting apache server
        sudo service start apache2

        #allowing traffic 
	sudo ufw allow in "Apache Full"

        #changing permission for directory
	sudo chmod -R 0755 /var/www/html/;;

Centos )
        echo "found debian based system";;
* )
	echo "commands not listed for your distro";;
esac

}

function check_lamp_stack_status {

	#checking status of apache server
	sudo service apache2 status

	#checking status of mysql server
	sudo mysqladmin -u root -p status

}

function start_lamp_stack {

	#starting apache server
        sudo service apache2 start

	if [ $? -eq 0 ]
	then
	    echo "apache server started"
	else
	    echo "apache server not started"
	fi

	#starting mysql server
	sudo service mysql start

	if [ $? -eq 0 ]
	then
	    echo "mysql started"
	else
	    echo "mysql not started"
	fi

        echo "LAMP stack started successfully"

}

function stop_lamp_stack {

	#stopping apache2 server
        sudo service apache2 stop

	if [ $? -eq 0 ]
	then
	    echo "apache server stopped"
	else
            echo "apche server not stopped"
	fi

	#stopping mysql server
        sudo service mysql stop

	if [ $? -eq 0 ]
	then
	    echo "mysql stopped"
	else
	    echo "mysql not stopped"
	fi

	echo "LAMP stack stopped successfully"

}


#install_lamp_stack
#start_lamp_stack
check_lamp_stack_status
#stop_lamp_stack



