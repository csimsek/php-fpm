FROM ubuntu:latest

RUN apt-get update && apt-get -y dist-upgrade

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
	nginx \
	runit

RUN mkdir /run/php
VOLUME /var/www/html

RUN rm -rf /var/lib/apt/*
RUN rm -rf /usr/share/doc/*
RUN rm -rf /usr/share/locale/*

COPY default.conf /etc/nginx/sites-available/default.conf
COPY fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY service /etc/service
COPY php.ini /etc/php/7.0/fpm/php.ini

ENTRYPOINT runsvdir /etc/service
