#!/bin/bash
# echo "xxxxxxxxxxxxxx -s $1 $2 > $3_$4.txt"
echo "xxxxxxxxxxxxxx -s $1 $2 > $3.txt"
start_time=$(date +"%s")
# xxxxxxxxxxxxxx -s $1 $2 > $3_$4.txt
xxxxxxxxxxxxxx -s $1 $2 > $3.txt
ret=$?
end_time=$(date +"%s")

start_time_str="`date -d @$start_time +%Y-%m-%dT%H:%M:%S`"
end_time_str="`date -d @$end_time +%Y-%m-%dT%H:%M:%S`"
elapse=$(expr $end_time - $start_time)
#echo "($3_$4) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" > $3_$4_result.txt
echo "($3_$4) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" >> result.txt
if [ "$ret" != '0' ]; then
   echo "($3_$4) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" >> err.txt
fi