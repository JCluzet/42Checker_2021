# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jo@cluzet.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 01:42:24 by jcluzet           #+#    #+#              #
#    Updated: 2021/02/13 21:31:19 by jocluzet         ###   ########.fr        #
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
		echo 'alias 42check="sh ~/.42Checker_2021/CheckHeader.sh ."' >> ~/.zshrc
	fi

echo "${vertclair}\n    42Checker_2021 by jcluzet Ready to run ✔️ \n${vertfonce}              Simply reload your terminal and\n                         __        ___  _  ____      _               _
       _ __ _   _ _ __   \ \      / / || ||___ \ ___| |__   ___  ___| | __
      | '__| | | | '_ \   \ \    / /| || |_ __) / __| '_ \ / _ \/ __| |/ /
      | |  | |_| | | | |  / /   / / |__   _/ __/ (__| | | |  __/ (__|   <
      |_|   \__,_|_| |_| /_/   /_/     |_||_____\___|_| |_|\___|\___|_|\_\"


