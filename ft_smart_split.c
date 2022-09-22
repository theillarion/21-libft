/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_smart_split.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: illarion <glashli@student.21-school.ru>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/09/22 12:16:05 by glashli           #+#    #+#             */
/*   Updated: 2022/09/22 21:21:43 by illarion         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static size_t	ft_skip_symbol(const char	*str, char symbol, size_t i,
	bool is_empty_line)
{
	while (!is_empty_line && str[i] && str[i] == symbol)
		i++;
	return (i);
}

static size_t	ft_get_count_lines(const char	*str, char symbol,
	bool is_empty_line)
{
	size_t	i;
	size_t	count;

	count = 0;
	if (str == NULL || str[0] == '\0')
		return (0);
	i = ft_skip_symbol(str, symbol, 0, is_empty_line);
	while (str[i])
	{
		if (str[i] == symbol
			&& (is_empty_line || (i != 0 && str[i - 1] != symbol)))
			++count;
		++i;
	}
	if (i != 0 && ((is_empty_line && str[i - 1] == symbol)
			|| str[i - 1] != symbol))
		++count;
	return (count);
}

static char	**ft_get_strs(const char	*str, size_t count, char symbol,
	bool is_empty_line)
{
	char	**strs;
	ssize_t	i;
	size_t	j;
	size_t	k;

	strs = (char **)malloc((count + 1) * sizeof(char *));
	i = ft_skip_symbol(str, symbol, 0, is_empty_line);
	k = -1;
	while (++k < count && strs)
	{
		j = i;
		while (str[j] && str[j] != symbol)
			j++;
		strs[k] = (char *)malloc((j - i + 1) * sizeof(char));
		if (strs[k] == NULL)
			return (strs);
		strs[k] = ft_substr(str + i, 0, j - i);
		i = ft_skip_symbol(str, symbol, j + 1, is_empty_line);
	}
	if (strs)
		strs[k] = NULL;
	return (strs);
}

char	**ft_smart_split(const char *str, char symbol, bool is_empty_line)
{
	size_t	count;
	size_t	i;
	char	**strs;

	count = ft_get_count_lines(str, symbol, is_empty_line);
	strs = ft_get_strs(str, count, symbol, is_empty_line);
	if (strs)
	{
		i = 0;
		while (strs[i])
			++i;
		if (i != count)
		{
			i = 0;
			while (strs[i])
				free(strs[i++]);
			free(strs);
			return (NULL);
		}
	}
	return (strs);
}
