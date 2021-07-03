# **************************************************************************** #i
#                                                                              #
#                                                         :::      ::::::::    #
#    CheckHeader.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jo@cluzet.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 00:44:50 by jcluzet           #+#    #+#              #
#    Updated: 2021/07/03 20:12:03 by jocluzet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rougefonce='\x1B[0;31m'
vertfonce='\x1B[0;32m'
vertclair='\x1B[1;32m'
orange='\x1B[0;33m'
blanc='\x1B[1;37m'
neutre='\x1B[0;m'

i=6
u=0
gooddock=0
errorinfile=-1
error=0
inallancien=0
inall=0
ok=0
ignorefiles="vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32"
ignorefilesdeux="vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32"
ko=0
sp="/-\|"

# VERIFIER SI LA NORMINETTE EST COMPATIBLE/INSTALLE

echo "\n${vertclair} Check for update... ${neutre}\n"
	version=$(git -C ~/.42Checker_2021 reset --hard | cut -c30-)
	{
	git -C ~/.42Checker_2021 fetch &> /dev/null
	diffs=$(git ~/.42Checker _2021 diff master origin/master)
	} &> /dev/null
	if [ -z "$diffs" ]
	then
		echo "42Check is up to date :)"
	else
	{
		git -C ~/.42Checker_2021 pull
	}
		printf "   ${blanc}Installation of ${version} completed 🎉\n\nPlease relaunch /42check :)"
		exit
	fi
	printf "   ${blanc}42Checker_2021 by jcluzet \n${vertclair}         Version : ${vertfonce}${version}${vertclair}"


header()
{
	clear

echo "\n${vertclair}       _  _  ____   ____ _               _               ____   ___ ____  _
     | || ||___ \ / ___| |__   ___  ___| | _____ _ __  |___ \ / _ \___ \/ |
     | || |_ __) | |   | '_ \ / _ \/ __| |/ / _ \ '__|   __) | | | |__) | |
     |__   _/ __/| |___| | | |  __/ (__|   <  __/ |     / __/| |_| / __/| |
        |_||_____|\____|_| |_|\___|\___|_|\_\___|_|    |_____|\___/_____|_| \n"

if [[ $ignorefiles = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]] && [[ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]]
	then
	printf "     Version : ${vertfonce}${version}                 ${vertclair}${PWD##*/} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi

if [[ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]] && [[ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]]
	then
	printf "     Version : ${vertfonce}${version}       ${vertclair}${PWD##*/}${blanc} without ${rougefonce}${ignorefiles} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi

if [[ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]] && [[ $ignorefilesdeux != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]]
	then
	printf "     Version : ${vertfonce}${version} ${vertclair}${PWD##*/}${blanc} without ${rougefonce}${ignorefiles}${blanc}, ${rougefonce}${ignorefilesdeux} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi
printf "\n"


}

for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}")
 do
	((inall++))
done

for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}")
 do
	((gooddock++))
done

header

if [ $gooddock = 0 ]; then
	printf "\n${rougefonce}          Error ${vertclair}${PWD##*/} ${blanc}does not contain any .c or .h files.\n               ${neutre}           >  Check your repertory\n\n\n\n"
else

if [ -e savenorme ]
then
	rm savenorme
fi

if [ -e .42Checker_2021_Header_Sort ]
then
	rm .42Checker_2021_Header_Sort
fi

if [ -e .42Checker_2021_Header ]
then
	rm .42Checker_2021_Header
fi

while true; do                                                                                    ## DEMANDE DE CHECKALL ?
	printf "\n${blanc} 📚 Do you want to check ${rougefonce}ALL ${blanc}files ${neutre}(*.c & *.h)${blanc} in ${vertclair}${PWD##*/}${blanc}? (y/n)\n\n    "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			printf "\n${blanc} 📚 Do you want to check ${rougefonce}ALL ${blanc}files in ${vertclair}${PWD##*/}${blanc} ? (y/n)\n"
			echo "\n   ${vertclair} 📦 ${inall} files in ${PWD##*/} are well imported"
			break;;
        [Nn]* )
			header
			printf "\n${blanc} 📚 What repertory do you want to ignore in ${vertclair}${PWD##*/}${blanc} ? \n \n"
			printf "$(ls -d */ | tr / " ")\n\n"
			read ignorefiles
			inallancien=$inall
			inall=0
			for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/")
 			do
				((inall++))
			done
			ignorefiles2=$(($inallancien-$inall))
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} with ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n"


