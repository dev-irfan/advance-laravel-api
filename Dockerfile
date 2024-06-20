FROM php:8.2-fpm as php

RUN apt-get update -y
RUN apt-get install -y unzip libpq-dev libcurl4-gnutls-dev
RUN docker-php-ext-install pdo pdo_mysql bcmath

WORKDIR /var/www
COPY . .

RUN chown -R www-data:www-data /var/www

EXPOSE 9000

CMD ["php-fpm"]

