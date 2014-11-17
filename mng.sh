#!/bin/bash
#Mobie numbers generte
red='\e[0;31m'
cyan='\e[0;36m'
grean='\e[0;32m'
nc='\e[0m'
function goto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}
#main:
PS3='Please enter item number: '
options=("Show in terminal" "Export to txt file" "Export with VCard format" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Show in terminal")
            echo "First 4 digits ? (e.x 0917 )"
			read first
			echo "Second 3 digits ? (e.x 831 )"
			read second
			for i in $(seq 0 9999)
				do 
					num=$( printf '%04d' $i )
					echo $first$second$num
					
				done 
			echo -e "${grean}End${nc}"
			goto main
            ;;
        "Export to txt file")
            echo "First 4 digits ? (e.x 0917 )"
			read first
			echo "Second 3 digits ? (e.x 831 )"
			read second
			echo "Where File Save ? (e.x /home/john/num.txt)"
			read dir
			for i in $(seq 0 9999)
				do 
					num=$( printf '%04d' $i )
					echo $first$second$num >> $dir
				done
			echo -e "${grean}File successfully saved${nc}"
			goto main
            ;;
        "Export with VCard format")
            echo "First 4 digits ? (e.x 0917 )"
			read first
			echo "Second 3 digits ? (e.x 831 )"
			read second
			echo "Where File Save ? (e.x /home/john/num.vcf)"
			read dir
			for i in $(seq 0 9999)
				do 
					num=$( printf '%04d' $i )
					echo -e	"BEGIN:VCARD \nVERSION:2.1\nN:;$first$second$num;;;\nFN:$first$second$num\nTEL;CELL:\nEND:VCARD" >> $dir		
				done
			echo -e "${grean}File successfully saved${nc}"
			goto main
            ;;
        "Quit")
			echo -e "${cyan}Thanks for using ;)${nc}"

            break
            ;;
        *) echo invalid option;;
    esac
done
