#!/bin/sh

cpus=$(nproc)

while true; do
  stress-ng --cpu $cpus --cpu-load $(shuf -i 1 $(echo $cpus)00 -n 1) --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  stress-ng --matrix $cpus --matrix-size 64 --tz --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  stress-ng --merge-sort $cpus --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  stress-ng --zlib $cpus --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  stress-ng -hdd $cpus --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  stress-ng --io $cpus --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  # stress-ng --shm 1 --shm-bytes 1000000000 --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  # stress-ng --mmap 1 --mmap-bytes 2000000000 --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  # stress-ng --malloc 1 --malloc-bytes 4000000000 --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle
  stress-ng --udp $cpus --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  # stress-ng --vm 8 --vm-bytes 4G --mmap 2 --mmap-bytes 4G --page-in --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle

  # stress-ng --brk 8 --stack 8 --bigheap 8 --bigheap-growth 200M --timeout $(echo "$(shuf -i 0-10 -n 1).$(shuf -i 1-9 -n 1)")
  # idle=$(echo "$(shuf -i 0-20 -n 1).$(shuf -i 1-9 -n 1)"); sleep $idle
  stress-ng --malloc 8 --malloc-bytes 90% --timeout $(echo "$(shuf -i 1-20 -n 1).$(shuf -i 1-9 -n 1)")
done