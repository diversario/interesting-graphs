#!/bin/sh

# continuously use random amount of CPU with random 0 to 5 second sleep in between
cpus=$(nproc)

from=${1:-50000}
to=${2:-500000}

max_file_size=${3:-1000000000}
max_mem_size=${4:-1000000000}

while true; do
  for i in $(seq 1 $cpus); do
    power=$(shuf -i $from-$to -n 1)
    echo "echo \"2^$power\" | bc" >> commands
    echo "Calculating: $(cat commands)"
  done

  parallel -j $cpus < commands > /dev/null

  file_size=$(shuf -i 1 $max_file_size -n 1)

  idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  dd count=$file_size if=/dev/urandom of=/dev/null

  idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  mem_size=$(shuf -i 1 $max_mem_size -n 1)

  memory=$(dd count=$mem_size if=/dev/urandom)

  idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  echo '' > commands
  # echo '' > /tmp/bigfile

  memory=''
done