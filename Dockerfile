# Використання базового образу PHP з FPM
FROM php:8.2-fpm

# Оновлення пакетів та встановлення розширень PHP
RUN apt-get update && apt-get install -y unzip && \
    docker-php-ext-install pdo pdo_mysql mysqli

# Встановлення Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

# Налаштування робочої директорії та копіювання файлів
WORKDIR /app
COPY . /app
