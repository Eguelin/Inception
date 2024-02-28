#!/bin/bash

# Install WordPress

if [ ! -d /var/www/html/wordpress ]; then
	# Install WordPress
	wp core download --path=/var/www/html/wordpress --allow-root

	# Config Database
	# wp config create --path=/var/www/html/wordpress \
	# 				 --dbname=${DB_NAME} \
	# 				 --dbuser=${DB_USER} \
	# 				 --dbpass=${DB_PASSWORD} \
	# 				 --dbhost=${DB_HOST} --allow-root

	cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
	sed -i "s/database_name_here/${DB_NAME}/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/username_here/${DB_USER}/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/password_here/${DB_PASSWORD}/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/localhost/${DB_HOST}/g" /var/www/html/wordpress/wp-config.php


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
				--role=editor \
				--user_pass=${WP_USER_PASSWORD} \
				--path=/var/www/html/wordpress
fi

# Start PHP
mkdir -p /run/php
php-fpm7.4 -F