while true; do                                                 ## ignore plus ??
	printf "${blanc} 📚 Do you want to ignore more repertory ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} with ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n      "
			printf "\n${blanc} 📚 What repertory do you want to ignore in ${vertclair}${PWD##*/}${blanc} ? \n\n"
			printf "$(ls -d */ | tr / " ")\n\n"
			printf "         "
			read ignorefilesdeux
			inall=0
			for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
				((inall++))
			done
			ignorefiles3=$(($inallancien-$inall))
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc}, ${vertclair}${ignorefilesdeux} ${blanc}with ${ignorefiles3} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n      "
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n";;
    esac
done
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)";;
    esac
done

# grep -H -r  "Created:" *.c | awk '{print $6}'

while true; do                                                 ## DEMANDE DE CHECKHEADER
	printf "\n${blanc} 📝 Do you want to check header? (y/n)\n\n"
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			echo "\n ${blanc}   📝 Header Created by :${vertclair}"
			for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
			 grep -H -r  "Created:" $fichier | awk '{print $6}' >> .42Checker_2021_Header
			 grep -H -r  "Updated:" $fichier | awk '{print $6}' >> .42Checker_2021_Header
			 grep -H -r  "By:" $fichier | awk '{print $3}' >> .42Checker_2021_Header
			done
			sort .42Checker_2021_Header | uniq >> .42Checker_2021_Header_Sort
			while read line
				do
				printf "\n     $line"
				((auteur++))
			done < .42Checker_2021_Header_Sort
			if ((auteur > 1))
			then
			while true; do                                                                   ## DEMANDE DE DETAILS HEADER ?
				printf "\n\n   📭 ${rougefonce}More then 1 name finded. ${blanc}Want to check details for a name ? ${neutre}(y/n)\n\n     "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					header
					echo "\n ${blanc}   📝 Header Created by :${vertclair}"
					while read line
					do
						printf "\n     $line"
						((auteur++))
					done < .42Checker_2021_Header_Sort
					echo "\n\n ${blanc}   📝 Enter the name you want to search for :${vertclair}\n"
					read -p "       " nom
					present=0
					for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}" | grep -v "^./${ignorefilesdeux}")
					do
						if [[ `grep -H -r  "Created:" $fichier | awk '{print $6}'` = $nom ]] ||
						[[ `grep -H -r  "Updated:" $fichier | awk '{print $6}'` = $nom ]] ||
						 [[ `grep -H -r  "By:" $fichier | awk '{print $3}'` = $nom ]]; then
						((present++))
						printf "\n      $fichier"
						fi
					done
					if [ $present = 0 ]; then
						header
						echo "\n ${blanc}   📝 Header Created by :${vertclair}"
						while read line
						do
							printf "\n     $line"
							((auteur++))
						done < .42Checker_2021_Header_Sort
						echo "\n\n ${blanc}   📝 Enter the name you want to search for :${vertclair}\n"
						printf "         ${rougefonce}⁉️  ${vertclair}$nom ${rougefonce}does not appear in any Header"
					fi
					printf "\n"
					break;;
        		[Nn]* ) echo "\n${rougefonce} 😕 Header details ignored"
					sleep 1;
					header
					break;;
        		* ) header
					echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
					echo "\n ${blanc}   📝 Header Created by :${vertclair}"
					while read line
					do
						printf "\n     $line"
						((auteur++))
					done < .42Checker_2021_Header_Sort;;
    			esac
			done
			fi
			rm .42Checker_2021_Header
			rm .42Checker_2021_Header_Sort
			break;;
        [Nn]* ) echo "\n${rougefonce} 😕 Header not checked"
			sleep 1;
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)";;
    esac
done


# if [[ `grep -H -r  "Created:" $fichier | awk '{print $6}'` = $nom ]] ||
while true; do                                                 ## DEMANDE DE CHECKNORME
	printf "\n${blanc}    🐈‍ Do you want to check norminette? (y/n)\n\n"
    read -p "     " yn
    case $yn in
        [Yy]* )
header
printf "\n"
if (( $u < 10 ))
   then
	nombreb4='\b'
fi
if (( $u < 100 ))
   then
	nombreb4='\b\b'
fi
if (( $u < 1000 ))
   then
	nombreb4='\b\b\b'
