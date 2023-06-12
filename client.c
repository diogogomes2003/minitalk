/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dduarte- <dduarte-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/07 13:11:18 by dduarte-          #+#    #+#             */
/*   Updated: 2023/06/07 13:22:33 by dduarte-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	ft_send_bits(int pid, char c)
{
	int	bit_client;

	bit_client = 0;
	while (bit_client < 8)
	{
		if ((c & (0x01 << bit_client)) != 0)
			kill(pid, SIGUSR1);
		else
			kill(pid, SIGUSR2);
		usleep(100);
		bit_client++;
	}
}

int	main(int ac, char **av)
{
	int	pid;
	int	i;

	i = 0;
	if (ac != 3)
	{
		ft_printf("Try <./client> <server id> and <string>\n");
		return (1);
	}
	else
	{
		pid = ft_atoi(av[1]);
		while (av[2][i] != '\0')
		{
			ft_send_bits(pid, av[2][i]);
			i++;
		}
		ft_send_bits(pid, '\n');
	}
	return (0);
}