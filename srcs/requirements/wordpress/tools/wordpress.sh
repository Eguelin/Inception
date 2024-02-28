#!/bin/bash

# Install WordPress

# Config Database
wp core config --path=/var/www/html/wordpress \
			   --dbname=${DB_NAME} \
			   --dbuser=${DB_USER} \
			   --dbpass=${DB_PASSWORD} \
			   --dbhost=${DB_HOST} --allow-root

# Install WordPress
wp core install --path=/var/www/html/wordpress \
				--url=${WP_URL} \
				--title=${WP_TITLE} \
				--admin_user=${WP_ADMIN} \
				--admin_password=${WP_ADMIN_PASSWORD} \
				--admin_email=${WP_ADMIN_EMAIL} --allow-root

# Create User
wp user create ${WP_USER} \
			   ${WP_USER_EMAIL} \
			   --role=author \
			   --user_pass=${WP_USER_PASSWORD} \
			   --path=/var/www/html/wordpress --allow-root

# Start PHP
php-fpm7.4 -g "daemon off;"
