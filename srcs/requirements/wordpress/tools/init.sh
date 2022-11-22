#!/bin/bash
#wordpress-cli setup
sleep 10
ln -s /usr/bin/php
if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Installing wordpress..."
	mkdir -p /var/www/html
	cd /var/www/html
	wp core download --allow-root
	mv /var/www/wp-config.php /var/www/html/wp-config.php
	#replace below with env variables, do i need --admin_email?
	wp core install --allow-root --url=rponson.42.fr --title=wordpress --admin_user=wordpress_user --admin_password=password
	wp user create --allow-root romain rghp13@gmail.com --role=administrator --user_pass=1234
	wp user create --allow-root correcteur --user_pass=grademe --role=author
	echo "Wordpress installed"
	find / -name php
	sleep 10
fi