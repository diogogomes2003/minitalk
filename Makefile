# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dduarte- <dduarte-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/06/07 13:11:11 by dduarte-          #+#    #+#              #
#    Updated: 2023/09/20 12:57:56 by dduarte-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk.a

SRC_SERVER = server.c
SRC_CLIENT = client.c

OBJ_SERVER = ${SRC_SERVER:.c=.o}
OBJ_CLIENT = ${SRC_CLIENT:.c=.o}

RM = rm -f
CFLAGS = -Wall -Wextra -Werror
MAKE = make -C
PRINTF_PATH = printf/libftprintf.a

C_DEF   = \033[0;39m
C_GREEN = \033[0;92m

all:    ${NAME}

$(NAME):    ${OBJ_SERVER} ${OBJ_CLIENT}
			${MAKE} printf
			cp ${PRINTF_PATH} ${NAME}
			ar rcs ${NAME} ${OBJ_SERVER} ${OBJ_CLIENT}
			cc ${CFLAGS} ${OBJ_SERVER} ${NAME} -o server
			cc ${CFLAGS} ${OBJ_CLIENT} ${NAME} -o client
			@echo "${C_GREEN}[COMPILED]${C_DEF}"

server:	${OBJ_SERVER}
		${MAKE} printf
		cp ${PRINTF_PATH} ${NAME}
		ar rcs ${NAME} ${OBJ_SERVER}
		cc ${CFLAGS} ${OBJ_SERVER} ${NAME} -o server
		@echo "${C_GREEN}[SERVER CREATED]${C_DEF}"

client:	${OBJ_CLIENT}
		${MAKE} printf
		cp ${PRINTF_PATH} ${NAME}
		ar rcs ${NAME} ${OBJ_CLIENT}
		cc ${CFLAGS} ${OBJ_CLIENT} ${NAME} -o client
		@echo "${C_GREEN}[CLIENT CREATED]${C_DEF}"

clean:	
		${MAKE} printf clean
		${RM} ${OBJ_SERVER} ${OBJ_CLIENT}
		@echo "${C_GREEN}[CLEANED]${C_DEF}"

fclean: clean
		${MAKE} printf fclean
		${RM} ${NAME} server client
		@echo "${C_GREEN}[FULL CLEANED]${C_DEF}"

re:     fclean all
		@echo "${C_GREEN}[REBUILD]${C_DEF}"

.PHONY: all clean fclean re

.SILENT: