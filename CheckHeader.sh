# **************************************************************************** #i
#                                                                              #
#                                                         :::      ::::::::    #
#    CheckHeader.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jo@cluzet.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 00:44:50 by jcluzet           #+#    #+#              #
#    Updated: 2021/02/14 19:22:43 by jocluzet         ###   ########.fr        #
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
errorinfile=-1
error=0
inallancien=0
inall=0
ok=0
ignorefiles="vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32"
ignorefilesdeux="vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32"
ko=0
sp="Fichiers"
sp="🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛"


clear

echo "\n${vertclair} Check for update... ${neutre}\n"        !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	git -C ~/.42Checker_2021 fetch origin
	git -C ~/.42Checker_2021 pull
		# printf "   ${blanc}Installation of ${version} completed 🎉 ${vertfonce}${version} ${neutre}> Please relaunch with /42check ${vertclair}"
	version=$(git -C ~/.42Checker_2021 reset --hard | cut -c30-)
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
	printf "                                         ${vertclair}${PWD##*/} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi

if [[ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]] && [[ $ignorefilesdeux = 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]]
	then
	printf "                                         ${vertclair}${PWD##*/}${blanc} without ${rougefonce}${ignorefiles} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi

if [[ $ignorefiles != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]] && [[ $ignorefilesdeux != 'vdin3irn3dubhwbuy3bru2ruy23b32uyrv23bur32' ]]
	then
	printf "                                         ${vertclair}${PWD##*/}${blanc} without ${rougefonce}${ignorefiles}${blanc}, ${rougefonce}${ignorefilesdeux} ${blanc}> ${vertclair}${inall} ${blanc}Files${neutre} 🔦"
fi
printf "\n"

}

for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}")
 do
	((inall++))
done

header

if [ -e savenorme ]
then
	rm savenorme
fi

while true; do                                                                                    ## DEMANDE DE CHECKALL ?
	printf "\n${blanc} 📚 Do you want to check ${rougefonce}ALL ${blanc}files ${neutre}(*.c & *.h)${blanc} in ${vertclair}${PWD##*/}${blanc}? (y/n)\n\n"
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			printf "\n${blanc} 📚 Do you want to check ${rougefonce}ALL ${blanc}files in ${vertclair}${PWD##*/}${blanc} ? (y/n)\n"
			echo "\n   ${vertclair} 📦 ${inall} files in ${PWD##*/} are well imported"
			break;;
        [Nn]* )
			header
			printf "\n${blanc} 📚 What repertory do you want to ignore in ${vertclair}${PWD##*/}${blanc} ? \n \n     "
			read ignorefiles
			inallancien=$inall
			inall=0
			for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/")
 			do
				((inall++))
			done
			ignorefiles2=$(($inallancien-$inall))
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} and ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n"



while true; do                                                 ## ignore plus ??
	printf "${blanc} 📚 Do you want to ignore more repertory ? (y/n)\n\n        "
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} and ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n      "
			printf "\n${blanc} 📚 What repertory do you want to ignore in ${vertclair}${PWD##*/}${blanc} ? \n\n      "
			printf "         "
			read ignorefilesdeux
			inall=0
			for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}/" | grep -v "^./${ignorefilesdeux}/")
 			do
				((inall++))
			done
			ignorefiles3=$(($inallancien-$inall))
			header
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc}, ${vertclair}${ignorefilesdeux} ${blanc}and ${ignorefiles3} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n      "
			break;;
        [Nn]* )
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)"
			printf "\n${vertclair} 📚 ${ignorefiles}${blanc} and ${ignorefiles2} files will be ignored of ${vertclair}${PWD##*/}${blanc}\n\n";;
    esac
done





			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)";;
    esac
done


while true; do                                                 ## DEMANDE DE CHECKHEADER
	printf "\n${blanc} 📝 Do you want to check header? (y/n)\n\n"
    read -p " " yn
    case $yn in
        [Yy]* )
			header
			echo "\n ${blanc}   📝 Header Created by :${vertclair}\n"
			printf "         "
			grep -H -r --include \*.c "Created:" $@ | awk '{print $6}' | sort | uniq; echo
			echo " ${blanc}   💻 Header Updated by :${vertclair}\n"
			printf "        "
			grep -H -r --include \*.c "Updated:" $@ | awk '{print $6}' | sort | uniq
			break;;
        [Nn]* ) echo "\n${rougefonce} 😕 Header not checked"
			sleep 1;
			header
			break;;
        * ) header
			echo "\n${rougefonce}                                            ❌ Please enter yes or no (y/n)";;
    esac
done

while true; do                                                 ## DEMANDE DE CHECKNORME
	printf "\n${blanc} 🐈‍ Do you want to check norminette? (y/n)\n\n"
    read -p " " yn
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
for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h" | grep -v "^./${ignorefiles}")
 do
   ~/.norminette/norminette.rb $fichier >> savenorme
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
	echo "  🎉 ${blanc} ${u}Files Checked"
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

# options=("Option 1" "Option 2" "Option 3" "Quit")            # MENU
# select opt in "${options[@]}"
# do
#     case $opt in
#         "Option 1")
#             echo "you chose choice 1"
#             ;;
#         "Option 2")
#             echo "you chose choice 2"
#             ;;
#         "Option 3")
#             echo "you chose choice $REPLY which is $opt"
#             ;;
#         "Quit")
#             break
#             ;;
#         *) echo "invalid option $REPLY";;
#     esac
# done
