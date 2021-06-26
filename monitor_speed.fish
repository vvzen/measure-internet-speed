#!/usr/bin/env fish

# seconds
set interval 900

if not type -qs speedtest-cli
	echo "Please install speedtest-cli before running this utility!"
	echo "--> https://github.com/sivel/speedtest-cli"
	exit 1
end

if not test -d data
	mkdir data
end

while true
	set today (date "+%d_%m_%Y")
	set output_file "data/speed_test_monitor_$today.csv"

	if test -f $output_file
		echo "Creating csv file for" $today
		speedtest-cli --csv-header > $output_file
	end

	echo "Running speed test at" (date "+%H:%M")
	speedtest-cli --csv >> $output_file
	sleep $interval
end

