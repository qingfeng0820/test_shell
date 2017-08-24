#!/bin/bash
concurrent_process_num=10
run_times=1
command_str="ls"

if [ -n "$1" ]; then
   command_str=$1
fi

if [ -n "$2" ]; then
   concurrent_process_num=$2
fi

if [ -n "$3" ]; then
   run_times=$3
fi

SCRIPTPATH=$(dirname "$0")

log_prefix="perf"
err_log_file="$log_prefix.err.txt"
result_log_file="$log_prefix.result.txt"
summary_log_file="$log_prefix.summary.txt"

if [ -f $result_log_file ]; then
   rm $result_log_file
fi

if [ -f $err_log_file ]; then
   rm $err_log_file
fi

if [ -f $summary_log_file ]; then
   rm $summary_log_file
fi

for (( j=1; j <= concurrent_process_num; ++j ))
do
   #bash -c "$command_str" &
   $SCRIPTPATH/call_command.sh "$command_str" $j $run_times &
done

wait

if [ -f $result_log_file ]; then
    $SCRIPTPATH/aggregate.awk $result_log_file  > $summary_log_file
fi
