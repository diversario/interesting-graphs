#!/bin/sh

# continuously use random amount of CPU with random 0 to 5 second sleep in between
cpus=$(nproc)

from=${1:-50000}
to=${2:-500000}

while true; do
  for i in $(seq 1 $cpus); do
    power=$(shuf -i $from-$to -n 1)
    echo "echo \"2^$power\" | bc" >> commands
    echo "Calculating: $(cat commands)"
  done

  idle=$(echo "$(shuf -i 0-5 -n 1).$(shuf -i 1-9 -n 1)")

  parallel -j $cpus < commands > /dev/null
  echo '' > commands

  sleep $idle
done