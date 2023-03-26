#!/bin/bash
## Take input from user for IP Address Network
echo "........................."
echo "...:Scanning IP Range:..."
echo "........................."

if [ "$1" == "" ]
	then
	echo "You forgot an IP address!"
	echo "Syntax: ./ipSweep.sh 192.168.1"
else
	echo "$(date)" >> iplist.txt &
	for ip in `seq 1 254`; do
	ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
	ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> iplist.txt &
done
fi
echo "........................."
echo " "

