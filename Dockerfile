FROM php:7.1.0RC3-fpm

RUN apt-get update
RUN apt-get install -y git cron  libmcrypt-dev nodejs nano npm
RUN docker-php-ext-install mcrypt mbstring tokenizer mysqli pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN npm install --global gulp-cli

RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/fpm/php.ini
RUN sed -i "s/;date.timezone =.*/date.timezone = UTC/" /etc/php5/cli/php.ini

CMD ["php-fpm"]
