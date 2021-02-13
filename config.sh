# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jo@cluzet.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 01:42:24 by jcluzet           #+#    #+#              #
#    Updated: 2021/02/13 18:42:22 by jocluzet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rougefonce='\x1B[0;31m'
vertfonce='\x1B[0;32m'
vertclair='\x1B[1;32m'
orange='\x1B[0;33m'
blanc='\x1B[1;37m'
neutre='\x1B[0;m'

echo "${blanc}\n    Norminette Check..."

	if [[ `~/.norminette/norminette.rb config.sh | grep -o "Warning:"` = "Warning:" ]]; then
		echo "${vertclair}    Norminette correclty installed ✔️"
	else
		echo "${rougefonce}\n  ⚠️  Norminette 42 Missing\n${vertclair}    Installation of 42Norminette..."
		git clone https://github.com/42Paris/norminette.git ~/.norminette/
	fi

echo "${blanc}\n    42Checker_2021..."

	if [[ `sh ~/.42Checker_2021/CheckHeader.sh . | grep -o "NormeCheck"` = "NormeCheck" ]]; then
		echo "${vertclair}    42Checker_2021 already installed ✔️\n"
	else
		echo "${rougefonce}\n  ⚠️  42Checker_2021 Missing\n${vertclair}    Installation of 42Checker_2021..."
		git clone https://github.com/JCluzet/42Checker_2021.git ~/.42Checker_2021
		echo 'alias 42checker="sh ~/.42Checker_2021/CheckHeader.sh ."' >> ~/.zshrc
		# source ~/.zshrc
	fi
rm -r 42Checker
echo "${vertclair}\n    42Checker_2021 by jcluzet Ready to run ✔️ \n${vertfonce}              Simply run /42check\n"

