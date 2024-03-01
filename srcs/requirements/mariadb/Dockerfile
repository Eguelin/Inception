# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:32 by eguelin           #+#    #+#              #
#    Updated: 2024/03/01 17:32:06 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Import image of the penultimate stable version of Debian
FROM debian:11-slim

# Import environment variables
ARG DB_ROOT_PASSWORD
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Install MariaDB
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y mariadb-server && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

# Create a database
RUN service mariadb start && \
	mariadb -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" \
					-e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" \
					-e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" \
					-e "FLUSH PRIVILEGES;"

# expose MariaDB port
EXPOSE 3306

# Start MariaDB
CMD [ "mariadbd", "--bind-address=0.0.0.0" ]
