# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:26 by eguelin           #+#    #+#              #
#    Updated: 2024/03/01 17:13:56 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Import image of the penultimate stable version of Debian
FROM debian:11-slim

# Install PHP
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y php-fpm php-mysql curl sendmail && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

# Install WP-CLI and WordPress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp-cli.phar

# Copy www.conf
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Copy WordPress script
COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

# Set permissions
RUN chmod +x /usr/local/bin/wordpress.sh

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
ENTRYPOINT ["wordpress.sh"]
