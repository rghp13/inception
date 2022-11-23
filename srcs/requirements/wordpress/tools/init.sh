#!/bin/bash
#wordpress-cli setup
sleep 10
if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Installing wordpress..."
	mkdir -p /var/www/html
	cd /var/www/html
	wp core download --allow-root
	mv /var/www/wp-config.php /var/www/html/wp-config.php
	#replace below with env variables, do i need --admin_email?
	wp core install --allow-root --url=$URL/wordpress --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD
	wp user create --allow-root $WPUSER1 $WPUSER1MAIL --role=administrator --user_pass=$WPUSER1PWD
	wp user create --allow-root $WPUSER2 --user_pass=$WPUSER2PWD --role=author
	echo "Wordpress installed"
fi