fi
for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}" | grep -v "^./${ignorefilesdeux}")
 do
   norminette $fichier >> savenorme
 if (( $u < 10 ))
   then
   	printf "${nombreb4}${blanc}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Norme Checked"
   elif (( $u < 100))
   then
   	printf "${nombreb4}${blanc}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Norme Checked"
   else
	printf "${nombreb4}${blanc}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Norme Checked"
   fi
   ((u++))
done
header
printf "\n"
   if (( $u < 10 ))
   then
   	echo "  🎉 ${blanc} ${u} Files Checked"
   elif (( $u < 100))
   then
   	echo "  🎉 ${blanc} ${u} Files Checked"
   else
	echo "  🎉 ${blanc} ${u} Files Checked"
   fi
if [ -e savenorme ]
then
while read line
do
	var1=$(echo $line | grep Error)
	if [[ `echo $line | grep -o "Error"` = "Error" ]]; then
		((error++))
		((errorinfile++))
	fi
	if [[ `echo $line | grep -o "Error"` = "Error" ]] && [[ "$var3" != "false" ]]; then
		printf "\n    💥 ${blanc} $var2 ${neutre}> ${rougefonce}$(echo $line | cut -c7-)"
		((ko++))
	fi
	if [[ `echo $line | grep -o "Norme"` = "Norme" ]]; then
		if (( $errorinfile > 0)); then printf "${blanc} + $errorinfile"; fi
		var2=$(echo $line | cut -c10-)
		var3=$(echo $line | cut -c10-)
		((errorinfile = -1))
	else
		var3="false"
		((ok++))
	fi
done < savenorme
fi
if (( $ko < 1 )); then
	echo "  👍 ${vertclair} ${u} Norminette OK\n\n"
	if [ -e savenorme ]
	then
		rm savenorme
fi
fi
if (( $ko > 0 )); then
	echo "\n\n   😰 ${rougefonce} ${ko} File(s) with ${error} norme(s) error\n     ${blanc}  /cat savenorme for more info\n"
fi

			break;;
        [Nn]* ) echo "\n${rougefonce} 😕 Norme not checked"
			sleep 1;
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)";;
    esac
done

 ##############################################################################################################

