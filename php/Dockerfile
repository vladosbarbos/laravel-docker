FROM php:8.0-fpm

RUN apt-get update \
  && apt-get install -y \
             vim \
             libfreetype6-dev \
             libjpeg62-turbo-dev \
             libmcrypt-dev \
             libpng-dev \
             zlib1g-dev \
             libxml2-dev \
             libzip-dev \
             libonig-dev \
             graphviz \
             libcurl4-openssl-dev \
             pkg-config \
             libpq-dev

RUN docker-php-ext-install pgsql \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install pdo_pgsql \
  && docker-php-ext-install intl \
  && docker-php-ext-install zip \
  && docker-php-ext-install exif \
  && docker-php-ext-install opcache \
  && docker-php-source delete

#RUN apt-get install php-xdebug
#RUN echo "zend_extension=`php -i | grep ^extension_dir | cut -f 3 -d ' '`/xdebug.so" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-source delete
ENV COMPOSER_HOME=/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get install -y git vim rsync sshpass bzip2

ADD php.ini /usr/local/etc/php/php.ini

# Cron
#RUN apt-get install -y cron \
#    && mkfifo --mode 0666 /var/log/cron.log \
#    && sed --regexp-extended --in-place \
#    's/^session\s+required\s+pam_loginuid.so$/session optional pam_loginuid.so/' \
#    /etc/pam.d/cron
#
#COPY start-cron /usr/sbin
#RUN chmod +x /usr/sbin/start-cron
# Cron

# imagick
#RUN apt-get install -y libmagickwand-dev wget traceroute \
#    && pecl install imagick \
#    && docker-php-ext-enable imagick

RUN chown -R www-data:www-data /composer
