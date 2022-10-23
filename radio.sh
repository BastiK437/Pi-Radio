#!/bin/bash

sudo gpioset --bias=pull-up gpiochip0 26=1
bttn_event=0
bttn_old=1
radio_running=0

while [ true ]
do
	bttn=$(sudo gpioget gpiochip0 26)

	if [[ $bttn -eq 0 && $bttn != $bttn_old ]]
	then
		bttn_event=1
		bttn_old=$bttn
	elif [[ $bttn -eq 1 && $bttn != $bttn_old ]]
	then
		bttn_old=$bttn
	fi

	if [ $bttn_event -eq 1 ]
	then
		echo "button event"
		if [ $radio_running -eq 0 ]
		then
			echo start radio
			mplayer https://wdr-1live-live.icecastssl.wdr.de/wdr/1live/live/mp3/128/stream.mp3 &
			radio_running=1
		else
			echo close radio
			pid=$(ps -ef | grep 'mplayer' | grep -v 'grep' | awk '{ printf $2 }')
			kill $pid
			radio_running=0
		fi
		bttn_event=0
	fi

	sleep 0.2
done