if [[ ${PWD##*/} == 'ft_printf' || ${PWD##*/} == 'printf' || ${PWD##*/} == 'my_printf' ]]
then
while true; do                                                 ## detection printf ??
	printf "\n${blanc} 📚 ${vertclair}PRINTF ${blanc}repo detected, do you want launch a tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/Tripouille/printfTester.git
			cd printfTester
			header
			printf "\n\n${blanc}Running Printf tester... ${neutre}\n\n     "
			sleep 2
			make
			while true; do                                                                   ## DEMANDE DE DETAILS tester printf ?
				printf "\n\n${blanc}Want to check bonus ? ${neutre}(y/n)\n\n     "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					header
					make b
					break;;
        		[Nn]* ) echo "\n${rougefonce} 😕 Printf Tester details ignored"
					sleep 1;
					header
					break;;
        		* ) header
					echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    			esac
			done
			cd ..
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf 42TESTERS-PRINTF
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done



##########################################################################################################################


elif [[ ${PWD##*/} == 'Cub3D' || ${PWD##*/} == 'cub3D' || ${PWD##*/} == 'cub3d' || ${PWD##*/} == 'CUB3D' ]]          ## Verification Cub3D
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}Cub3D ${blanc}repo detected, do you want launch ${vertclair} humblEgo ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/humblEgo/cub3D_map_tester.git
			cd cub3D_map_tester
			header
			printf "\n\n${blanc}Running Cub3D tester... ${neutre}\n\n     "
			sleep 2
			sh test_map_valid_function.sh
			cd ..
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf cub3D_map_tester
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

##########################################################################################################################

elif [[ ${PWD##*/} == 'LIBFT' || ${PWD##*/} == 'libft' || ${PWD##*/} == 'libft' || ${PWD##*/} == 'Libft' ]]          ## Verification Libft
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}Libft ${blanc}repo detected, do you want launch ${vertclair} alelievr ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			cd ..
			git clone https://github.com/alelievr/libft-unit-test.git
			cd libft-unit-test
			make
			header
			printf "\n\n${blanc}Running Cub3D tester... ${neutre}\n\n     "
			sleep 2
			./run_test
			cd ..
			while true; do                                                                   ## DEMANDE DE SPLIT tester Libft ?
				printf "\n\n${blanc}Do you want launch ${vertclair} Ysoroko ♥ GitHub ${blanc}SPLIT tester ? "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					cd libft
					git clone https://github.com/Ysoroko/FT_SPLIT_TESTER.git
					cd FT_SPLIT_TESTER
					make
					cd ..
					rm -rf FT_SPLIT_TESTER
					break;;
        		[Nn]* ) echo "\n${rougefonce} 😕 Split Tester ignored"
					sleep 1;
					header
					break;;
        		* ) header
					echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    			esac
			done
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf libft-unit-test
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

#######################################################################################################################

elif [[ ${PWD##*/} == 'GNL' || ${PWD##*/} == 'get_next_line' || ${PWD##*/} == 'GET_NEXT_LINE' || ${PWD##*/} == 'GNL' ]]          ## Verification GNL
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}GNL ${blanc}repo detected, do you want launch ${vertclair} Mazoise ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/Mazoise/42TESTERS-GNL.git
			cd 42TESTERS-GNL
			header
			printf "\n\n${blanc}Running GNL tester ... ${neutre}\n\n     "
			sh all_tests.sh
			read -n 1 -s -r -p "Press any key to continue to next test"
			sh runHUGE.sh
			read -n 1 -s -r -p "Press any key to continue to next test"
			sh runSTDIN+LEAKS.sh
			while true; do                                                                   ## DEMANDE DE Test GNL Bonus ?
				printf "\n\n${blanc}Do you want launch the bonus parts tests ? "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					sh all_tests_with_bonus.sh
					break;;
        		[Nn]* ) echo "\n${rougefonce} 😕 Bonus parts tester ignored"
					sleep 1;
					header
					break;;
        		* ) header
					echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    			esac
			done
			read -n 1 -s -r -p "Press any key to quit"
			rm -rf 42TESTERS-GNL
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

############################################################################################# TESTER PUSH_SWAP

elif [[ ${PWD##*/} == 'pushswap' || ${PWD##*/} == 'push_swap' || ${PWD##*/} == 'ft_push_swap' || ${PWD##*/} == 'PUSH_SWAP' ]]
then
while true; do
	printf "\n${blanc} 📚 ${vertclair}Push_swap ${blanc}repo detected, do you want launch ${vertclair}besellem ♥ GitHub ${blanc}tester ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			git clone https://github.com/besellem/push_swap.git tester_besellem
			cp -r tester_besellem/py tester
			make
			rm -rf tester_besellem
			header
			printf "\n\n${blanc}Enter the number of arguments you want to test for push_swap : "
			read -p " " args
			printf "\n\n${blanc}Running 50 tests for Push_swap with $args arguments... ${neutre}\n\n     "
			python3 tester/check_range.py 0 $args
			while true; do                                                                   ## DEMANDE DE refaire un test ?
				printf "\n\n${blanc}Want to continue with another arguments ? ${neutre}(y/n)\n\n     "
    			read -p " " yn
    			case $yn in
        		[Yy]* )
					header
					printf "\n\n${blanc}Enter the number of arguments you want to test for push_swap : "
					read -p " " args
					printf "\n\n${blanc}Running Push_swap tester with $args arguments... ${neutre}\n\n     "
					python3 tester/check_range.py 0 $args
					continue;;
				[Nn]* ) echo "\n${rougefonce} Exit tester..."
					header
					break;;
				* ) header
					echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
				esac
			done
			rm -rf tester
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
    esac
done

else
	printf "\n${blanc} Can't find a tester for your ${vertclair}${PWD##*/}${blanc} project :(\n\n"
	read -n 1 -s -r -p "Press any key to quit"
fi

clear

echo "\n${vertclair}       _  _  ____   ____ _               _               ____   ___ ____  _
     | || ||___ \ / ___| |__   ___  ___| | _____ _ __  |___ \ / _ \___ \/ |
     | || |_ __) | |   | '_ \ / _ \/ __| |/ / _ \ '__|   __) | | | |__) | |
     |__   _/ __/| |___| | | |  __/ (__|   <  __/ |     / __/| |_| / __/| |
        |_||_____|\____|_| |_|\___|\___|_|\_\___|_|    |_____|\___/_____|_| \n\n                            Made with ♥ by jcluzet\n"

fi
