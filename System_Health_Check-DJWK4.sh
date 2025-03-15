#!/bin/bash
# Douglas Schuurman
# SP25 Week 4 Tool Dev Exercise
#Notes / Reference

echo "System Uptime: $(uptime -p)"
echo "Available Disk Space: "
df -h | grep '^/'
echo "Available RAM: "
free -m | awk 'NR==2{print $7 "MB Free"}'