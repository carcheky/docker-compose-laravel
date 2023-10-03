FROM php:8.2-fpm

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# MacOS staff group's gid is 20, so is the dialout group in alpine linux. We're not using it, let's just remove it.
# RUN delgroup dialout

# RUN addgroup -g ${GID} --system laravel
# RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

RUN sed -i "s/user = www-data/user = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

RUN docker-php-ext-install pdo pdo_mysql

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

#install some base extensions
RUN apt update
RUN apt install -y zip 
RUN apt install -y libzip
RUN apt install -y libzip-dev
RUN docker-php-ext-install zip

# RUN DEBIAN_FRONTEND=noninteractive TZ="Europe/Madrid" apt install -y tzdata
# RUN apt install -y curl
# RUN apt install -y php-pear
# RUN apt install -y php82-curl
# RUN apt install -y php82-dev
# RUN apt install -y php82-gd
# RUN apt install -y php82-mbstring
# RUN apt install -y php82-zip
# RUN apt install -y php82-xml
# RUN apt install -y php82-fpm
# RUN apt install -y php82-intl
# RUN apt install -y php82-bcmath
# RUN apt install -y debconf-utils
# RUN apt install -y php82-mysql
# RUN apt install -y php-redis
RUN docker-php-ext-install opcache
RUN docker-php-ext-install bcmath
RUN apt install -y icu-dev
RUN docker-php-ext-install intl


RUN addgroup --gid 1000 laravel
RUN adduser --ingroup laravel --shell /bin/sh laravel
USER laravel

USER laravel

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]
