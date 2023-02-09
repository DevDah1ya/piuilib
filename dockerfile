# Use an official PHP image as a base image
FROM php:7.4-apache

# Install phpMyAdmin and required extensions
RUN apt-get update && apt-get install -y \
    libmariadb-dev \
    libpng-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libzip-dev \
&& docker-php-ext-install -j$(nproc) mysqli pdo_mysql gd

# Enable phpMyAdmin in Apache
RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Copy the custom SQL file to the image
COPY SQL_File/loginsystem.sql /tmp/loginsystem.sql