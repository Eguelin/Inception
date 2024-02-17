# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:26 by eguelin           #+#    #+#              #
#    Updated: 2024/02/17 16:14:46 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Import image of the penultimate stable version of Debian
FROM debian:buster-slim

#Import environment variables
ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD

#Install Wordpress


#expose Wordpress port
EXPOSE 9000

#Start Wordpress
CMD ["php-fpm7.3", "-g", "daemon off;"]
