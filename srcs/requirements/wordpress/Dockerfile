FROM debian:buster

RUN apt-get update && apt-get -y install \
	php7.3-fpm \
	php7.3-mysql \
	mariadb-client \
	wget \
	&& rm -rf /var/lib/apt/lists/*

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

#Downloads the latest version of WordPress from the official website.
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
RUN cd /var/www && tar -xvf latest.tar.gz && \
	rm -rf latest.tar.gz

#download the latest version of WP-CLI, a command-line interface for managing WordPress websites
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x ./wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php

COPY ./conf/config.sh /var/www/wordpress/config.sh
RUN chmod +x /var/www/wordpress/config.sh

CMD ["bash", "/var/www/wordpress/config.sh"]
