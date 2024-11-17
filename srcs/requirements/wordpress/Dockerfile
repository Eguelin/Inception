# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:26 by eguelin           #+#    #+#              #
#    Updated: 2024/11/17 01:46:49 by eguelin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import image of the penultimate stable version of Alpine
FROM alpine:3.19.3

# Install PHP
RUN apk update && \
	apk upgrade && \
	apk add --no-cache \
	php82 \
	php82-fpm \
	php82-mysqli \
	php82-phar \
	php82-mbstring \
	curl \
	mariadb-client && \
	rm -fr /var/cache/apk/*

# Install WP-CLI and WordPress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /bin/wp

# Set listen www.conf
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/g' /etc/php82/php-fpm.d/www.conf

# Copy WordPress script
COPY tools/wordpress.sh /bin/wordpress.sh

# Set permissions
RUN chmod +x /bin/wordpress.sh

# Create WordPress directory
RUN mkdir -p /var/www/html/wordpress

# Workdir
WORKDIR /var/www/html/wordpress

# Expose PHP-FPM port
EXPOSE 9000

# Start WordPress
ENTRYPOINT [ "wordpress.sh" ]
