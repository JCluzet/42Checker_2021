# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    CheckHeader.sh                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jcluzet <jo@cluzet.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/13 00:44:50 by jcluzet           #+#    #+#              #
#    Updated: 2021/02/13 06:57:18 by jcluzet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

rougefonce='\x1B[0;31m'
vertfonce='\x1B[0;32m'
vertclair='\x1B[1;32m'
orange='\x1B[0;33m'
blanc='\x1B[1;37m'
neutre='\x1B[0;m'

clear

echo "\n${vertclair} ### 42Checker_2021 by JCluzet ### ${neutre}\n"

echo "\n${vertfonce} --- NormeCheck --- ${neutre}\n"

rm savenorme
i=6
u=0
error=0
inall=0
ok=0
ko=0
sp="Fichiers"
sp="🕐🕑🕒🕓🕔🕕🕖🕗🕘🕙🕚🕛"

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
   	echo "  🎉 ${blanc} ${u} Files Checked\n"
   elif (( $u < 100))
   then
   	echo "  🎉 ${blanc} ${u} Files Checked\n"
   else
	echo "  🎉 ${blanc} ${u}Files Checked\n"
   fi

while read line
do
	var1=$(echo $line | grep Error)
	if [[ `echo $line | grep -o "Error"` = "Error" ]]; then
		((error++))
	fi
	if [[ `echo $line | grep -o "Error"` = "Error" ]] && [[ "$var3" != "false" ]]; then
		echo " 💥 ${blanc} $var2 ${neutre}>${rougefonce}$(echo $line | cut -c7-)"
		((ko++))
	fi
	if [[ `echo $line | grep -o "Norme"` = "Norme" ]]; then
		var2=$(echo $line | cut -c10-)
		var3=$(echo $line | cut -c10-)
	else
		var3="false"
		((ok++))
	fi
done < savenorme

if (( $ko < 1 )); then
	echo "   👍 ${vertclair} ${ok} Norminette OK"
	rm savenorme
fi
if (( $ko > 0 )); then
	echo "\n   😰 ${rougefonce} ${ko} File(s) with ${error} norme(s) error\n     ${blanc}  /cat savenorme for more info"
fi

echo "\n${vertfonce} --- HeaderCheck --- ${neutre}\n"

echo " ${blanc}📝 Created by :${vertclair}\n"
grep -H -r --include \*.c "Created:" $@ | awk '{print $6}' | sort | uniq; echo
echo " ${blanc}💻 Updated by :${vertclair}\n"
grep -H -r --include \*.c "Updated:" $@ | awk '{print $6}' | sort | uniq;

echo "\n"