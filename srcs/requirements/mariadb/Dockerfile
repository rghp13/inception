#mariadb dockerfile config
FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server vim
LABEL version="1.0"
LABEL description="MariaDB Server"

HEALTHCHECK --start-period=5m \
	CMD mariadb -e 'SELECT @@datadir;' || exit 1
#set up mariadb
