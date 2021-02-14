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
inall=0
ok=0
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
        |_||_____|\____|_| |_|\___|\___|_|\_\___|_|    |_____|\___/_____|_| ${neutre}\n"

}

header

if [ -e savenorme ]
then
	rm savenorme
fi


while true; do                                                 ## DEMANDE DE CHECKHEADER
	printf "\n${blanc} 📝 Do you want to check header? (y/n)\n\n"
    read -p " " yn
    case $yn in
        [Yy]* )
			echo "\n${vertfonce} --- HeaderCheck --- ${neutre}\n"
			echo " ${blanc}📝 Created by :${vertclair}\n"
			grep -H -r --include \*.c "Created:" $@ | awk '{print $6}' | sort | uniq; echo
			echo " ${blanc}💻 Updated by :${vertclair}\n"
			grep -H -r --include \*.c "Updated:" $@ | awk '{print $6}' | sort | uniq
			break;;
        [Nn]* ) echo "\n${rougefonce} 😕 Header not checked"
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



echo "\n${vertfonce} --- NormeCheck --- ${neutre}\n"


for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h")
 do
	((inall++))
done

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

for fichier in $(find $@ -type f -iname "*.c" -o -iname "*.h")
 do
   ~/.norminette/norminette.rb $fichier >> savenorme
   if (( $u < 10 ))
   then
   	printf "${nombreb4}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Checked"
   elif (( $u < 100))
   then
   	printf "${nombreb4}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Checked"
   else
	printf "${nombreb4}\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b${sp:i++%${#sp}:1} ${u}/${inall} Files Checked"
   fi
   ((u++))
done

printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"

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
	echo "   👍 ${vertclair} ${u} Norminette OK"
	if [ -e savenorme ]
	then
		rm savenorme
fi
fi
if (( $ko > 0 )); then
	echo "\n\n   😰 ${rougefonce} ${ko} File(s) with ${error} norme(s) error\n     ${blanc}  /cat savenorme for more info"
fi
