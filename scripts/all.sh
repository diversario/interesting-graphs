#!/bin/sh
set -x
# continuously use random amount of CPU with random 0 to 5 second sleep in between
cpus=$(nproc)

while true; do
  timeout=$(shuf -i 1-3 -n 1)
  memory_timeout=$(shuf -i 1-3 -n 1)
  fs_timeout=$(shuf -i 1-10 -n 1)
  cpu_timeout=$(shuf -i 1-5 -n 1)
  sleep=$(shuf -i 1-10 -n 1)

  echo "
stress-ng --class io --all 1 --timeout $fs_timeout
stress-ng --class memory --all 1 --timeout $memory_timeout
" > stress-commands
# stress-ng --class cpu --cpu-load 10 --all 1 --timeout $cpu_timeout

  parallel -j $cpus < stress-commands > /dev/null

  sleep $sleep
done