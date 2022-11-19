#mariadb dockerfile config
FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-client mariadb-server vim
LABEL version="1.0"
LABEL description="MariaDB Server"
#RUN service mysql start
HEALTHCHECK --start-period=5m \
	CMD mariadb -e 'SELECT @@datadir;' || exit 1
#set up mariadb
COPY ./conf/init.sh /tmp/init.sh
#ENTRYPOINT ["sh", "/tmp/init.sh"]
ENTRYPOINT [ "mysqld" ]
