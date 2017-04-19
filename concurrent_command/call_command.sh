#!/bin/bash
run_times=$4
for (( i=1; i <= $run_times; ++i ))
do
	echo "start process $3 in turn $i"
	# echo "xxxxxxxxxxxxxx -s $1 $2 > $3_$i.txt"
	echo "xxxxxxxxxxxxxx -s $1 $2 > $3.txt"
	start_time=$(date +"%s")
	# xxxxxxxxxxxxxx -s $1 $2 > $3_$i.txt
	xxxxxxxxxxxxxx -s $1 $2 > $3.txt
	ret=$?
	end_time=$(date +"%s")

	start_time_str="`date -d @$start_time +%Y-%m-%dT%H:%M:%S`"
	end_time_str="`date -d @$end_time +%Y-%m-%dT%H:%M:%S`"
	elapse=$(expr $end_time - $start_time)
	#echo "($3_$i) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" > $3_$i_result.txt
	echo "($3_$i) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" >> result.txt
	if [ "$ret" != '0' ]; then
	   echo "($3_$i) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" >> err.txt
	   break
	fi
	if [ -s "err.txt" ]; then
      break
    fi
done