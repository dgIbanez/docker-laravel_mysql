# pesa 467 MB

FROM php:8.0-apache

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN chown -R www-data:www-data /var/www/html

# Este es para instalar composer a mano(sin usar docker hub)
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
