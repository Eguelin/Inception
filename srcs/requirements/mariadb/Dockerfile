# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:32 by eguelin           #+#    #+#              #
#    Updated: 2024/11/16 04:11:02 by eguelin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import image of the penultimate stable version of Alpine
FROM alpine:3.19.3

# Import environment variables
ARG DB_ROOT_PASSWORD
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD

# Install MariaDB
RUN apk update && \
	apk upgrade && \
	apk add --no-cache mariadb mariadb-client openrc && \
	rm -fr /var/cache/apk/*

# Create Database and User
RUN openrc && \
	touch /run/openrc/softlevel && \
	/etc/init.d/mariadb setup && \
	rc-service mariadb start && \
	mariadb -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" \
					-e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};" \
					-e "CREATE USER IF NOT EXISTS '${DB_USER}' IDENTIFIED BY '${DB_PASSWORD}';" \
					-e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}';" \
					-e "FLUSH PRIVILEGES;"

# Expose MariaDB port
EXPOSE 3306

# Start MariaDB
CMD ["mariadbd", "--user=mysql", "--skip-networking=0"]

