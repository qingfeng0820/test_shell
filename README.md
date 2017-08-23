# test_shell
Command performance test srcipts:

concurrent_command/test.sh "your_command" process_num_in_parallel run_times


Example:

concurrent_command/test.sh "ls" 10 10
It will run "ls" command with 10 processes in parallel, and eacho process will run the command for 10 times

Results:

Results will be logged in perf.result.txt. 
If there is error occured, it will be logged in perf.err.log.
perf.1.txt means the response from running the command in the first process. 
All logs will be refreshed for each execution.

