FROM centos:7.9.2009

RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum --enablerepo=remi-php82 install -y \
    php \
    openssl \
    php-bcmath \
    php-curl \
    php-json \
    php-mbstring \
    php-tokenizer \
    php-xml \
    php-zip \
    php-mysql \
    zip unzip httpd && \
    yum clean all && rm -rf /var/cache/yum/*
    
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./apache_conf/laravel-site.conf /etc/httpd/conf.d/

COPY --chmod=755 ./composer_conf/start  /usr/local/bin/start
COPY --chmod=755 ./composer_conf/createProject  /bin/createProject



WORKDIR /app

EXPOSE 80

CMD \
/usr/local/bin/start; \
httpd -D FOREGROUND;\