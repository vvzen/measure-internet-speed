#!/bin/bash

# seconds
interval=900

if [ ! `command -v speedtest-cli` ]; then
	echo "Please install speedtest-cli before running this utility!"
	echo "--> https://github.com/sivel/speedtest-cli"
	exit 1
fi

if [ ! -d data ]; then
	mkdir data
fi

while [ 1 ]; do
	today=`date "+%d_%m_%Y"`
	output_file="data/speed_test_monitor_$today.csv"

	if [ ! -f $output_file ]; then
		echo "Creating csv file for $today"
		speedtest-cli --csv-header > $output_file
	fi

	echo "Running speed test at `date "+%H:%M"`"
	speedtest-cli --csv >> $output_file
	sleep $interval
done

