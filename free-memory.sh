#!/bin/bash

# Threshold for free memory (in percentage)
threshold=10

# Get total and available memory in MB
total_memory=$(free -m | awk 'NR==2 {print $2}')
available_memory=$(free -m | awk 'NR==2 {print $7}')

# Calculate percentage of free memory
free_mem_percent=$(( available_memory * 100 / total_memory ))

# Print values
echo "Total Memory: ${total_memory} MB"
echo "Available Memory: ${available_memory} MB"
echo "Free Memory: ${free_mem_percent}%"

# Compare with threshold
if [ "$free_mem_percent" -lt "$threshold" ]; then
    echo "ALERT: Free memory is below threshold ${threshold}%!"
else
    echo "Memory usage is safe."
fi
