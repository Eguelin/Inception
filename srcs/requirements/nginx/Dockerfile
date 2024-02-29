# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:35 by eguelin           #+#    #+#              #
#    Updated: 2024/02/29 18:15:41 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#Import image of the penultimate stable version of Debian
FROM debian:oldstable-slim

#Install Nginx and OpenSSL
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y nginx openssl curl && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

#Create SSL certificate
RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/private/eguelin.42.fr.key \
	-out /etc/ssl/certs/eguelin.42.fr.crt \
	-subj "/C=FR/ST=Auvergne-Rhône-Alpes/L=Lyon/O=42/OU=eguelin/CN=eguelin.42.fr/emailAddress=eguelin@student.42lyon.fr"

#Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/conf.d/eguelin.42.fr.conf

#Expose Nginx port
EXPOSE 443

#Start Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
