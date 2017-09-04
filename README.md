# Command performance test srcipts


# Prepare
chmod +x concurrent_command/test.sh

chmod +x concurrent_command/call_command.sh

chmod +x concurrent_command/aggregate.awk

# Usage

./concurrent_command/test.sh "your_command" process_num_in_parallel run_times error_occured_break

Default process_num_in_parallel is 10.

Default run_times is 1.

Default error_occured_break is true (means test will be terminated if command failed)

# Example

./concurrent_command/test.sh "ls" 10 10

It will run "ls" command with 10 processes in parallel, and each process will run the command for 10 times

Can test http request via curl command:
./concurrent_command/test.sh 'curl -X GET -k -s -f -L -b cookie.txt -c cookie.txt -H  "xxx:xxx" -u xxx:xxxxx https://xxxx' 10 10


# Results

All execution status results will be logged in perf.result.txt (If there is error occured, it will be logged in perf.err.log as well).

The average result for each run will be logged in perf.summary.txt.

The command response for each process will be logged as well. 
perf.1.txt for logging the response ffrom the first process.
But the log for each process will only keep the response for the last time.

All logs will be refreshed for each execution, so if you need the old test log, need to back up them before kick off a new test.

