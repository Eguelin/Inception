# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/27 15:03:35 by eguelin           #+#    #+#              #
#    Updated: 2024/01/30 16:37:44 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

FROM debian:11

RUN apt update -y && \
	apt upgrade -y && \
	apt install -y nginx && \
	apt clean && \
	rm -fr /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/certs/ /etc/nginx/certs/
COPY ./conf/index.html /usr/share/nginx/html/index.html

EXPOSE 443 9000

CMD ["nginx", "-g", "daemon off;"]
