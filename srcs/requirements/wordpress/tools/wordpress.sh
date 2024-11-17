#!/bin/sh

# Wait for mariadb to be ready
while ! mariadb -h ${DB_HOST} -u ${DB_USER} -p${DB_PASSWORD} -e "SELECT 1" &> /dev/null; do
	echo "Waiting for MariaDB to be ready..."
	sleep 1
done

# Check if WordPress is already installed
if [ ! -d /var/www/html/wordpress/wp-content ]; then
	# Download WordPress
	wp core download --allow-root

	# Config Database
	wp config create --dbname=${DB_NAME} \
					 --dbuser=${DB_USER} \
					 --dbpass=${DB_PASSWORD} \
					 --dbhost=${DB_HOST} \
					 --allow-root

	# Install WordPress
	wp core install --url=${WP_URL} \
					--title=${WP_TITLE} \
					--admin_user=${WP_ADMIN} \
					--admin_password=${WP_ADMIN_PASSWORD} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--skip-email \
					--allow-root

	# Create User
	wp user create ${WP_USER}\
				   ${WP_USER_EMAIL} \
				   --role=editor \
				   --user_pass=${WP_USER_PASSWORD} \
				   --allow-root

	echo "WordPress has been installed."
fi

# Give permissions to the WordPress directory
chown -R nobody:nobody /var/www/html/wordpress
chmod -R 755 /var/www/html/wordpress

# Start PHP
echo "Starting PHP."
php-fpm82 -F
