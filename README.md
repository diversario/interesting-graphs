# Interesting Graphs

Make your test graphs look nice by consuming random amounts of CPU/memory/io/network:

```
docker run --rm diversario/interesting-graphs:0.0.1 150000 300000
```
the arguments define the range from which to pick the number used in the `2^$NUMBER` calculation. Adjust for your hardware.