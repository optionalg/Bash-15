#!/bin/bash

debug=1

function debug() {

    if [ "$debug" -eq "1" ]; then 
	log_date=`date +%r`
	echo "$log_date : $@"
    fi
}


function palindrome() {
    debug ${FUNCNAME[0]}
    
    word_temp=`echo $1`
    word=`echo $1 | tr '[:upper:]' '[:lower:]'`

    while [ -z "$word" ]
    do
	echo -n "Por favor provee una palabra: "
	read word
    done
    
    let mid=`echo ${#word}`/2
    let total=`echo ${#word}`-1

    debug "total is: $total"
       
    for i in `seq 0 $mid`
    do
	first=`echo ${word:$i:1}`
	debug "first: $first $i"
	
	last=`echo ${word:$total:1}`
	debug "last: $last $total"

	if [ "${first}" = "${last}" ]
	then 
	    let total=$total-1
	else
	    echo "La palabra no es palindrome."
	    exit 1
	fi

    done
	
    echo "La palabra es palindrome"

}

#call functions

palindrome $1