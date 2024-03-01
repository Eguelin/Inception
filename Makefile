# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/28 17:47:48 by eguelin           #+#    #+#              #
#    Updated: 2024/03/01 17:35:08 by eguelin          ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

.PHONY: all clean fclean re down restart
.SILENT:

# **************************************************************************** #
#                                   Variable                                   #
# **************************************************************************** #

NAME	= Inception
DC		= docker compose

# **************************************************************************** #
#                                    Sources                                   #
# **************************************************************************** #

SRC_DIR			= srcs/
COMPOSE_FILE	= $(SRC_DIR)docker-compose.yml

# **************************************************************************** #
#                                     Rules                                    #
# **************************************************************************** #

all: $(NAME)

$(NAME):
	$(DC) -f $(COMPOSE_FILE) up --build -d

down:
	$(DC) -f $(COMPOSE_FILE) down

restart: down all

clean:
	$(DC) -f $(COMPOSE_FILE) down --volumes --rmi all

fclean: clean
	$(DC) -f $(COMPOSE_FILE) down --volumes --rmi all
	docker system prune --force --all
	sudo rm -rf /home/eguelin/volumes/*

re: fclean all
