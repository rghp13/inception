#nginx dockerfile
FROM alpine:3.15

RUN (delgroup www-data || true)
RUN adduser -D -H -u 1000 -s /bin/bash www-data
RUN apk update && apk add --no-cache nginx openssl curl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=rponsonn.42.fr/UID=rponsonn"
RUN mkdir -p /run/nginx
LABEL version="1.0"
LABEL description="Nginx Server"
#set up nginx
EXPOSE 443
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html/
RUN chown -R www-data:www-data /var/www/html/
#COPY ./conf/default /etc/nginx/sites-enabled/default.conf
#COPY ./conf/init.sh /tmp/init.sh
CMD ["nginx", "-g", "daemon off;"]