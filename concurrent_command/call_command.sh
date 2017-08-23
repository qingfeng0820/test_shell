#!/bin/bash
run_times=$3
log_prefix="perf"
for (( i=1; i <= $run_times; ++i ))
do
	echo "start process $2 in turn $i"
	# echo "$1 => $log_prefix.$2_$i.txt"
	echo "$1 > $log_prefix.$2.txt"
	start_time=$(date +"%s.%3N")
	# $1 > $log_prefix.$2_$i.txt
	eval "$1 > $log_prefix.$2.txt"
	ret=$?
	end_time=$(date +"%s.%3N")

	start_time_str="`date -d @$start_time +%Y-%m-%dT%H:%M:%S.%3N`"
	end_time_str="`date -d @$end_time +%Y-%m-%dT%H:%M:%S.%3N`"
	elapse=`echo "$end_time - $start_time" | bc -l`
	#echo "($2_$i) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" > $log_prefix.$2_$i_result.txt
	echo "($2_$i) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" >> $log_prefix.result.txt
	if [ "$ret" != '0' ]; then
	   echo "($2_$i) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" >> $log_prefix.err.txt
	   break
	fi
	if [ -s "$log_prefix.err.txt" ]; then
      break
    fi
done