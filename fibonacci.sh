#!/bin/bash

debug=1


function debug() {
    
    if [ "$debug" -eq "1" ]; then 
	log_date=`date +%r`
	echo "$log_date : $@"
    fi
    
}


function fibonacci(){

    debug ${FUNCNAME[0]}
    
    number=`echo $1`
    
    sum=0
    last1=0
    last2=1

    

    while [ -z "$number" ]
    do
	echo -n "Es necesario tener un number. Dame un numero: "
	read number
    done

    for i in `seq 1 $number`
    do 
	let sum=$last1+$last2
	let last1=$last2
	let last2=$sum
    done
    
    echo "Solucion: $last1"

  #  fi

}

#calling fuctions.

fibonacci $1
