# test_shell
Command performance test srcipts:

concurrent_command/test.sh "your_command" process_num_in_parallel run_times

Default process_num_in_parallel is 10.

Default run_times is 1.


Example:

concurrent_command/test.sh "ls" 10 10

It will run "ls" command with 10 processes in parallel, and each process will run the command for 10 times


Results:

Results will be logged in perf.result.txt. 

If there is error occured, it will be logged in perf.err.log.

perf.1.txt means the response from running the command in the first process (The log for each process will only keep the response for the last time) .

All logs will be refreshed for each execution.

