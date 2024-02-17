# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:32 by eguelin           #+#    #+#              #
#    Updated: 2024/02/17 16:27:39 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Import image of the penultimate stable version of Debian
FROM debian:buster-slim

#Import environment variables
ARG DB_ROOT_PASSWORD
ARG DB_DATABASE
ARG DB_USER
ARG DB_PASSWORD

#Install MariaDB
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y mariadb-server && \
    apt clean && \
    rm -fr /var/lib/apt/lists/*

#Create a database
RUN service mysql start && \
	mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};" \
	-e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" \
	-e "GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USER}'@'localhost';" \
	-e "FLUSH PRIVILEGES;"

#expose MariaDB port
EXPOSE 3306

#Start MariaDB
CMD [ "mysqld", "--bind-address=0.0.0.0" ]
