#!/bin/bash

if [ ! -d /var/www/html/wordpress ]; then

	# Create WordPress Directory
	mkdir -p /var/www/html/wordpress

	# Move to WordPress Directory
	cd /var/www/html/wordpress

	# Download WordPress
	wp-cli.phar core download --allow-root

	# Config Database
	wp-cli.phar config create --dbname=${DB_NAME} \
							  --dbuser=${DB_USER} \
							  --dbpass=${DB_PASSWORD} \
							  --dbhost=${DB_HOST} \
							  --allow-root

	# Install WordPress
	wp-cli.phar core install --url=${WP_URL} \
							 --title=${WP_TITLE} \
							 --admin_user=${WP_ADMIN} \
							 --admin_password=${WP_ADMIN_PASSWORD} \
							 --admin_email=${WP_ADMIN_EMAIL} \
							 --allow-root
	# Create User
	wp-cli.phar user create ${WP_USER}\
							${WP_USER_EMAIL} \
							--role=editor \
							--user_pass=${WP_USER_PASSWORD} \
							--allow-root
fi

# Start PHP
mkdir -p /run/php
php-fpm7.4 -F
