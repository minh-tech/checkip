#!/bin/bash


echo "Hi! Which IP address do you want to know?"
echo "1. Your REAL public ip address"
echo "2. Your FAKE public ip address"
echo "0. Exit"

first=0

while :
do
	if [ $first -eq 0 ] ; then
		first=1
	else
		echo
		printf "Please input again: "
	fi

	read order

	if [ $order -eq 1 ] ; then
		printf "Your REAL public ip: "
		dig +short myip.opendns.com @resolver1.opendns.com
	else
		if [ $order -eq 2 ] ; then
			printf "Your FAKE public ip: "
			torsocks wget -qO- http://ipecho.net/plain | xargs echo
		else
			exit 1
		fi
	fi

done
