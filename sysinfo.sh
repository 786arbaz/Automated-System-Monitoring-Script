#!/bin/bash
# Basic System Parameters Check Script

# Function to check CPU usage
check_cpu() {
  cpu_usage=$(top -bn1 | awk '/Cpu/ { print $2}')
  echo "CPU Usage: ${cpu_usage}%"
}

# Function to check memory usage
check_memory() {
  mem_usage=$(free -m | awk '/Mem/{print $3}')
  echo "Memory Usage: ${mem_usage} MB"
}

# Function to check disk space
check_disk() {
  disk_usage=$(df -h / | awk '/\// {print $5}')
  echo "Disk Space Usage: ${disk_usage}"
}

# Function to check network connectivity
check_network() {
  ping -c 1 google.com > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo "Network Connectivity: Connected"
  else
    echo "Network Connectivity: Disconnected"
  fi
}

# Main loop
while :
do
  echo "------------------------"
  check_cpu
  check_memory
  check_disk
  check_network
  echo "------------------------"

  # Sleep for 5 seconds
  sleep 5
done
