# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:32 by eguelin           #+#    #+#              #
#    Updated: 2024/01/30 16:38:22 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y mariadb-server && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && \
	chown -R mysql:mysql /run/mysqld && \
	chmod 755 /run/mysqld

EXPOSE 3306

CMD [ "mysqld" ]
