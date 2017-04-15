#!/bin/bash
server_ip="10.141.41.169"
concurrent_process_num=10
run_times=1
command_str="test"

if [ -n "$1" ]; then
   server_ip=$1
fi

if [ -n "$2" ]; then
   concurrent_process_num=$2
fi

if [ -n "$3" ]; then
   run_times=$3
fi

if [ -n "$4" ]; then
   command_str=$4
fi

for (( i=1; i <= $run_times; ++i ))
do
   for (( j=1; j <= concurrent_process_num; ++j ))
   do
      echo "start process $j in turn $i"  
      #bash -c "$command_str" &
      ./call_command.sh $server_ip "$command_str" $j $i &
   done

   wait
done



