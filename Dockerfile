FROM centos:7.9.2009

RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum update && \
    yum --enablerepo=remi-php82 install -y \
    php \
    openssl \
    php-bcmath \
    php-curl \
    php-json \
    php-mbstring \
    php-mysql \
    php-tokenizer \
    php-xml \
    php-zip \
    zip unzip httpd && \
    yum clean all && rm -rf /var/cache/yum/*
    
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

RUN a2enmod rewrite

EXPOSE 80

CMD ["apache2-foreground"]
