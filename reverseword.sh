#!/bin/bash 

debug=1

function debug() {
    
    if [ "$debug" -eq "1" ]
    then
	date_log=`date +%r`
	echo "$date_log : $@"
    fi
    
}


function reverse_word(){

    word=`echo $1`

    while [ -z "$word" ]
    do
	echo -n "Provee una palabra porfavor: "
	read word
    done
    
    debug $word
    
    i=0
    reverse=""
    let total=${#word}-1


    while [ $i -le $total ]
    do
	reverse="$reverse`echo ${word:$total:1}`"
	let total=$total-1
    done
    
    echo "La palabra $word , su inversa es: $reverse"
}


reverse_word $1