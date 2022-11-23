#mariadb dockerfile config
FROM alpine:3.15

RUN apk update && apk add --no-cache mariadb mariadb-client
LABEL version="1.0"
LABEL description="MariaDB Server"
#set up mariadb
COPY ./conf/init.sh /tmp/init.sh
COPY ./conf/server.cnf /etc/my.cnf.d/mariadb-server.cnf
ENTRYPOINT ["sh", "/tmp/init.sh"]