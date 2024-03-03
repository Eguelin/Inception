# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eguelin <eguelin@student.42lyon.fr>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/28 17:47:48 by eguelin           #+#    #+#              #
#    Updated: 2024/03/03 14:46:51 by eguelin          ###   ########lyon.fr    #
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

SRCS_DIR		= srcs/
COMPOSE_FILE	= $(SRCS_DIR)docker-compose.yml

VOLUMES_DIR		= $(SRCS_DIR)volumes/
MARIADB_DIR		= $(VOLUMES_DIR)mariadb/
WORDPRESS_DIR	= $(VOLUMES_DIR)wordpress/

# **************************************************************************** #
#                                     Rules                                    #
# **************************************************************************** #

all: $(NAME)

$(NAME): $(VOLUMES_DIR)
	$(DC) -f $(COMPOSE_FILE) up --build -d

down:
	$(DC) -f $(COMPOSE_FILE) down

restart: down all

clean:
	$(DC) -f $(COMPOSE_FILE) down --volumes --rmi all

fclean: clean
	docker system prune --force --all
	sudo rm -rf $(VOLUMES_DIR)

re: fclean all

$(VOLUMES_DIR):
	mkdir -p $(MARIADB_DIR) $(WORDPRESS_DIR)
