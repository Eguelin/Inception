# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:35 by eguelin           #+#    #+#              #
#    Updated: 2024/03/03 14:10:52 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

# Import image of the penultimate stable version of Debian
FROM debian:11-slim

# Install Nginx and OpenSSL
RUN apt update -y && \
	apt upgrade -y && \
	apt install -y nginx openssl && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

# Create SSL certificate
RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/private/eguelin.key \
	-out /etc/ssl/certs/eguelin.crt \
	-subj "/C=FR/ST=Auvergne-Rhône-Alpes/L=Lyon/O=42/OU=eguelin/CN=eguelin.42.fr/emailAddress=eguelin@student.42lyon.fr"

# Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/conf.d/eguelin.conf

# Expose Nginx port
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
