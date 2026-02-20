#!/bin/bash

echo "=============================================="
echo "        SERVER PERFORMANCE STATISTICS        "
echo "=============================================="
echo ""

# ------------------------------
# CPU Usage
# ------------------------------
echo "🔹 Total CPU Usage:"
top -bn1 | grep "Cpu(s)" | \
awk '{print "CPU Usage: " 100 - $8 "%"}'
echo ""

# ------------------------------
# Memory Usage
# ------------------------------
echo "🔹 Memory Usage:"
free -m | awk 'NR==2{
    total=$2;
    used=$3;
    free=$4;
    printf "Total: %s MB\nUsed: %s MB\nFree: %s MB\nUsage: %.2f%%\n",
    total, used, free, used*100/total
}'
echo ""

# ------------------------------
# Disk Usage
# ------------------------------
echo "🔹 Disk Usage:"
df -h --total | grep 'total' | awk '{
    printf "Total: %s\nUsed: %s\nFree: %s\nUsage: %s\n",
    $2, $3, $4, $5
}'
echo ""

# ------------------------------
# Top 5 Processes by CPU
# ------------------------------
echo "🔹 Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
echo ""

# ------------------------------
# Top 5 Processes by Memory
# ------------------------------
echo "🔹 Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
echo ""

echo "=============================================="
