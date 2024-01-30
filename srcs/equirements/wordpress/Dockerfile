# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:26 by eguelin           #+#    #+#              #
#    Updated: 2024/01/30 16:37:09 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y php-fpm \
	php-mysql \
	php-mbstring \
	php-xml \
	wget && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN wget https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz && \
	rm -fr latest.tar.gz

RUN	chown -R www-data:www-data /var/www/html && \
	chmod 755 /var/www/html

EXPOSE 9000	3306

CMD [ "php-fpm7.4", "-F" ]
