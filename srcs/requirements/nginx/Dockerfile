# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:35 by eguelin           #+#    #+#              #
#    Updated: 2024/11/16 04:05:41 by eguelin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Import image of the penultimate stable version of Alpine
FROM alpine:3.19.3

# Install Nginx and OpenSSL
RUN apk update && \
	apk upgrade && \
	apk add --no-cache nginx openssl && \
	rm -rf /var/cache/apk/*

# Create SSL certificate
RUN openssl req -x509 -nodes -newkey rsa:2048 \
	-keyout /etc/ssl/private/eguelin.key \
	-out /etc/ssl/certs/eguelin.crt \
	-subj "/C=FR/ST=Auvergne-Rhône-Alpes/L=Lyon/O=42/OU=eguelin/CN=eguelin.42.fr/emailAddress=eguelin@student.42lyon.fr"

# Copy Nginx configuration file
COPY conf/nginx.conf /etc/nginx/http.d/eguelin.conf

# Expose Nginx port
EXPOSE 443

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
