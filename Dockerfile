FROM alpine:latest

RUN apk add --no-cache \
	php7-intl \
	php7-openssl \
	php7-dba \
	php7-sqlite3 \
	php7-litespeed \
	php7-gmp \
	php7-pdo_mysql \
	php7-pcntl \
	php7-common \
	php7-xsl \
	php7-fpm \
	php7-mysqlnd \
	php7-enchant \
	php7-pspell \
	php7-snmp \
	php7-mbstring \
	php7-xmlrpc \
	php7-embed \
	php7-xmlreader \
	php7-pdo_sqlite \
	php7-exif \
	php7-opcache \
	php7-ldap \
	php7-posix \
	php7-session \
	php7-gd \
	php7-gettext \
	php7-json \
	php7-xml \
	php7 \
	php7-iconv \
	php7-sysvshm \
	php7-curl \
	php7-shmop \
	php7-odbc \
	php7-phar \
	php7-pdo_pgsql \
	php7-imap \
	php7-pdo_dblib \
	php7-pgsql \
	php7-pdo_odbc \
	php7-zip \
	php7-ctype \
	php7-mcrypt \
	php7-wddx \
	php7-bcmath \
	php7-calendar \
	php7-tidy \
	php7-dom \
	php7-sockets \
	php7-soap \
	php7-sysvmsg \
	php7-zlib \
	php7-ftp \
	php7-sysvsem \
	php7-pdo \
	php7-bz2 \
	php7-mysqli \
	nginx \
	runit

VOLUME /var/www/html

COPY default.conf /etc/nginx/conf.d/default.conf
COPY fastcgi-php.conf /etc/nginx/fastcgi-php.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY service /etc/service
COPY php.ini /etc/php7/php.ini

ENTRYPOINT runsvdir /etc/service
