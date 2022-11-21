#nginx dockerfile
FROM alpine:3.15

RUN apk update && apk add --no-cache nginx openssl
LABEL version="1.0"
LABEL description="Nginx Server"
#set up nginx
EXPOSE 443
COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./conf/init.sh /tmp/init.sh
ENTRYPOINT ["sh", "/tmp/init.sh"]