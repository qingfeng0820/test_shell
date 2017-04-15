#!/bin/bash
echo "uemcli -sslPolicy store -noheader -u local/admin -p Password123! -d $1 $2 > $3_$4.txt"
start_time=$(date +"%s")
start_time_str="`date -d @$start_time +%Y-%m-%dT%H:%M:%S`"
uemcli -sslPolicy store -noheader -u local/admin -p Password123! -d $1 $2 > $3_$4.txt
ret=$?
end_time=$(date +"%s")
end_time_str="`date -d @$end_time +%Y-%m-%dT%H:%M:%S`"
elapse=$(expr $end_time - $start_time)
echo "($3_$4) Start: $start_time_str, End: $end_time_str, Elapse: $elapse s, Return code: $ret" > $3_$4_result.txt
