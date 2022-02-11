NAME			=	libft.a
NAME_B			=	libft_bonus.a
NAME_D			=	libft_debug.a
CC				=	gcc
CC_FLAGS		=	-Wall -Werror -Wextra
CC_FLAGS_D		=	-g
LIB				=	ar
LIB_FLAGS		=	rcs
SRCS			=	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memccpy.c \
					ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c \
					ft_striteri.c ft_split.c ft_strchr.c ft_strdup.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c \
					ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c
SRCS_B			=	ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c
OBJS			=	${SRCS:%.c=%.o}
OBJS_B			=	${SRCS_B:%.c=%.o}
OBJS_D			=	${SRCS:%.c=%_debug.o}
OBJS_B_D		=	${SRCS_B:%.c=%_debug.o}
INCLUDES		=	-I.
RM				=	rm -rf

%.o			:	%.c
				${CC} ${CC_FLAGS} ${INCLUDES} -c $< -o $@

%_debug.o	:	%.c
				${CC} ${CC_FLAGS_D} ${CC_FLAGS} ${INCLUDES} -c $< -o $@

all			:	${NAME}

${NAME} 	:	${OBJS}
				${LIB} ${LIB_FLAGS} ${NAME} $?

bonus		:	${NAME_B}

${NAME_B}	:	${OBJS} ${OBJS_B}
				${LIB} ${LIB_FLAGS} ${NAME_B} $?

debug		:	${NAME_D}

${NAME_D}	:	${OBJS_D} ${OBJS_B_D}
				${LIB} ${LIB_FLAGS} ${NAME_D} $?

clean		:
				${RM} ${OBJS} ${OBJS_B} ${OBJS_D} ${OBJS_B_D}
	
fclean		:	clean
				${RM} ${NAME} ${NAME_B}

re			:	fclean ${NAME}

.PHONY		:	all bonus debug clean fclean re
