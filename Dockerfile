# Використовуємо офіційний образ PHP з Apache
FROM php:8.1-apache

# Встановлюємо робочу директорію
WORKDIR /var/www/html

# Копіюємо файли проєкту в контейнер
COPY . /var/www/html

# Встановлюємо необхідні розширення PHP
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Активуємо модуль Apache mod_rewrite, якщо потрібно
RUN a2enmod rewrite

# Відкриваємо порт 80
EXPOSE 80

# Запускаємо Apache в передньому плані
CMD ["apache2-foreground"]