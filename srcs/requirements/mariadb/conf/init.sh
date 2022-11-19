#!/bin/bash
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

service mysql start
if [ ! -d "/var/lib/mysql/mysql"]; then
	mkdir -p /var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql > /dev/null
	mysql -u root -p << EOF
UPDATE mysql.user SET Password=PASSWORD('123456') WHERE User='root';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER 'romain'@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
EOF
fi
#run init.sql
sed -i "s|skip-networking|# skip-networking|" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
echo "all good"
exec mysqld --user=mysql --console