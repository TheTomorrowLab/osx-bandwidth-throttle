#!/bin/bash

LIMIT_TEXT="Kbytes/s"
LIMIT=$1$LIMIT_TEXT

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 1>&2
   exit 1
fi

case $1 in
	"stop")
		ipfw delete 1
		echo "Throttling Stopped" 1>&2
	;;
	"gprs")
		ipfw pipe 1 config bw 30$LIMIT_TEXT
		ipfw add 1 pipe 1 tcp from any to me
		echo "Throttling download to 30$LIMIT_TEXT" 1>&2
	;;
	"edge")
		ipfw pipe 1 config bw 200$LIMIT_TEXT
		ipfw add 1 pipe 1 tcp from any to me
		echo "Throttling download to 200$LIMIT_TEXT" 1>&2
	;;
	"3g")
		ipfw pipe 1 config bw 14000$LIMIT_TEXT
		ipfw add 1 pipe 1 tcp from any to me
		echo "Throttling download to 14000$LIMIT_TEXT" 1>&2
	;;
	"4g")
		ipfw pipe 1 config bw 3000000$LIMIT_TEXT
		ipfw add 1 pipe 1 tcp from any to me
		echo "Throttling download to 3000000$LIMIT_TEXT" 1>&2
	;;
	*)
		ipfw pipe 1 config bw $LIMIT
		ipfw add 1 pipe 1 tcp from any to me
		echo "Throttling download to $LIMIT" 1>&2
	;;
esac