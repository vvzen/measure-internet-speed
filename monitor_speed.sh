#!/bin/bash

# seconds
interval=900

while [ 1 ]; do

	today=`date "+%d_%m_%Y"`
	output_file=speed_test_monitor_$today.csv

	if [ ! -f $output_file ]; then
		echo "Creating csv file for $today"
		speedtest-cli --csv-header > $output_file
	fi

	echo "Running speed test at `date "+%H:%M"`"
	speedtest-cli --csv >> $output_file
	sleep $interval
done

