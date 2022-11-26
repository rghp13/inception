#Wordpress/PHP dockerfile
FROM alpine:3.15

RUN (delgroup www-data || true)
RUN adduser -D -H -u 1000 -s /bin/bash www-data
RUN apk update && apk add mariadb-client wget
RUN apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session php7-phar
LABEL version="1.0"
LABEL description="Wordpress Server"
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xvf latest.tar.gz && rm latest.tar.gz
RUN mv /var/www/wordpress /var/www/html
RUN chown -R root:root /var/www/html
#php config

#install wordpresscli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#was /etc/php7/pool.d
COPY ./conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY ./tools/wp-config.php /var/www/
COPY ./tools/init.sh /tmp/init.sh
ENTRYPOINT ["sh", "/tmp/init.sh"]
#CMD [ "/usr/sbin/php-fpm7", "-F -R" ]