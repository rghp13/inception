#mariadb dockerfile config
FROM alpine:3.15

RUN apk update && apk add mariadb mariadb-client
LABEL version="1.0"
LABEL description="MariaDB Server"
#set up mariadb
COPY ./conf/init.sh /tmp/init.sh
ENTRYPOINT ["sh", "/tmp/init.sh"]
