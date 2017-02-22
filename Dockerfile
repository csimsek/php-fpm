FROM ubuntu:latest

RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install curl

RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash

RUN apt-get -y install \
	php-intl \
	php-dba \
	php-sqlite3 \
	php-gmp \
	php-common \
	php-xsl \
	php-fpm \
	php-mysqlnd \
	php-enchant \
	php-pspell \
	php-mbstring \
	php-xmlrpc \
	php-xmlreader \
	php-exif \
	php-opcache \
	php-ldap \
	php-posix \
	php-gd \
	php-gettext \
	php-json \
	php-xml \
	php \
	php-iconv \
	php-sysvshm \
	php-curl \
	php-shmop \
	php-odbc \
	php-phar \
	php-imap \
	php-pgsql \
	php-zip \
	php-ctype \
	php-mcrypt \
	php-wddx \
	php-bcmath \
	php-calendar \
	php-tidy \
	php-dom \
	php-sockets \
	php-soap \
	php-sysvmsg \
	php-ftp \
	php-sysvsem \
	php-pdo \
	php-bz2 \
	php-mysqli \
	php-imagick \
	php-memcached \
	php7.0-phalcon \
	nginx \
	runit

RUN mkdir /run/php
VOLUME /var/www/html

COPY default.conf /etc/nginx/sites-available/default
COPY fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY service /etc/service
COPY php.ini /etc/php/7.0/fpm/php.ini

RUN apt-get clean && apt-get -y autoremove
RUN rm -rf /var/lib/apt/*
RUN rm -rf /usr/share/doc/*
RUN rm -rf /usr/share/locale/*

ENTRYPOINT runsvdir /etc/service
