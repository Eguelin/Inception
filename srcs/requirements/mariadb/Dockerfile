# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:32 by eguelin           #+#    #+#              #
#    Updated: 2024/01/30 20:15:43 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y mariadb-server && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

#to complete
