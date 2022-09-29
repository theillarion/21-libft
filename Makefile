NAME_S			=	libft
NAME			=	$(NAME_S).a
NAME_B			=	$(NAME_S)_bonus.a
NAME_D			=	$(NAME_S)_debug.a
CC				=	cc
CC_FLAGS		=	-Wall -Werror -Wextra
CC_FLAGS_D		=	-g
AR				=	ar
LIB_FLAGS		=	rcs

HEADER			=	libft.h
SRCS			=	ft_atoi.c ft_bzero.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_itoa.c ft_memccpy.c \
					ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c \
					ft_striteri.c ft_split.c ft_smart_split.c ft_strchr.c ft_strdup.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c \
					ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c
SRCS_B			=	ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c
OBJS			=	${SRCS:%.c=%.o}
OBJS_B			=	${SRCS_B:%.c=%.o}
OBJS_D			=	${SRCS:%.c=%_debug.o}
OBJS_B_D		=	${SRCS_B:%.c=%_debug.o}
INCLUDES		=	-I.
RM				=	rm -rf

OS				=	${shell uname -s}

NOCOLOR			=	\033[0m
COLOR_LGREEN	=	\033[92m
COLOR_LYELLOW	=	\033[93m
COLOR_LCYAN		=	\033[96m
NEWLINE			=	\n

%.o			:	%.c $(HEADER)
				@$(CC) $(CC_FLAGS) $(INCLUDES) -c $< -o $@
				@printf "$(COLOR_LCYAN)build object$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$@$(NOCOLOR)$(NEWLINE)"

%_debug.o	:	%.c $(HEADER)
				@$(CC) $(CC_FLAGS_D) $(CC_FLAGS) $(INCLUDES) -c $< -o $@
				@printf "$(COLOR_LCYAN)build object$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$@$(NOCOLOR)$(NEWLINE)"

.PHONY		:	all bonus debug clean fclean re norm

all			:	$(NAME)
bonus		:	$(NAME_B)
debug		:	$(NAME_D)

$(NAME) 	:	$(OBJS)
				@$(AR) $(LIB_FLAGS) $@ $?
				@printf "$(COLOR_LCYAN)linking$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$@$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"


$(NAME_B)	:	$(OBJS) $(OBJS_B)
				@$(AR) $(LIB_FLAGS) $(NAME_B) $?
				@printf "$(COLOR_LCYAN)linking bonus$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$@$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"


$(NAME_D)	:	$(OBJS_D) $(OBJS_B_D)
				@$(AR) $(LIB_FLAGS) $(NAME_D) $?
				@printf "$(COLOR_LCYAN)linking debug$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$@$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"

clean		:
				@${RM} $(OBJS) $(OBJS_B) $(OBJS_D) $(OBJS_B_D)
				@printf "$(COLOR_LCYAN)$@$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$(NAME_S)$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"


fclean		:	clean
				@${RM} $(NAME) $(NAME_D) $(NAME_B)
				@printf "$(COLOR_LCYAN)full clean$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$(NAME_S)$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"


re			:	fclean $(NAME)
				@printf "$(COLOR_LCYAN)rebuild$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$(NAME_S)$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"

norm		:
				@norminette $(SRCS) $(HEADERS)
				@printf "$(COLOR_LCYAN)norminette$(NOCOLOR) [$(COLOR_LGREEN)info$(NOCOLOR)]: "
				@printf "ready $(COLOR_LYELLOW)$(NAME_S)$(NOCOLOR) for $(COLOR_LYELLOW)$(OS)$(NOCOLOR)$(NEWLINE)"