#!/bin/sh

# continuously use random amount of CPU with random 0 to 5 second sleep in between

from=${1:-50000}
to=${2:-300000}

while true; do
  power=$(shuf -i $from-$to -n 1)
  idle=$(echo "$(shuf -i 0-5 -n 1).$(shuf -i 1-9 -n 1)")

  echo "Calculating 2 to the power of $power, then sleeping for $idle sec"
  echo "2^$power" | bc > /dev/null

  sleep $idle
done