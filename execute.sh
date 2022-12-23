#!/bin/bash

if [ ! -f /polls.txt ]; then
	echo "polls.txt file needed"
	exit	    
fi


rows=$(cat polls.txt | wc -l)
sleeptime=$(( $POLLTIME / $rows))
while true
do
	while read address divide name; 
	do 
		value=$(./getaddress.sh --address $address --host $NIBEHOST --divide $divide;)
		mosquitto_pub -t "nibe/$name" -p $MQTT_PORT -h $MQTT_HOST -m $value
		sleep ${sleeptime}s
	done < polls.txt
	sleep ${sleeptime}s
done
