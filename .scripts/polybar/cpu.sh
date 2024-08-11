#!/bin/bash

# Get CPU usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Get CPU temperature
cpu_temp=$(sensors | grep 'Package id 0:' | awk '{print $4}' | tr -d '+°C')

# Use 3 characters only.
usage_str=""
if (( $(echo "$cpu_usage< 10" | bc -l) )); then
    usage_str=$(echo "scale=2; $cpu_usage/10" | bc -l)
else
    usage_str=$(echo "scale=1; $cpu_usage/10" | bc -l)
fi

# Set the string color based on temperature
tmp_str=""
if (( $(echo "$cpu_temp>= 82" | bc -l) )); then
    tmp_str="%{F#FF173D}$cpu_temp"
elif (( $(echo "$cpu_temp>= 78.5" | bc -l) )); then
    tmp_str="%{F#FF702D}$cpu_temp"
elif (( $(echo "$cpu_temp>= 75" | bc -l) )); then
    tmp_str="%{F#FFB730}$cpu_temp"
elif (( $(echo "$cpu_temp>= 70" | bc -l) )); then
    tmp_str="%{F#AFDF20}$cpu_temp"
elif (( $(echo "$cpu_temp< 70" | bc -l) )); then
    tmp_str="%{F#0FD717}$cpu_temp"
fi

echo "$tmp_str°C %{F#E4E4F4}$usage_str%"
