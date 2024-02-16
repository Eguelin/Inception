# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:35 by eguelin           #+#    #+#              #
#    Updated: 2024/02/16 17:27:36 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Import image of the penultimate stable version of Debian
FROM debian:buster-slim

#Install Nginx
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y nginx && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

#to complete

#expose Nginx port
EXPOSE 443

#Start Nginx
CMD ["nginx", "-g", "daemon off;"]
