/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putendl_fd.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: illarion <glashli@student.21-school.ru>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/10/07 23:55:32 by glashli           #+#    #+#             */
/*   Updated: 2022/10/22 16:44:17 by illarion         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putendl_fd(const char	*str, int fd)
{
	if (str != NULL)
	{
		write(fd, str, ft_strlen(str));
		write(fd, "\n", 1);
	}
}
