# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:32 by eguelin           #+#    #+#              #
#    Updated: 2024/02/16 17:28:02 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Import image of the penultimate stable version of Debian
FROM debian:buster-slim

#Import environment variables
ARG MARIADB_ROOT_PASSWORD
ARG MARIADB_DATABASE
ARG MARIADB_USER
ARG MARIADB_PASSWORD

#Install MariaDB
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y mariadb-server && \
    apt clean && \
    rm -fr /var/lib/apt/lists/*

#Create a database
RUN service mysql start && \
	mysql -u root -p${MARIADB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"\
	-e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"\
	-e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'localhost';"\
	-e "FLUSH PRIVILEGES;"

#expose MariaDB port
EXPOSE 3306

#Start MariaDB
CMD [ "mysqld", "--bind-address=0.0.0.0" ]
