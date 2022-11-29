#!/bin/bash
#wordpress-cli setup
while ! mysql -h $MYSQL_HOST -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE &> /dev/null; do
	echo "Waiting for database connection..."
	sleep 5
done
sleep 10
if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Installing wordpress..."
	mkdir -p /var/www/html
	cd /var/www/html
	wp core download --allow-root
	mv /var/www/wp-config.php /var/www/html/wp-config.php
	#replace below with env variables, do i need --admin_email?
	wp core install --allow-root --url=$URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL
	wp theme install $WPTHEME --activate --allow-root
	wp user create --allow-root $WPUSER1 $WPUSER1MAIL --role=administrator --user_pass=$WPUSER1PWD
	wp user create --allow-root $WPUSER2 $WPUSER2MAIL --role=author --user_pass=$WPUSER2PWD
	chmod 755 /var/www/html
	chown -R www-data:www-data /var/www/html
	echo "Wordpress installed"
fi
/usr/sbin/php-fpm7 -F -R