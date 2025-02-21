#!/bin/bash
#Name: Douglas Schuurman
#Date: 2/20/2025
#Class: ISS212
#Assignment: Week 3 Assignment 3
#Notes For Professor / Resources Used
#Utilized ChatGPT for debugging and assistance. This specific one gave me a lot of issues when writing it
#I kept trying to use python logic which messed up my bash stuff on this one


# Input the IP and Port Ranges
echo -e "When running more than 10-15 ports, note that it is resource-heavy and will take a long time.\n"
read -p "Enter the IP Address: " target_ip
read -p "Enter the starting port: " starting_port
read -p "Enter the port to end with: " end_port

# Error checking to see if the starting port is smaller than the end port. Fails if starting port is greater than the end port.
if [[ "$starting_port" -gt "$end_port" ]]; then
  echo "Error: Starting port cannot be greater than the ending port."
  exit 1
fi

echo "Scan has started for $target_ip, checking ports $starting_port to $end_port."
echo ""

# Loop through the ports checking for open ports
for (( port=$starting_port; port<=$end_port; port++ )); do
  # PowerShell command to check the ports
  pwsh.exe -Command "
  try {
    \$tcpConnection = Test-NetConnection -ComputerName $target_ip -Port $port
    if (\$tcpConnection.TcpTestSucceeded) {
      Write-Host 'Port $port is open'
    }
  } catch {
    Write-Host 'Port $port is closed'
  }"
done

echo"Test to see if I got to this line as my window keeps closing"
read -p "Press Enter to exit..."

